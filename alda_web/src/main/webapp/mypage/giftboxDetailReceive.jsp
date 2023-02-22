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

</head>
<body>
<%@include file="../header_noTop.jsp"%>
   <!-- <div class='topSubs'>
	   		<div class='topMenus'>
	   			<div class=topSubMenu>
			   		<h4 class='basketMenu'>마이페이지</h4>
	   			</div>
		   		<div class='memberInfo2'>
	   			<p style='float: left; height: 30px;'>000님 | </p>
	   			<p>로그아웃</p>
	   		</div>
	   </div>
	   </div> -->
	
	
	<main class='Mypagecontent'>
		<div class='mypageSideMenu'>
		<ul>
			<li><a href='Myinfo'>내정보</a></li>
			<li><a href='point'>포인트&middot;쿠폰</a></li>
			<li><a href='wishList'>위시리스트</a></li>
			<li><a href='recent'>최근본상품</a></li>
			<li><a href='review'>나의리뷰</a></li>
			<li style='background-color: #8996A0;'><a href='giftBox' style='color: white; text-decoration: underline'>선물함</a></li>
			<li><a href='PurchaseHistory'>상품구매내역</a></li>
			<li><a href='exchange'>교환&middot;반품내역</a></li>
			
		</ul>
		</div>
		<div class='wishContent'>
			<h4>선물함</h4>
				<div class='giftBoxSender'>
					<div class='exchageItem'>
						<div class='exchangeImg'>
							<img src='../image/items/product1.png'>
						</div>
						<div class='exchangeInfo'>
							<p class='giftSender'>FROM.<span>000</span>님</p>
							<p class='giftStore'>보니에가구</p>
							<p class='purchaseName'>프라제르 아쿠아텍스 4인용 소파</p>
							<p class='purchaseOption'>옵션: <span>스카이블루</span> | 수량: <span>1</span></p>
							<p class='giftPrice'><span>499,000</span>원</p>
						</div>
					</div>
				</div>
			
					<div class='paymentInfo'>
					<p class='paymentTitle'>선물정보</p>
					<table class='deliveryTable'>
						<tr>
							<td>보낸 분</td>
							<td id='giftSender'>이알다</td>
						</tr>
						<tr>
							<td>선물금액</td>
							<td><span id='giftPrice'>195,000</span>원</td>
						</tr>
						<tr>
							<td>유효기간</td>
							<td id='validDate'>2022.12.31</td>
						</tr>
						<tr>
							<td>사용처</td>
							<td id='usePlace'>온라인(전용앱, 전용홈페이지)</td>
						</tr>
						<tr>
							<td>선물상태</td>
							<td style='color: #FF0404; font-weight: bold;' id='useState'>사용완료</td>
						</tr>
					</table>
					
				</div>
					<div class='paymentInfo'>
					<p class='paymentTitle'>선물사용정보</p>
					<table class='deliveryTable'>
						<tr>
							<td>사용일</td>
							<td id='useDate'>2022.01.01</td>
						</tr>
						<tr>
							<td>주문번호</td>
							<td id='orderNumber'>00000000</td>
						</tr>
						<tr>
							<td>배송상태</td>
							<td style='color: #FF0404; font-weight: bold;' id='deliveryState'>배송완료</td>
						</tr>
					</table>
					
				</div>
					<div class='paymentInfo'>
						<p class='paymentTitle'>배송정보</p>
						<table class='deliveryTable'>
							<tr>
								<td>성명</td>
								<td id='deliveryName'>홍길동</td>
							</tr>
							<tr>
								<td>연락처</td>
								<td id='deliveryNum'>010-0000-0000</td>
							</tr>
							<tr>
								<td>주소</td>
								<td id='deliveryAddress'>광주 동구 금남로 226-11, 3층</td>
							</tr>
							<tr>
								<td>요청사항</td>
								<td id='requestTerm'>직접 수령하겠습니다.</td>
							</tr>
						</table>
					
					</div>
				
				<div class='giftNotice'>
					<div class='giftInfo' style='border-bottom: 1px solid #CCCCCC;'>
						<div class='giftNoticeTxt'><p>이용안내</p></div>
						<div class='giftNoticeImg'><img src='../image/icon/downPass.png'></div>
					</div>
					<div class='infoResult'>
						<p>아아</p>
					</div>
					<div class='giftInfo'>
						<div class='giftNoticeTxt'><p>환불/취소 정책 및 방법</p></div>
						<div class='giftNoticeImg'><img src='../image/icon/downPass.png'></div>
					</div>
					<div class='infoResult'>
						<ul>
							<li>- 유효기간 이내 환불 요청시 결제금액의 100% 환불 가능합니다.</li>
							<li>- 유효기간 이후 환불 요청시 결제금액의 90% 환불 가능합니다.</li>
							<li>- 유효기간 이내 환불금액의 구매자에게 환불됩니다.</li>
							<li>- 유효기간 이후 환불금액은 수신자에게 환불됩니다.</li>
							<li>- 일부금액 사용 후에는 환불이 되지 않습니다.</li>
							<li>- 부분환불은 불가능합니다.</li>
						</ul>
					</div>
				</div>
			</div>
		</main>
 	<%@include file="../footer.jsp"%>
	<script>
	  $(function() {
	    	$('.topSubMenu').append(
	    		"<h4 class='basketMenu'>마이페이지</h4>"		
	    	);
	    })
	    
	    $('.giftInfo').click(function(){
			$(this).next().toggle();
		})
	</script>
</body>
</html>