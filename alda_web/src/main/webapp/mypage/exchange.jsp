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
	.exchangeBoxCss{
		outline: 2px solid #8996A0; 
		color: #8996A0;
		font-weight: bold;
	}
</style>

</head>
<body>
<%@include file="../header_noTop.jsp"%>
  <!--  <div class='topSubs'>
	   		<div class='topMenus'>
	   			<div class=topSubMenu>
			   		<h4 class='basketMenu'>마이페이지</h4>
	   			</div>
		   		<div class='memberInfo2'>
	   			<p style='float: left; height: 30px;'>000님 | </p>
	   			<p>로그아웃</p>
	   			<p onclick='location.href="../login/login"'>로그인</p>
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
			
			<!-- 교환반품내역 종류별 수치 -->
			<div class='exchangeState'>
				<div class='exchangeStateBox' id='defaultOpen'>
					<p class='statusName'>전체</p>
					<p class='statusCount'>2</p>
				</div>
				<div class='exchangeStateBox'>
					<p class='statusName'>교환</p>
					<p class='statusCount'>0</p>
				</div>
				<div class='exchangeStateBox'>
					<p class='statusName'>교환완료</p>
					<p class='statusCount'>1</p>
				</div>
				<div class='exchangeStateBox' >
					<p class='statusName'>반품</p>
					<p class='statusCount'>0</p>
				</div>
				<div class='exchangeStateBox' >
					<p class='statusName'>반품완료</p>
					<p class='statusCount'>1</p>
				</div>
			</div>
			
			<!-- 교환반품내역 상품 박스 -->
			<div class='tabcontent' id='all'>
				<div class='exchangeBox'>
					<div class='exchangeDate'>
						<p>2022.01.01 <span class='exchangeStateTxt'>반품완료</span> <span class='exchangeDetail' onclick='location.href="returnDetail"'>내역상세</span></p>
					</div>
					<div class='exchageItem'>
						<div class='exchangeImg'>
							<img src='../image/items/product1.png'>
						</div>
						<div class='exchangeInfo'>
							<p class='purchaseStore'>보니에가구</p>
							<p class='purchaseName'>프라제르 아쿠아텍스 4인용 소파</p>
							<p class='purchaseOption'>옵션: <span>스카이블루</span> | 수량: <span>1</span></p>
							<p class='purchasePrice'>499,000원</p>
						</div>
					</div>
				</div>
				<!-- 교환반품내역 상품 박스 끝 -->
				<div class='exchangeBox'>
					<div class='exchangeDate'>
						<p>2022.01.01 <span class='exchangeStateTxt' style='color: #005DFF;'>교환완료</span> <span class='exchangeDetail' onclick='location.href="exchangeDetail"'>내역상세</span></p>
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
			</div>
		</div>
		
	</main>
 	<%@include file="../footer.jsp"%>
 	<script type="text/javascript">
	 	$(document).on('click','.exchangeStateBox',function(){
	 		$('.exchangeStateBox').removeClass('exchangeBoxCss');
	 		$(this).addClass('exchangeBoxCss');
	 	})
	 	
	 	document.getElementById('defaultOpen').click();
 	</script>
 	<script>
	 	 $(function() {
		   	$('.topSubMenu').append(
		   		"<h4 class='basketMenu'>마이페이지</h4>"		
	    	);
	 	 })
 	</script>
 
</body>
</html>