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
			   		<h4 class='basketMenu'>결제완료 <span>장바구니 > 주문결제 > <span style='color: #242424;'>결제완료</span></span></h4>
	   			</div>
		   		<div class='memberInfo2'>
	   			<p style='float: left; height: 30px;'>000님 | </p>
	   			<p>로그아웃</p>
	   		</div>
	   </div>
	   </div> -->
	
	
	<main class='content'>
		<div class='CompleteMessage'>
			<img src="../image/icon/okIcon.png">
			<p class='messageInfo'>결제가 완료되었습니다.</p>
			<p class='messageDetail'>주문내역은 [마이페이지] - [상품구매내역] 에서 확인하실 수 있습니다.</p>
		</div>
		<div class='deliveryInfo'>
			<div class='okInfoTable'>
				<h4>배송정보</h4>
				<table>
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
						<td>문앞에 나둬주세요</td>
					</tr>
				</table>
			</div>
				<div class='okInfoTable'>
				<h4>결제정보</h4>
				<table>
					<tr>
						<td>결제수단</td>
						<td>신용카드 결제</td>
					</tr>
					<tr>
						<td>총 결제금액</td>
						<td style='font-weight: bold;'>556,900원</td>
					</tr>
					
				</table>
			</div>
			<div class='completeBtn'>
				<button type='button' onclick='location.href="../mypage/PurchaseHistory"'>구매내역확인</button>
				<button type='button' onclick='location.href="../index.jsp"'>메인으로</button>
			</div>
		</div>
	</main>
 	<%@include file="../footer.jsp"%>
 	<script>
 	  $(function() {
 	    	$('.topSubMenu').append(
 	    		"<h4 class='basketMenu'>결제완료 <span>장바구니 > 주문결제 > <span style='color: #242424;'>결제완료</span></span></h4>"		
 	    	);
 	    })
 	</script>
</body>
</html>