<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.inicis.std.util.SignatureUtil"%>
<%@page import="java.util.*"%>
<%

	/*
		//*** 위변조 방지체크를 signature 생성 ***

			oid, price, timestamp 3개의 키와 값을

			key=value 형식으로 하여 '&'로 연결한 하여 SHA-256 Hash로 생성 된값

			ex) oid=INIpayTest_1432813606995&price=819000&timestamp=2012-02-01 09:19:04.004
				

			 * key기준 알파벳 정렬

			 * timestamp는 반드시 signature생성에 사용한 timestamp 값을 timestamp input에 그대로 사용하여야함
	*/

	//############################################
	// 1.전문 필드 값 설정(***가맹점 개발수정***)
	//############################################

	// 여기에 설정된 값은 Form 필드에 동일한 값으로 설정
//	String mid					= "INIpayTest";		// 가맹점 ID(가맹점 수정후 고정)
	String mid					= "aldainccok";
	
	//인증
//	String signKey			    = "SU5JTElURV9UUklQTEVERVNfS0VZU1RS";	// 가맹점에 제공된 웹 표준 사인키(가맹점 수정후 고정)
	String signKey			    = "V25RNzRVSFJLSWQxMmtCNHJGdHlnZz09";
//	String timestamp			= SignatureUtil.getTimestamp();			// util에 의해서 자동생성

//	String oid					= mid+"_"+SignatureUtil.getTimestamp();	// 가맹점 주문번호(가맹점에서 직접 설정)
//	String price				= "1000";													// 상품가격(특수기호 제외, 가맹점에서 직접 설정)

	String cardNoInterestQuota	= "11-2:3:,34-5:12,14-6:12:24,12-12:36,06-9:12,01-3:4";		// 카드 무이자 여부 설정(가맹점에서 직접 설정)
	String cardQuotaBase		= "2:3:4:5:6:11:12:24:36";		// 가맹점에서 사용할 할부 개월수 설정

	//###############################################
	// 2. 가맹점 확인을 위한 signKey를 해시값으로 변경 (SHA-256방식 사용)
	//###############################################
	String mKey = SignatureUtil.hash(signKey, "SHA-256");
	
	//###############################################
	// 2.signature 생성
	//###############################################
//	Map<String, String> signParam = new HashMap<String, String>();

//	signParam.put("oid", oid); 					// 필수
//	signParam.put("price", price);				// 필수
//	signParam.put("timestamp", timestamp);		// 필수

	// signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
//	String signature = SignatureUtil.makeSignature(signParam);
	
	
	/* 기타 */
	//String path = request.getRequestURL().toString().split("ekklim")[0];
	String path = request.getRequestURL().toString().split("aldainc")[0];

	
	
	//String siteDomain = path + "ekklim.kr/reserhotel"; //가맹점 도메인 입력
	String siteDomain = path + "aldainc.co.kr/menu"; //가맹점 도메인 입력
	// 페이지 URL에서 고정된 부분을 적는다. 
	// Ex) returnURL이 http://localhost:8080INIpayStdSample/INIStdPayReturn.jsp 라면
	// http://localhost:8080/INIpayStdSample 까지만 기입한다.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>ARA</title>

<style>
	.basketPayBtn{
		width: 296px;
		height: 48px;
		border-radius: 4px;
		font-size: 14px;
		font-family: NotoSans;
		background-color: #FFFFFF; 
		border: 1px solid #707070; 
		margin-right: 4px;
	}
	.payCss{
		background-color: #707070;
		border: 1px solid #707070; 
		color: #FFFFFF;
	}
	.couponSelectBtn, .giftSelectBtn{
		border: 1px solid #8996A0;
		background-color: white;
		color: #8996A0;
		font-family: NotoSans;
		font-size: 14px;
		border-radius: 2px;
		width: 48px;
		height: 28px;
	}
	.couponTxt, .giftCouponTxt{
		color: #CCCCCC;
	}
	.cancelBtnCSS{
		background-color: #F2F2F2;
		color: #474747;
		border: none;
	}
	
    .popCouponList::-webkit-scrollbar{
		width: 8px;
    }
    .popCouponList::-webkit-scrollbar-thumb{
        background-color: #7E7E7E;
        border-radius: 10px;
        background-clip: padding-box;
        border: 2px solid transparent;
    }
    .popCouponList::-webkit-scrollbar-track{
        background-color: transparent;
    }
    
   	.giftCardList::-webkit-scrollbar{
		width: 8px;
    }
    .giftCardList::-webkit-scrollbar-thumb{
        background-color: #7E7E7E;
        border-radius: 10px;
        background-clip: padding-box;
        border: 2px solid transparent;
    }
    .giftCardList::-webkit-scrollbar-track{
        background-color: transparent;
    }
    .orderInfoTitle input{
	    padding-left: 10px;
    }
    .agreeText{
    	color: red;
    	font-family: NotoSans;
    	font-size: 12px;
    	margin-top: 4px;
    	margin-left: 18px;
    	display: none;
    }
