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
	.exchangeDateInfo p{
		font-size: 15px;
		font-family: NotoSansM;
		font-weight: bold;
		color: #242424;
	}
	.exchangeDetailBox{
		border-bottom: 1px solid #DCDCDC;
		padding-bottom: 12px;
	}

</style>
	
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
		<!-- 마이페이지 사이드바 -->
		<div class='mypageSideMenu'>
		<ul>
			<li><a href='Myinfo'>내정보</a></li>
			<li><a href='point'>포인트&middot;쿠폰</a></li>
			<li><a href='wishList'>위시리스트</a></li>
			<li><a href='recent'>최근본상품</a></li>
			<li><a href='review'>나의리뷰</a></li>
			<li><a href='giftBox'>선물함</a></li>
			<li><a href='PurchaseHistory'>상품구매내역</a></li>
			<li style='background-color: #8996A0;'><a href='exchange' style='color: white; text-decoration: underline'>교환&middot;반품내역</a></li>
			
		</ul>
		</div>
		
		<!-- 마이페이지 내용 -->
		<div class='wishContent'>
			<h4>교환 &middot; 반품내역</h4>
			
			<!-- 교환반품내역 상품 박스 -->
			<div class='exchangeDetailBox'>
				<div class='exchangeDateInfo'>
					<p>2022.01.01 <span class='exchangeStateTxt'>반품완료</span></p>
				</div>
				<div class='exchageItem'>
					<div class='exchangeImg'>
						<img src='../image/items/product1.png'>
					</div>
					<div class='exchangeInfo'>
						<p class='purchaseStore'>보니에가구</p>
						<p class='purchaseName'>프라제르 아쿠아텍스 4인용 소파</p>
						<p class='purchaseOption'>옵션: <span>스카이블루</span> | 수량: <span>1</span></p>
						<p class='purchasePrice'><span>499,000</span>원</p>
					</div>
				</div>
			</div>
			<!-- 교환반품내역 상품 박스 끝 -->
				<div class='paymentInfo'>
				<p class='paymentTitle'>반품정보</p>
				<table class='deliveryTable'>
					<tr>
						<td>접수번호</td>
						<td>10643</td>
					</tr>
					<tr>
						<td>사유</td>
						<td>단순변심</td>
					</tr>
				</table>
				
			</div>
				<div class='paymentInfo'>
				<p class='paymentTitle'>배송정보</p>
				<table class='deliveryTable'>
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
				<div class='paymentInfo'>
				<p class='paymentTitle'>환불정보</p>
				<table class='deliveryTable'>
					<tr>
						<td>상품금액</td>
						<td><span>499,000</span>원</td>
					</tr>
					<tr>
						<td>배송금액</td>
						<td><span>0</span>원</td>
					</tr>
					<tr>
						<td>환불금액</td>
						<td><span>499,000</span>원</td>
					</tr>
					<tr>
						<td>환불수단</td>
						<td>카카오뱅크</td>
					</tr>
					<tr>
						<td>총 환불금액</td>
						<td style='font-size: 16px; font-weight: bold;'><span>499,000</span>원</td>
					</tr>
				</table>
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