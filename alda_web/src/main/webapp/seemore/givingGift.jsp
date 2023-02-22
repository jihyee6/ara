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
	String path = request.getRequestURL().toString().split("aldainc")[0];
	//String path = request.getRequestURL().toString().split("buyinhotel")[0];
	
	String siteDomain = path + "aldainc.co.kr/menu"; //가맹점 도메인 입력
	//String siteDomain = path + "buyinhotel.co.kr/seemore"; //가맹점 도메인 입력
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>ARA</title>

<style>
	.payMethodCss{
		background-color: #707070; 
		color: white;
	}
	.payWarnig{
		padding-left: 10px;
		margin-top: 10px;
		font-size: 13px;
		color: red;
		display: none;
	}
</style>

</head>
<body>
<%
	int giftcard_id = 0;
	giftcard_id = Integer.parseInt(request.getParameter("giftcard_id"));
%>

<%@include file="../header_noTop.jsp"%>
   <!-- <div class='topSubs'>
	   		<div class='topMenus'>
	   			<div class=topSubMenu>
			   		<h4 class='basketMenu'>선물결제하기 <span>선물하기 > <span style='color: #242424;'>선물결제하기</span> > 결제완료</span></h4>
	   			</div>
		   		<div class='memberInfo2'>
	   			<p style='float: left; height: 30px;'>000님 | </p>
	   			<p>로그아웃</p>
	   		</div>
	   </div>
   </div> -->
	
	
	<main class='content'>
		<h4 class='giveinfoTitle'>정보입력</h4>
		<div class='giveInfo'>
			<p class='giveSubTitle'>상품정보</p>
			
			<div class='giveItem'>
				<div class='giveItemImg'>
					<img id='givingImg' src="">
				</div>
				<div class='giveItemInfo'>
					<p class='giveStore'></p>
					<p class='giveName'></p>
					<p class='giveOption'></p>
				</div>
				<div class='giveItemPrice'>
					<p class='givePrice'><span id='givePrice'></span>원</p>
				</div>
			</div>
		</div>
		<div class='giveSender'>
			<p class='giveSubTitle'>보내는 분</p>
			<div class='giveSenderInfo'>
				<table>
					<tr>
						<td>성명</td>
						<td><input class='giveInput' type='text' id='senderName'></td>					
					</tr>
					<tr>
						<td>연락처</td>
						<td><input class='giveInput' type='tel' id='senderTel' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>					
					</tr>
					<tr>
						<td>이메일</td>
						<td><input class='giveInput' type='email' id='senderEmail'></td>					
					</tr>
				</table>
			</div>
		</div>
		
		<div class='giveReceive'>
			<p class='giveSubTitle'>받는분</p>
				<div class='giveSenderInfo'>
					<table>
						<tr>
							<td>성명</td>
							<td><input class='giveInput' type='text' id='receiverName'></td>					
						</tr>
						<tr>
							<td>연락처</td>
							<td><input class='giveInput' type='tel' id='receiverTel' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>					
						</tr>
					</table>
				</div>
		</div>
		<div class='givePayment'>
			<h4 class='giveinfoTitle'>결제수단</h4>
			<div class='givePay'>
				<div class='givePayBtn'>
					<button type='button' class='payMethodBtn' id='directbank'>계좌이체</button>
					<button type='button' class='payMethodBtn' id='card'>신용카드결제</button>
					<p class='payWarnig'>결제 수단을 선택해주세요</p>
				</div>
				<div class='giveRefund'>
					<p>환불/취소 정책 및 방법</p>
					<ul>
						<li>&middot; 선물하기>선물함>받은선물 에서 환불요청이 가능합니다.</li>
						<li>&middot; 유효기간 이내 환불 요청시 구매자에게 결재금액의 100% 환불 가능합니다.</li>
						<li>&middot; 유효기간 이후 환불 요청시 수신자에게 결제금액의 90% 환불 가능합니다.</li>
						<li>&middot; 유효기간 이후 환불 요청시 결제금액의 90% 환불 가능합니다.</li>
					</ul>
				</div>
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
		
		<div class='giveAgree'>
			<p><label  class='giveCheck'><input type='checkbox' id='agreeCheck'> 주문 상품정보 및 서비스 이용약관에 동의합니다.(필수)</label></p>
			<button type='button' class='giveButton'><span id='giftcardPrice'></span>원 결제하기</button>
		</div>
		
	</main>
 	<%@include file="../footer.jsp"%>
 	<script>
 	var giftcard_id = '<%=giftcard_id%>';
 	var user_id = '<%=id%>';
 	var giftInfo;
 	
	    $(function() {
	    	$('.topSubMenu').append(
	    		"<h4 class='basketMenu'>선물결제하기 <span>선물하기 > <span style='color: #242424;'>선물결제하기</span> > 결제완료</span></h4>"		
	    	);
	    	var referrer = document.referrer;
	    	
	    	/* 기프트카드 선물하기에서 올때 */
	    	if(/giftDescription/.test(referrer)){
	    		
		    	$.ajax({
					url : "../gift-basic-info?giftcard="+giftcard_id + "&isGiftcard=true", // 컨트롤러 위치 
					type : "GET",
					dataType : 'JSON',
					// beforeSend = Header 먼저 보내주는부분 
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					success : function(result){
						
						if(result.message == 'Success'){
							data = result.data;
							console.log(data);	
								
							$('#givingImg').attr('src', data.gift_img_url);
							$('.giveStore').text("ARA");
							$('.giveName').text(data.gift_name);
							$('.giveOption').text();
							$('#givePrice').text(data.gift_price.toLocaleString('en'));
							$('#giftcardPrice').text(data.gift_price.toLocaleString('en'));
							
							$('#senderName').val(data.user_name);
							$('#senderTel').val(data.user_tel);
							$('#senderEmail').val(data.user_email);
							
							giftInfo = {
								gift_img : data.gift_img_url,
								gift_name : data.gift_name,
								gift_price : data.gift_price
							}
							
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
	    		/* 제품상세보기 -> 선물 아이콘 클릭했을때 */
	    		$.ajax({
					url : "../gift-basic-info?giftcard="+giftcard_id + "&isGiftcard=true", // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					// beforeSend = Header 먼저 보내주는부분 
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					success : function(result){
						
						if(result.message == 'Success'){
							data = result.data;
							console.log(data);	
								
							$('#givingImg').attr('src', data.gift_img_url);
							$('.giveStore').text("ARA");
							$('.giveName').text(data.gift_name);
							$('.giveOption').text();
							$('#givePrice').text(data.gift_price.toLocaleString('en'));
							$('#giftcardPrice').text(data.gift_price.toLocaleString('en'));
							
							$('#senderName').val(data.user_name);
							$('#senderTel').val(data.user_tel);
							$('#senderEmail').val(data.user_email);
							
							giftInfo = {
								gift_img : data.gift_img_url,
								gift_name : data.gift_name,
								gift_price : data.gift_price
							}
							
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
 	<script type="text/javascript" src="https://stdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script>
 	<script>
 		$(document).on('click','.payMethodBtn',function(){
 			$('.payMethodBtn').removeClass('payMethodCss');
 			$(this).addClass('payMethodCss');
 		})
 		
 		$(document).on('click','.giveButton',function(){
 			
 			var inputCheck = true;
 			
 			$('.giveInput').each(function(){
 				
 				if($(this).val().trim() == ""){
 					inputCheck = false;
					$(this).focus();
					return false;
				} 
 			})
 			
 			if(inputCheck == false){
 				alert('이용자 정보를 입력해주세요.');
 			} else if($('.payMethodCss').length == 0){
 				alert("결제수단을 선택해주세요.");
 				$('.payWarnig').show();
 				$('.payWarnig').focus();
 			} else if($('#agreeCheck').is(":checked") == false){
 				alert("주문 상품정보 및 서비스 이용약관에 동의해주세요.");
 				$('#agreeCheck').focus();
 			}else{
				var giftTotal;
				var userNum;
				var userEmail;
				var receiveNum;
				
				if($('.payMethodCss').attr('id') == 'card'){
					paymentMethod = "CARD";
				} else if($('.payMethodCss').attr('id') == 'directbank'){
					paymentMethod = "BANK";
				}
				
				giftTotal = $('#giftcardPrice').text().replaceAll(",","");
				userNum = $('#senderTel').val();
				userEmail = $('#senderEmail').val();
				
				receiveNum = $('#receiverTel').val();
				
				var sendData = {
						giftTypeID : giftcard_id,
						isGiftcard : true,
						paymentMethod : paymentMethod,
						paymentCharge : giftTotal,
						senderInfo : {
							name : $('#senderName').val(),
							tel : userNum,
							email : userEmail,						
						},
						receiverInfo : {
							name : $('#receiverName').val(),
							tel : receiveNum,
						}
				 }
				
				  console.log(sendData);
				
				 $.ajax({
					 contentType: "application/json; charset=utf-8",
					 url : "../gifts", // 컨트롤러 위치
					 //url : "../gifts", // 컨트롤러 위치
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
							
							setPaymentInfo(oid, giftTotal);
							
							/* var payment_state = true;
							var payment_message = null;
							var oid = result.OID;
							
							var tid = result.TID;
							if(typeof tid == "undefined" || tid == ""){
								tid = "null";
							}
							
							paymentInformantion(oid, payment_state, payment_message, giftTotal, tid); */
							
							//location.href = 'giveGiftComplete';							
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
				
			/* var urlSearch = new URLSearchParams(location.search);
				
			$.ajax({
				url: "../GoodsNameCon.Webdo", // 컨트롤러 위치
				type: "post",
				data : {
					goodsName : $('.giveName').text(),
					giftParams : urlSearch.toString()
				},
				dataType: 'text',
				success: function(result) {
					if (result == 'errName') {
						alert("선물 이름 오류");
					} else if(result == 'goodsName') {
					}
				},
				error: function() {
					alert("서버 요청 실패", "연결을 다시 확인 해주세요.");
					return false;
				}
			}); */
			
 			$("#goodname").val($('.giveName').text());
			$("#buyername").val($('#senderName').val());
			$("#buyertel").val($('#senderTel').val());
			$("#buyeremail").val($('#senderEmail').val());
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
 		
 		
 		
 		
 		// 결제 정보를 세션에 담는 함수
		function paymentInformantion(OID, payment_state, payment_message, giftTotal ,TID) {
			
			$.ajax({
				//contentType: "application/json; charset=utf-8",
				url : "../PaymentInfomationCon.do", // 컨트롤러 위치
				type : "POST",
				data : {
					OID: OID,
					payment_state : payment_state,
					payment_message : payment_message,
					payTotalCharge : JSON.stringify(giftInfo),
					TID : TID
				},
				//dataType : response 어떤 타입으로 받을지
				dataType : 'text',
				success : function(result){
					
					console.log(result);
					
					if(result == 'Success'){
						location.href = 'giveGiftComplete';
						return false;
					} else {
						alert("세션 등록 실패!!");
						return false;
					}
					return false;					
				},
				error : function(){
					alert("세션 등록 에러@@");
					return false;
				}
			})
		}
 		
 	</script>
 	
</body>
</html>