</style>

</head>
<body>
<%
	String shopbasket_id = (String) session.getAttribute("shopbasket_id");
	String totalProduct = (String) session.getAttribute("totalProduct");
	String totalDelivery = (String) session.getAttribute("totalDelivery");
	/* String productName = (String) session.getAttribute("goodsName"); */
%>
<%@include file="../header_noTop.jsp"%>
   <!-- <div class='topSubs'>
	   		<div class='topMenus'>
	   			<div class=topSubMenu>
			   		<h4 class='basketMenu'>주문결제 <span>장바구니 ><span style='color: #242424;'> 주문결제</span> > 결제완료</span></h4>
	   			</div>
		   		<div class='memberInfo2'>
	   			<p style='float: left; height: 30px;'>000님 | </p>
	   			<p>로그아웃</p>
	   		</div>
	   </div>
	   </div> -->
	
	
	<main class='content'>
		<div class='totalPrice'>
			<div class='priceNav'>
				<p class='priceNavTitle'>결제정보</p>
				<div id='shopBasketId' style='display:none;'></div>
				<div class='PriceSideTable'>
					<table>
						<tr>
							<td>상품금액</td>
							<td><span id='productPrice'>0</span>원</td>
						</tr>
						<tr>
							<td>배송비</td>
							<td><span id='deliveryPrice'>0</span>원</td>
						</tr>
						<tr>
							<td>쿠폰할인</td>
							<td><span id = 'couponAmount'>0</span>원</td>
						</tr>
						<tr>
							<td>포인트할인</td>
							<td><span id='discountPoint'>0</span>원</td>
						</tr>
						<tr>
							<td>기프트카드 사용</td>
							<td><span id='discountGift'>0</span>원</td>
						</tr>
						<tr>
							<td>총 결제금액</td>
							<td><span id='allTotalPrice'>0</span>원</td>
						</tr>
					</table>
				</div>
				<div class='cacelNotice'>
					<div class='cancelNoticeText'>
						<p>규정에 따라 변경,취소 및 환불이 불가하거나 수수료가 발생할 수 있습니다.</p>
					</div>
					<div class='cancelNoticeBtn'>취소규정</div>
				</div>
				<div class='agreeCheck'>
					<label><input type='checkbox' id='agreeCheck'> 개인정보 제 3자 제공 동의(필수)</label>
					<p class='agreeText'>결제진행 필수사항을 동의해주세요.</p>
				</div>
				<div class='priceSideBtn'>
					<button type='button' class='finalPaymentBtn'><span id='finalPrice'></span>원 결제하기</button>
				</div>
			</div>
		</div>
		<div class='basketInfo'>
			<div class='orderInfoTitle'>
				<h4>주문정보확인</h4>
				<hr style='margin: 18px auto; border-color: #727F8A;'>
				<div class='orderInfo'>
					<p class='orderName'>주문자정보</p>
					<table class='orderTable'>
						<tr>
							<td>성명</td>
							<td><input class='input1 userInfo' type='text' id='user_Name'></td>
						</tr>
						<tr>
							<td>연락처</td>
							<td><input class='input1 userInfo' type='tel' id='userTel' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g,'$1');"/></td>
							<!-- <td>
							<select class='orderTel'>
								<option>010</option>
								<option>011</option>
								<option>018</option>
							</select>
							<input class='input3' style='margin: 0px 12px;' type='tel'>
							<input class='input3' type='tel'>
							</td> -->
						</tr>
					</table>
					<!-- <div class='modifyBtn'>
						<button type='button'>수정완료</button>
					</div> -->
				</div>
				<hr style='border-color: #CCCCCC;'>
				<div class='orderInfo'>
					<p class='orderName'>배송지정보</p>
					<table class='orderTable'>
						<tr>
							<td>성명</td>
							<td><input class='input1 userInfo' type='text' id='order_name'></td>
						</tr>
						<tr>
							<td>연락처</td>
							<td><input class='input1 userInfo' id='orderTel' type='tel' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g,'$1');"/></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input class='input1 userInfo' type='text' name='zip' id='zip' readonly><button class='postCodeBtn' type='button'>우편번호 검색</button>
								<input class='input2 userInfo' name='addr1' id='addr1' style='margin: 12px auto;' type='text' readonly>
							</td>
						</tr>
						<tr>
							<td>상세주소</td>
							<td><input class='input2 userInfo' name='addr2' id='addr2' type='text'></td>
						</tr>
						<tr>
							<td>요청사항</td>
							<td><select class='orderDeliveryOption' id='orderRequest'>
								<option value='' selected>요청사항을 입력해주세요</option>
								<option value=''>배송 전에 미리 연락 바랍니다.</option>
								<option value=''>부재시 경비실에 맡겨 주세요.</option>
								<option value=''>부재시 전화 주시거나 문자 남겨 주세요.</option>
							</select></td>
						</tr>
					</table>
					<!-- <div class='modifyBtn'>
						<button type='button'>수정완료</button>
					</div> -->
				</div>
			</div>
			<div class='orderInfoTitle'>
				<h4>할인선택</h4>
				<hr style='margin: 18px auto; border-color: #727F8A;'>
				<div class='coupon'>
					<p class='discountCouponTitle'>할인쿠폰<span class='apply'>적용가능 <span class='applyCount' id='haveCoupon'></span>장</span></p>
					<div class='couponSelect'>
						<div class='couponName'><p class='couponTxt'>쿠폰을 선택해주세요.</p></div>
						<div style='width: 100%; text-align: right;'>
							<!-- <span class='couponDiscount'>-5,000원 할인</span> -->
							<button type='button' id='Bshow' class='couponSelectBtn'>선택</button>
						</div>
					</div>	
				</div>
				<div class='point'>
					<p class='discountCouponTitle'>포인트<span class='apply'>보유포인트 <span class='applyCount' id='hasPoint'>0</span>P</span></p>
					<div class='pointSelect'>
						<input type='text' class='applyPoints' id='points' onchange='usePoint()' value = 0 style='width: 479px; height: 36px; border: none; text-align: right; padding-left: 0px;'>
						<!-- <div class='applyPoints'></div> -->
						<div class='pointBtn'><p class='fullUsePoint'>전액사용</p></div>
					</div>	
				</div>
			</div>
				<div class='orderInfoTitle'>
					<h4>결제수단</h4>
					<hr style='margin: 18px auto; border-color: #727F8A;'>
					<div class='coupon'>
						<p class='discountCouponTitle'>기프트카드<span class='apply'>사용시 총 결제금액 <span class='applyCount'>0</span>원</span></p>
						<div class='couponSelect'>
							<div class='couponName'><p class='giftCouponTxt'>기프트카드를 선택해주세요.</p></div>
							<div style='width: 100%; text-align: right;'><button type='button' id='Gshow' class='giftSelectBtn'>선택</button></div>
							<!-- <div class=couponDiscount><p>기프트카드 선택 <img src="../image/icon/blackArrRight.png"></p></div> -->
						</div>	
					</div>
				</div>
			<hr style='border-color: #CCCCCC; margin: 30px auto;'>
			<div class='orderBtn'>
				<button type='button' class='basketPayBtn' id='BANK'>계좌이체</button>
				<button type='button' class='basketPayBtn' id='CARD'>신용카드결제</button>
			</div>
		</div>
		
		<!-- 결제모듈 -->
		<form id="SendPayForm_id" name="SendPayForm" method="POST" >

	        <input type="hidden"  name="goodname" id="goodname" value="" >
	        <input type="hidden"  name="buyername" id="buyername" value="" >
	        <input type="hidden"  name="buyertel" id="buyertel" value="" >
	        <input type="hidden"  name="buyeremail" id="buyeremail" value="" >
	        <input type="hidden"  name="price" id="price" value="" >
	        <input type="hidden"  name="mid" value="<%=mid %>" ><!-- 에스크로테스트 : iniescrow0, 빌링(정기과금)테스트 : INIBillTst -->
	        <input type="hidden"  name="gopaymethod" id="gopaymethod" value="Card" >
	        <input type="hidden"  name="mKey" value="<%=mKey %>" >
	        <input type="hidden"  name="signature" id="signature" value="" >
	        <input type="hidden"  name="oid" id="oid" value="" >
	        <input type="hidden"  name="timestamp" id="timestamp" value="" >
	        <input type="hidden"  name="version" value="1.0" >
	        <input type="hidden"  name="currency" value="WON" >
	        <input type="hidden"  name="acceptmethod" value="below1000" ><!-- 에스크로옵션 : useescrow, 빌링(정기과금)옵션 : BILLAUTH(Card) -->
	        <input type="hidden"  name="returnUrl" value="<%=siteDomain %>/complete" >
	        <input type="hidden"  name="closeUrl" value="<%=siteDomain %>/close.jsp" >
	
	   </form>
	</main>
 	<%@include file="../footer.jsp"%>
 		<div class='couponPop'>
	 		<div class='window'>
	 	 		<div class='popup' style='width: 672px; height: 789px;'>
	 	 		 <img id='close4' src="../image/icon/whiteDelete.png">
		 	 		<div class='couponPopTitle'>
		 	 			<h4>쿠폰적용</h4>
		 	 			<p>해당 상품에 적용 가능한 쿠폰 입니다. 쿠폰을 선택해주세요.</p>
		 	 		</div>
		 	 		<div class='popCouponList'>
		 	 				<table class='couponListTable'>
		 	 					<!-- <tr>
		 	 						<td class='couponTd2'><p class='couponPopText'>SLIVER 10% 할인쿠폰 <span>*100,000원 이상 결제시 사용가능</span></p>
		 	 							<p class='couponPopPeriod'>2021.01.01 ~ 2022.02.01</p></td>
		 	 						<td class='couponTd3'>적용하기</td>
		 	 					</tr> -->
		 	 				</table>
		 	 		</div>
	 	 				<!-- <div class='pageBtn'>
							<img src='../image/icon/arrleft.png'>
								<ul style='padding-left: 0px;'>
									<li style='font-weight: bold;'>1</li>
								</ul>
							<img src='../image/icon/arrRight.png'>
						</div>
						
						<div class='couponPopBtn'>
							<button type='button'>선택완료</button>
						</div> -->
	 	 		</div>
	 	 	</div>
 		</div>
 	<div class='giftPop'>
 		<div class='window'>
 	 		<div class='popup' style='width: 672px; height: 789px;'>
 	 		 <img id='close5' src="../image/icon/whiteDelete.png">
	 	 		<div class='couponPopTitle'>
	 	 			<h4>기프트카드 적용</h4>
	 	 			<p>해당 상품에 적용 가능한 상품권 입니다. 상품권을 선택해주세요.</p>
	 	 		</div>
	 	 			<div class='giftCardList'>
		 	 			<!-- <div class='giftCardNoItem giftCardClick'>
		 	 				<p>적용안함</p>
		 	 			</div> -->
		 	 			<!-- <div class='giftCardItem'>
		 	 				<div class='giftCardImg'>
		 	 					<img style='width: 82px;' src='../image/items/gift5.png'>
		 	 				</div>	
		 	 				<div class='giftCardText'>
		 	 					<p class='giftFrom'>FROM. <span>000</span>님</p>
		 	 					<p class='giftCardName'>[기프트카드] 50,000원권</p>
		 	 					<p class='giftcardState'>사용전</p>
		 	 					<p class='giftcardPeriod'>유효기간 : 2022.12.31</p>
		 	 				</div>
		 	 			</div>
		 	 			 -->
	 	 			</div>
	 	 			<div class='pageDown'>
	 	 				<!-- <div class='pageBtn'>
							<img src='../image/icon/arrleft.png'>
								<ul style='padding-left: 0px;'>
									<li style='font-weight: bold;'>1</li>
								</ul>
							<img src='../image/icon/arrRight.png'>
						</div> -->
						
						<div class='couponPopBtn'>
							<button type='button' id='giftSelectOk'>선택완료</button>
						</div> 	 			
	 	 			</div>
 	 		</div>
 	 	</div>
 	</div>
 	<script type="text/javascript" src="https://stdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script>
	<script type="text/javascript">
	var shopbaskets = '<%=shopbasket_id%>';
	var productAmount = '<%=totalProduct%>';
	var deliveryAmount = '<%=totalDelivery%>';
	var user_id = '<%=id%>';
	<%-- var productName = '<%=productName%>'; --%>
	var clickCouponId;
	var selectCardId;
	var couponAmount;
	var discountGift;
	var discountPoint;
	var allTotalPrice;
	var minusGift;
	var selectCard;
	var selectCoupon;
	var productPrice;
	var deliveryPrice;
	
		/* 쿠폰 선택 팝업 */
		$(document).on('click','#Bshow',function(){
			$('.couponPop').addClass('show');
			
			if($(this).text() == '취소'){
				$(this).text('선택');
				$('.couponPop').removeClass('show');
				$('.couponSelectBtn').removeClass('cancelBtnCSS');
				$('#couponAmount').text("0");
				$('.couponTxt').text("쿠폰을 선택해주세요.");
				
				$('#points').attr('disabled', false);
				$('.pointBtn').css('pointer-events', 'auto');
			} 
		})
		$(document).on('click','#close4',function(){
			$('.couponPop').removeClass('show');
		})
		
		/* 쿠폰팝업의 쿠폰 선택 */
		$(document).on('click','.couponTd3',function(){
			clickCouponId = $(this).attr('id');
			selectCoupon = $(this).attr('idx');
			var couponPrice = parseInt($('.couponCharge'+clickCouponId).text()).toLocaleString('en');
			var percentCoupon = parseInt(($('#productPrice').text().replaceAll(",","")) * (couponPrice/100)).toLocaleString('en');
			
			$('.couponTxt').text($('.couponPopName'+clickCouponId).text());
			
			if($('.percentState'+clickCouponId) == 'true'){
				if(percentCoupon.replaceAll(",","") > productPrice + deliveryPrice){
					$('#couponAmount').text(Math.min(percentCoupon.replaceAll(",",""),origin + productPrice + deliveryPrice).toLocaleString('en'));
				} else{
					$('#couponAmount').text(percentCoupon);
				}
			} else{
				if(couponPrice.replaceAll(",","") > productPrice + deliveryPrice){
					$('#couponAmount').text(Math.min(couponPrice.replaceAll(",",""),origin + productPrice + deliveryPrice).toLocaleString('en'));
				} else{
					$('#couponAmount').text(couponPrice);
				}
			}
			
			/* 쿠폰 적용버튼 취소버튼으로 번경 */
			$('.couponSelectBtn').text('취소');
			$('.couponSelectBtn').css('color','#242424');
			$('.couponSelectBtn').addClass('cancelBtnCSS');
			
			/* 포인트 창 사용불가 */
			$('#points').attr('disabled', true);
			$('.pointBtn').css('pointer-events', 'none');
			document.getElementById('points').value = 0;
			document.getElementById('discountPoint').innerText = 0;
			
			$('.couponPop').removeClass('show');
			
			TotalCalc();
		})
		
		/* 기프트카드 선택 팝업*/
		$(document).on('click','#Gshow',function(){
			$('.giftPop').addClass('show');
			
			if($(this).text() == '취소'){
				$(this).text('선택');
				$('.giftPop').removeClass('show');
				$('.giftSelectBtn').removeClass('cancelBtnCSS');
				$('#discountGift').text("0");
				$('.giftCouponTxt').text("기프트카드를 선택해주세요.");
			}
		})
		
		/* 기프트 카드 선택 */
		$(document).on('click','.giftCardItem', function(){
 			$('.giftCardItem').removeClass('giftCardCss');
 			$(this).addClass('giftCardCss');
 		})

 		/* 기프트 팝업에 기프트카드 선택후 선택완료 버튼 클릭 */
		$(document).on('click','#giftSelectOk',function(){
			selectCardId = $('.giftCardCss').attr('id');
			selectCard = $('.giftCardCss').attr('idx');
			var giftName = giftData[selectCard].giftcard_name;	
			var giftPrice = parseInt(giftData[selectCard].giftcard_price).toLocaleString('en');
			
			if($('.giftCardCss').length !=0){
				if(minusGift == 0){
					alert("기프트카드를 사용해 결제할 금액이 없습니다.");
					$('.giftCouponTxt').text("기프트카드를 선택해주세요.");
					$('#discountGift').text("0");
					$('.giftCardItem').removeClass('giftCardCss');
				} else if(giftPrice.replaceAll(",","") > productPrice + deliveryPrice){
					$('.giftCouponTxt').text(giftName);
					$('#discountGift').text(Math.min(giftPrice.replaceAll(",",""),productPrice + deliveryPrice).toLocaleString('en'));
				} else if(minusGift < giftPrice.replaceAll(","),""){
					$('.giftCouponTxt').text(giftName);
					$('#discountGift').text(Math.min(giftPrice.replaceAll(",",""),minusGift).toLocaleString('en'));
				} else{
					$('.giftCouponTxt').text(giftName);
					$('#discountGift').text(giftPrice);
				}
				
				/* 기프트카드 선택 버튼 변화 */
				$('.giftSelectBtn').text('취소');
				$('.giftSelectBtn').css('color','#242424');
				$('.couponSelectBtn').addClass('cancelBtnCSS');
				
				TotalCalc();
			} else{
				$('.giftCouponTxt').text("기프트카드를 선택하세요.");
				$('#discountGift').text("0");
			}
				$('.giftPop').removeClass('show');
			
		})
 		
		$(document).on('click','#close5',function(){
			$('.giftPop').removeClass('show');
		})
		
		$(document).on('click','.basketPayBtn', function(){
			$('.basketPayBtn').removeClass('payCss');
			$(this).addClass('payCss');
		})
		
		/* 결제하기 버튼 클릭시 */
		$(document).on('click','.finalPaymentBtn',function(){
			
			var inputCheck = true;
			
			$('.userInfo').each(function(){
				if($(this).val().trim() == ""){
					inputCheck = false;
					$(this).focus();
					return false;
				} 
			})
			
			if(!inputCheck){
				alert("이용자 정보를 입력해주세요.");
			} else if ($('#agreeCheck').is(":checked") == false){
				alert('결제 진행 필수사항을 동의해주세요.');
				$('.agreeText').css('display','block');
				$('#agreeCheck').focus();
			} else if ($('.payCss').length == 0){
					alert('결제 방법을 선택해주세요.');
					$('.basketPayBtn').focus();
			}else{
				
				var userName = $('#user_Name').val();
				var userTel = $('#userTel').val();
				var orderName = $('#order_name').val();
				var orderTel = $('#orderTel').val();
				var postCode = $('#zip').val();
				var address = $('#addr1').val() + $('#addr2').val(); 
				var request = $("select[id='orderRequest']").val();
				var points = $('#points').val();
				var payMethod;
				var selectCardPrice;
				var userEmail = "";
				var shopBasket_id= [];
				
				var shopBasketArr = $('#shopBasketId').text().replace("(","").replace(")","").split(",");
				
				for (var i in shopBasketArr) {
					shopBasket_id.push(shopBasketArr[i]);
				}
				
				if(allTotalPrice == 0){
					payMethod = "APP";
				} else{
					if($('.payCss').attr('id') == 'CARD'){
						payMethod = "CARD";
					} else if($('.payCss').attr('id') == 'BANK'){
						payMethod = "BANK";
					}
				}
					
				
				//기프트카드 사용 유무에 따라
				if($('.giftCardCss').length == 0){
					selectCardId = null;
					selectCardPrice = 0;
				} else{
					selectCardId = $('.giftCardCss').attr('id');
					selectCardPrice =  giftData[selectCard].giftcard_price;
				}
				
				//쿠폰 사용 유무에 따라
				if($('.couponTxt').text() == "쿠폰을 선택해주세요."){
					clickCouponId = null;
					selectCouponPrice = 0;
				} else{
					if(couponData[selectCoupon].is_percent == true){
						selectCouponPrice = ( productAmount * (couponData[selectCoupon].coupon_charge/100));
					} else{
						selectCouponPrice = couponData[selectCoupon].coupon_charge;	
					}
					
				}
				
				
				var sendData = {
 		 			"shopBaskets" : shopBasket_id,
 	 				"userInfo" : { 
 	 					"name" : userName, 
 	 					"tel" : userTel, 
 	 					"email" : userEmail,
 	 					},
 	 				"orderInfo" : { 
 	 					"name" : orderName, 
 	 					"tel" : orderTel, 
 	 					"email" : userEmail,
 	 					},
 	 				"addressInfo" : address,
 	 				"postCode" : postCode,
 	 				"orderRequest" : request,
 	 				"coupon" : clickCouponId,
 	 				"couponCharge" : selectCouponPrice,
 	 				"pointCharge" : discountPoint,
 	 				"giftcard" : selectCardId,
 	 				"giftcardCharge" : selectCardPrice,
 	 				"paymentMethod" : payMethod,
 	 				"paymentCharge" : allTotalPrice,
 	 			 }
 	 			 
 		 		console.log(sendData);
 		 			
 				$.ajax({
 					 contentType: "application/json; charset=utf-8",
 					 url :"../purchase", // 컨트롤러 위치
 					 type : "POST",
 					 beforeSend: function (xhr) {
 			             xhr.setRequestHeader("user", user_id);
 	    			 },
 					 data : JSON.stringify(sendData),
 					//dataType : response 어떤 타입으로 받을지
 					dataType : 'JSON',
 					success : function(result){
 						console.log(result);
 						
 						if(result.message == 'Success'){
							var oid = result.OID;
							
							if (payMethod == 'app') {
								setAppPayment(oid);
							} else {
								setPaymentInfo(oid, allTotalPrice);
								
								//paymentInformantion(payemntData);
							}
							
/*  							var payment_state = true;
							var payment_message = "";
							var oid = result.OID;
							var tid = "paymentTest";
							
							console.log(oid);
							if(typeof tid == "undefined" || tid == ""){
								tid = null;
							}
							
							
							
							paymentInformantion(payemntData);
 */							
 							return false;
 						} else if(result.message == 'Fail'){
 							alert("잠시후에 다시 시도해주세요.");
 							return false;
 						} else {
 							alert("알 수 없는 에러입니다.");
 							return false;
 						}
 						return false;					
 					},
 					error : function(){
 						alert("검색실패");
 						return false;
 					}
 				})
				
			}
		})
		
		function setPaymentInfo(oid, price) {
			
			$("#goodname").val(productName);
			$("#buyername").val($('#user_Name').val());
			$("#buyertel").val($('#userTel').val());
			$("#buyeremail").val("");
			$("#price").val(price);
			
			$.ajax({
				url: "../PaymentSignatureCon.Webdo", // 컨트롤러 위치
				type: "post",
				dataType: 'JSON',
				data: {
					price: price,
					oid : oid
				},
				success: function(result) {
					console.log(result)
	
					var message = result.message;
					
					if (message == "Success") {
						$('#signature').val(result.signature);
						$('#oid').val(result.oid);
						$('#timestamp').val(result.timestamp);
						
						INIStdPay.pay(document.SendPayForm);
						
						return false;
					} else if (message == "Fail") {
						alert("서버 요청 실패");
						
						return false;
					}
					
					return false;
				},
				error: function() {
					swal("서버 요청 실패", "연결을 다시 확인 해주세요.", "error");
					return false;
				}
			});
		}
		
		function setAppPayment(oid) {			
			
			$.ajax({
				url: "../AppPaymentCon.Webdo", // 컨트롤러 위치
				type: "post",
				dataType: 'text',
				data: {
					oid : oid
				},
				success: function(result) {
					console.log(result)
					
					if (result == "Success") {
						
						return false;
					} else if (result == "Fail") {
						alert("서버 요청 실패");
						
						return false;
					}
					return false;
				},
				error: function() {
					alert("서버 요청 실패");
					return false;
				}
			});
		}
		
		
 	</script>
	<script>
 		$(function(){
 			
 			$('.topSubMenu').append(
	    		"<h4 class='basketMenu'>주문결제 <span>장바구니 ><span style='color: #242424;'> 주문결제</span> > 결제완료</span></h4>"		
 		    );
 		})
 		
 		/* 포인트 박스에 숫자만 입력하기 */
 		$(document).on('input', '#points', function() {
		if ($(this).val() != null && $(this).val() != '') {
			var tmps = parseInt($(this).val().replace(/[^0-9]/g, '')) || '0';
			var tmps2 = tmps.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
			$(this).val(tmps2);
		} else {
			$(this).val(0);
		}
		// 빈값일때 0으로
	});
 		////////////////////////서버 수정해야함///////////////////////////
 		/* 포인트 전액사용 버튼 클릭시 보유포인트 전액 반영 */
 		$(document).on('click','.pointBtn',function(){
 			var havePoint = $('#hasPoint').text().replaceAll(",","");
 			document.getElementById('hasPoint').value = Math.min(havePoint, productPrice + deliveryPrice).toLocaleString('en');
 			
 			$('#points').val(Math.min(havePoint, productPrice + deliveryPrice).toLocaleString('en'));
 			$("#discountPoint").text(Math.min(havePoint, productPrice + deliveryPrice).toLocaleString('en'));
 			
 			//$('.couponSelectBtn').attr('disabled',true);
 			TotalCalc();
 		})
 		
 		function usePoint(){
 			var discount = document.getElementById('points').value.replaceAll(",","");
 			var havePoint = $('#hasPoint').text();
 			
 			if(discount.replaceAll(",","") > havePoint){
 				alert("보유 포인트 이상 사용은 불가능 합니다.");
 				document.getElementById('points').value = 0;
			  	document.getElementById("discountPoint").innerText = 0;
 			} else if(discount.replaceAll(",","") > productPrice + deliveryPrice){
 				document.getElementById('points').value = Math.min(discount, productPrice + deliveryPrice).toLocaleString('en');
 				document.getElementById("discountPoint").innerText = Math.min(discount, productPrice + deliveryPrice).toLocaleString('en');
 			} else{
 				document.getElementById("discountPoint").innerText = discount.toLocaleString('en');
 			}
			if(discount != '0'){
	 			$('.couponSelectBtn').attr('disabled',true);
			}
			
 			TotalCalc();
 		}
 	</script>
 	<script> 
 		/* 우편번호 검색하기 */
		$(document).ready(function(){ 
			$(".postCodeBtn").on("click",function(){
				new daum.Postcode({ 
				oncomplete: function(data) { 
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 
				
				// 각 주소의 노출 규칙에 따라 주소를 조합한다. 
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다. 
				var fullAddr = ''; // 최종 주소 변수 
				var extraAddr = ''; // 조합형 주소 변수 
				
				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다. 
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우 
					fullAddr = data.roadAddress; 
				} else { // 사용자가 지번 주소를 선택했을 경우(J) 
					fullAddr = data.jibunAddress; 
				} 
				
				// 사용자가 선택한 주소가 도로명 타입일때 조합한다. 
				if(data.userSelectedType === 'R'){ 
					//법정동명이 있을 경우 추가한다. 
					if(data.bname !== ''){ 
						extraAddr += data.bname; 
					} 
					// 건물명이 있을 경우 추가한다. 
					if(data.buildingName !== ''){ 
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName); 
					} 
					// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다. 
					fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : ''); 
				} 
				
				// 우편번호와 주소 정보를 해당 필드에 넣는다. 
				document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용 
				document.getElementById('addr1').value = fullAddr; // 커서를 상세주소 필드로 이동한다. 
				document.getElementById('addr2').focus(); 
				} 
			}).open(); 
		});
	}); 
		</script> 
		<script>
		var productName;
		
			$(function(){
				
				var referrer = document.referrer;
				
				if(/basket/.test(referrer)) {
					
					$.ajax({
						url : "../purchase-basic-info?shopbaskets=" + shopbaskets, // 컨트롤러 위치
						type : "GET",
						dataType : 'JSON',
						beforeSend: function (xhr) {
				            xhr.setRequestHeader("user", user_id);
				        },
						success : function(result){
							
							if(result.message == 'Success'){
								data = result.data;
								console.log(data);	
								
								couponData = data.coupons;
								giftData = data.giftcards;
								productData = data.products;
								
								$('#shopBasketId').text(shopbaskets);
								$('#hasPoint').text(data.user_point.toLocaleString('en'));
								$('#user_Name').val(data.user_name);
								$('#userTel').val(data.user_tel);
								$('#haveCoupon').text(couponData.length);
								$('#productPrice').text(parseInt(productAmount).toLocaleString('en'));
								$('#deliveryPrice').text(parseInt(deliveryAmount).toLocaleString('en'));
								
								if(productData.length != 1){
									productName = productData[0].product_name + " 외 " + (productData.length -1);										
								} else {
									productName = productData[0].product_name;
								}
								couponList();
								giftcardList();
								TotalCalc();
								
								return false;
							} else if(result.message == 'Fail'){
								alert("잠시후에 다시 시도해주세요.");
								return false;
							} else {
								alert("알 수 없는 에러입니다.");
								return false;
							}
							return false;					
						},
						error : function(){
							alert("검색실패options");
							return false;
						}
					})
					
				} else{
					$.ajax({
						url : "../purchase-basic-info", // 컨트롤러 위치 
						type : "GET",
						dataType : 'JSON',
						beforeSend: function (xhr) {
				            xhr.setRequestHeader("user", user_id);
				        },
						success : function(result){
							
							if(result.message == 'Success'){
								data = result.data;
								console.log(data);	
								
								couponData = data.coupons;
								giftData = data.giftcards;
								productData = data.products;
								
								$('#shopBasketId').text(data.shopbasket_id);
								$('#hasPoint').text(data.user_point.toLocaleString('en'));
								$('#user_Name').val(data.user_name);
								$('#userTel').val(data.user_tel);
								$('#haveCoupon').text(couponData.length);
								$('#productPrice').text(parseInt(productAmount).toLocaleString('en'));
								$('#deliveryPrice').text(parseInt(deliveryAmount).toLocaleString('en'));
								
								productName = productData[0].product_name;
								
								couponList();
								giftcardList();
								TotalCalc();
								
								return false;
							} else if(result.message == 'Fail'){
								alert("잠시후에 다시 시도해주세요.");
								return false;
							} else {
								alert("알 수 없는 에러입니다.");
								return false;
							}
							return false;					
						},
						error : function(){
							alert("검색실패options");
							return false;
						}
					})
				}
			})
		</script>
		<script>
			function couponList(){
				for(var i = 0; i < couponData.length; i++){
					var couponId = couponData[i].coupon_id;
					
					$('.couponListTable').append(
						"<tr>"
							+"<td class='couponTd2'><p class='couponPopText'><span class='couponPopName" + couponId + "'>" + couponData[i].coupon_name + " </span><span>* " + couponData[i].min_price.toLocaleString('en') +  "원 이상 결제시 사용가능</span></p>"
								+"<p style='display: none;'><span class='couponCharge" + couponId + "'>" + couponData[i].coupon_charge + "</span><span class='percentState" + couponId + "'>" + couponData[i].is_percent + "</span></p>" 
							+"</td>"
							+"<td class='couponTd3' id='" + couponId + "' idx='" + i + "'>적용하기</td>"
 	 					+"</tr>"
					)
					/*+"<p class='couponPopPeriod'>2021.01.01 ~ 2022.02.01</p>" */
				}
			}
			
			function giftcardList(){
				for(var i = 0; i < giftData.length; i++){
					$('.giftCardList').append(
						"<div class='giftCardItem' id = '" + giftData[i].giftcard_id + "' idx='" + i + "'>"
		 	 				+"<div class='giftCardImg'>"
		 	 					+"<img style='width: 82px;' src='" + giftData[i].giftcard_img_url + "'>"
		 	 				+"</div>"	
		 	 				+"<div class='giftCardText'>"
		 	 					+"<p class='giftFrom'>FROM. " + giftData[i].sender_name + "님</p>"
		 	 					+"<p class='giftCardName giftName" + giftData[i].giftcard_id + "'>" + giftData[i].giftcard_name + "</p>"
		 	 					+"<p style='display: none;' class='giftMoney" + giftData[i].giftcard_id + "'>" + giftData[i].giftcard_price + "</p>"
		 	 					+"<p class='giftcardState'>사용전</p>"
		 	 					+"<p class='giftcardPeriod'>유효기간 : " + giftData[i].valid_date + "</p>"
		 	 				+"</div>"
		 	 			+"</div>"		
					)
				}
			}
			
			

			function TotalCalc(){
				productPrice = parseInt($('#productPrice').text().replaceAll(",",""));
				deliveryPrice = parseInt($('#deliveryPrice').text().replaceAll(",",""));
				couponAmount = parseInt($('#couponAmount').text().replaceAll(",",""));
				discountPoint = parseInt($('#discountPoint').text().replaceAll(",",""));
				discountGift = parseInt($('#discountGift').text().replaceAll(",",""));
				
				allTotalPrice = productPrice + deliveryPrice - couponAmount - discountPoint - discountGift;
				minusGift = productPrice + deliveryPrice - couponAmount - discountPoint;
				
				if(discountGift > minusGift){
					allTotalPrice = 0;
				}
				
				$('#allTotalPrice').text((allTotalPrice).toLocaleString('en'));
				$('#finalPrice').text((allTotalPrice).toLocaleString('en'));
				
			}
		</script>
</body>
</html>