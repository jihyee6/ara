<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>ARA</title>
<style>
	.giftListS{
		overflow: auto;
		width: 672px;
		height: 600px;
	}
	  .giftListS::-webkit-scrollbar{
		width: 8px;
    }
    .giftListS::-webkit-scrollbar-thumb{
        background-color: #7E7E7E;
        border-radius: 10px;
        background-clip: padding-box;
        border: 2px solid transparent;
    }
    .giftListS::-webkit-scrollbar-track{
        background-color: transparent;
    }
    #applyPoints{
    	width: 536px;
    	height: 36px;
    	border: none;
    	text-align: right;
    }
    
    .payMethodCSS{
    	background-color: #707070; 
    	border: 1px solid #707070; 
    	color: #FFFFFF;
    }
</style>
</head>
<body>
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
				<div class='PriceSideTable'>
					<table>
						<tr>
							<td>상품금액</td>
							<td><span>561,900</span>원</td>
						</tr>
						<tr>
							<td>배송비</td>
							<td><span>0</span>원</td>
						</tr>
						<tr>
							<td>쿠폰할인</td>
							<td><span>-5,000</span>원</td>
						</tr>
						<tr>
							<td>포인트할인</td>
							<td><span>0</span>원</td>
						</tr>
						<tr>
							<td>총 결제금액</td>
							<td><span>556,900</span>원</td>
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
					<label><input type='checkbox'> 개인정보 제 3자 제공 동의(필수)</label>
				</div>
				<div class='priceSideBtn'>
					<button type='button' onclick='location.href="orderComplete"'><span>526,900</span>원 결제하기</button>
				</div>
			
			</div>
			
		</div>
		<div class='basketInfo'>
			<div class='orderInfoTitle'>
				<h4>주문정보확인</h4>
				<hr style='margin: 18px auto; border-color: #727F8A;'>
				<div class='orderInfo'>
					<p class='orderName'>주문자정보 <span onclick='location.href="modifyOrder"'>수정하기</span></p>
					<table class='orderTable'>
						<tr>
							<td>성명</td>
							<td>김알다</td>
						</tr>
						<tr>
							<td>연락처</td>
							<td>010-0000-0000</td>
						</tr>
					</table>
				</div>
				<hr style='border-color: #CCCCCC;'>
				<div class='orderInfo'>
					<p class='orderName'>배송지정보 <span onclick='location.href="modifyOrder"'>수정하기</span></p>
					<table class='orderTable'>
						<tr>
							<td>성명</td>
							<td>김알다</td>
						</tr>
						<tr>
							<td>연락처</td>
							<td>010-0000-0000</td>
						</tr>
						<tr>
							<td>주소</td>
							<td>광주 동구 금남로 226-11, 3층</td>
						</tr>
						<tr>
							<td>요청사항</td>
							<td><select class='orderDeliveryOption'>
								<option value='' selected>요청사항을 입력해주세요</option>
								<option value=''>배송 전에 미리 연락 바랍니다.</option>
								<option value=''>부재시 경비실에 맡겨 주세요.</option>
								<option value=''>부재시 전화 주시거나 문자 남겨 주세요.</option>
							</select></td>
						</tr>
					</table>
				</div>
			</div>
			<div class='orderInfoTitle'>
				<h4>할인선택</h4>
				<hr style='margin: 18px auto; border-color: #727F8A;'>
				<div class='coupon'>
					<p class='discountCouponTitle'>할인쿠폰<span class='apply'>적용가능 <span class='applyCount'>2</span>장</span></p>
					<div class='couponSelect' id='Bshow'>
						<div class='couponName'><p>회원가입 감사 쿠폰</p></div>
						<div class=couponDiscount><p>-5,000원 <img src="../image/icon/blackArrRight.png"></p></div>
					</div>	
				</div>
				<div class='point'>
					<p class='discountCouponTitle'>포인트<span class='apply'>보유포인트 <span class='applyCount'>40,000</span>P</span></p>
					<div class='pointSelect'>
						<div><input type='text' id='applyPoints'></div>
						<div class='pointBtn'><p>전액사용</p></div>
					</div>	
				</div>
			</div>
				<div class='orderInfoTitle'>
				<h4>결제수단</h4>
				<hr style='margin: 18px auto; border-color: #727F8A;'>
				<div class='coupon'>
					<p class='discountCouponTitle'>기프트카드<span class='apply'>사용시 총 결제금액 <span class='applyCount'>526,900</span>원</span></p>
					<div class='couponSelect' id='Gshow'>
						<div class='couponName'><p>30,000원권</p></div>
						<div class=couponDiscount><p>기프트카드 선택 <img src="../image/icon/blackArrRight.png"></p></div>
					</div>	
				</div>
			</div>
			<hr style='border-color: #CCCCCC; margin: 30px auto;'>
			<div class='orderBtn'>
				<button type='button' class='paymentMethodBtn'>계좌이체</button>
				<button type='button' class='paymentMethodBtn'>신용카드결제</button>
			</div>
		</div>
		
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
	 	 				<table>
	 	 					<tr>
	 	 						<td class='couponTd1'><input type='radio' name='check'></td>
	 	 						<td class='couponTd2'><p class='couponPopText'>선택안함</p></td>
	 	 						<td class='couponTd3'></td>
	 	 					</tr>
	 	 					<tr>
	 	 						<td class='couponTd1'><input type='radio' name='check'></td>
	 	 						<td class='couponTd2'><p class='couponPopText'>회원가입 감사쿠폰 10% 할인</p>
	 	 							<p class='couponPopPeriod'>2021.01.01 ~ 2022.02.01 <span>사용가능</span></p>
	 	 						</td>
	 	 						<td class='couponTd3'>10%</td>
	 	 					</tr>
	 	 					<tr>
	 	 						<td class='couponTd1'><input type='radio' name='check'></td>
	 	 						<td class='couponTd2'><p class='couponPopText'>SLIVER 10% 할인쿠폰 <span>*100,000원 이상 결제시 사용가능</span></p>
	 	 							<p class='couponPopPeriod'>2021.01.01 ~ 2022.02.01 <span>사용가능</span></p></td>
	 	 						<td class='couponTd3'>10%</td>
	 	 					</tr>
	 	 				</table>
	 	 		</div>
	 	 			
 	 				<div class='pageBtn'>
						<img src='../image/icon/arrleft.png'>
							<ul style='padding-left: 0px;'>
								<li style='font-weight: bold;'>1</li>
							</ul>
						<img src='../image/icon/arrRight.png'>
					</div>
					
					<div class='couponPopBtn'>
						<button type='button' class='couponSelectBtn'>선택완료</button>
					</div>
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
	 	 		<div class='giftListS'>
	 	 			<div class='giftCardList'>
		 	 			<div class='giftCardNoItem giftCardClick'>
		 	 				<p>적용안함</p>
		 	 			</div>	
		 	 			<div class='giftCardItem giftCardClick'>
		 	 				<div class='giftCardImg'>
		 	 					<img src='../image/items/gift5.png'>
		 	 				</div>	
		 	 				<div class='giftCardText'>
		 	 					<p class='giftFrom'>FROM. <span>000</span>님</p>
		 	 					<p class='giftCardName'>[기프트카드] 50,000원권</p>
		 	 					<p class='giftcardPrice'>50,000원</p>
		 	 					<p class='giftcardPeriod'>유효기간 : 2022.12.31</p>
		 	 				</div>
		 	 			</div>
		 	 				<div class='giftCardItem giftCardClick'>
		 	 				<div class='giftCardImg'>
		 	 					<img src='../image/items/gift5.png'>
		 	 				</div>	
		 	 				<div class='giftCardText'>
		 	 					<p class='giftFrom'>FROM. <span>000</span>님</p>
		 	 					<p class='giftCardName'>[기프트카드] 50,000원권</p>
		 	 					<p class='giftcardPrice'>50,000원</p>
		 	 					<p class='giftcardPeriod'>유효기간 : 2022.12.31</p>
		 	 				</div>
		 	 			</div>
		 	 				<div class='giftCardItem giftCardClick'>
		 	 				<div class='giftCardImg'>
		 	 					<img src='../image/items/gift5.png'>
		 	 				</div>	
		 	 				<div class='giftCardText'>
		 	 					<p class='giftFrom'>FROM. <span>000</span>님</p>
		 	 					<p class='giftCardName'>[기프트카드] 50,000원권</p>
		 	 					<p class='giftcardPrice'>50,000원</p>
		 	 					<p class='giftcardPeriod'>유효기간 : 2022.12.31</p>
		 	 				</div>
		 	 			</div>	
		 	 				<div class='giftCardItem giftCardClick'>
		 	 				<div class='giftCardImg'>
		 	 					<img src='../image/items/gift5.png'>
		 	 				</div>	
		 	 				<div class='giftCardText'>
		 	 					<p class='giftFrom'>FROM. <span>000</span>님</p>
		 	 					<p class='giftCardName'>[기프트카드] 50,000원권</p>
		 	 					<p class='giftcardPrice'>50,000원</p>
		 	 					<p class='giftcardPeriod'>유효기간 : 2022.12.31</p>
		 	 				</div>
		 	 			</div>			 	 	
		 	 			
	 	 			</div>
	 	 		</div>
	 	 			<div class='pageDown'>
	 	 				<div class='pageBtn'>
							<img src='../image/icon/arrleft.png'>
								<ul style='padding-left: 0px;'>
									<li style='font-weight: bold;'>1</li>
								</ul>
							<img src='../image/icon/arrRight.png'>
						</div>
						
						<div class='giftPopBtn'>
							<button type='button' class='giftSelect'>선택완료</button>
						</div>
	 	 			</div>
 	 		</div>
 	 	</div>
 	</div>
 	<script>
 	$(function() {
    	$('.topSubMenu').append(
    		"<h4 class='basketMenu'>주문결제 <span>장바구니 ><span style='color: #242424;'> 주문결제</span> > 결제완료</span></h4>"		
    	);
    })
 	</script>
 	<script type="text/javascript">
	 	$(document).on('click','#Bshow',function(){
			$('.couponPop').addClass('show');
		})
		$(document).on('click','#close4',function(){
			$('.couponPop').removeClass('show');
		})
 		$(document).on('click','#Gshow',function(){
 			$('.giftPop').addClass('show');
 		})
 		$(document).on('click','#close5',function(){
 			$('.giftPop').removeClass('show');
 		})
 		$(document).on('click','.couponSelectBtn',function(){
 			$('.couponPop').removeClass('show');
 		})
 		$(document).on('click','.giftSelect',function(){
 			$('.giftPop').removeClass('show');
 		})
 		

 	</script>
	<script>
 		$(document).on('click','.giftCardClick', function(){
 			$('.giftCardClick').removeClass('giftCardCss');
 			$(this).addClass('giftCardCss');
 		}) 
 		$(document).on('click','.paymentMethodBtn',function(){
 			$('.paymentMethodBtn').removeClass('payMethodCSS');
 			$(this).addClass('payMethodCSS');
 			
 		})
 	</script>
</body>
</html>