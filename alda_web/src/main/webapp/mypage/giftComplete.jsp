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
			<h4>주문완료</h4>
			<div class='giftCompleteMessage'>
				<img src='../image/icon/okIcon.png'>
				<h3>선물주문이 완료되었습니다.</h3>
				<p>선물내역은 [마이페이지] - [선물함] 에서 확인하실 수 있습니다.</p>
			</div>
			<div class='completeDeliveryInfo'>
				<p>배송정보</p>
				<table class='completeDeliveryTable'>
					<tr>
						<td>성명</td>
						<td id='giftName'>김알다</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td id='giftTel'>010-0000-0000</td>
					</tr>
					<tr>
						<td>주소</td>
						<td id='giftAddress'>광주 동구 금남로 226-11, 3층</td>
					</tr>
					<tr>
						<td>요청사항</td>
						<td id='RequestTerm'>직접 수령하겠습니다.</td>
					</tr>
				</table>
				<div class='giftcompleteBtn'>
					<button type='button' onclick='location.href="giftBox"'>선물함으로</button>
					<button type='button' onclick='location.href="../index.jsp"'>메인으로</button>
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
	</script>
</body>
</html>