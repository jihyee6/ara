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
	.noBasketAlarm{
		text-align: center;
		margin: 150px auto;
	}
	.noBasketAlarm p{
		font-size: 24px;
		font-family: NotoSansR;
		color: #242424;
	}
</style>
</head>
<body>
<%@include file="../header_noTop.jsp"%>
   <!-- <div class='topSubs'>
	   		<div class='topMenus'>
	   			<div class=topSubMenu>
			   		<h4 class='basketMenu'>장바구니 <span><span style='color: #242424;'>장바구니</span> > 주문결제 > 결제완료</span></h4>
	   			</div>
		   		<div class='memberInfo2'>
	   			<p style='float: left; height: 30px;'>000님 | </p>
	   			<p>로그아웃</p>
	   		</div>
	   </div>
	   </div> -->
	
	
	<main class='content'>
		<div class='noBasketAlarm'>
			<p>장바구니에 담은 상품이 없습니다.</p>
		</div>
			<div class='alda_product'>
			<p class='aldaHeading'>추천상품</p>
			<div class='slideBtn'><span class='prev'><img src="../image/icon/arrleft.png"></span><p><span>1</span> / 3</p><span class='next'><img src="../image/icon/arrRight.png"></span></div>
			<div class='productSlide'>
				<div class='slideShow'>
					<div class='swiperbox'>
						<ul class='slides'>
							<li>
								<div class='aldaItems' onclick='location.href=""'>
									<img class='itemImg' src="../image/items/item1.png">
									<p class='itemName'>Q4 유로탑 롤팩 매트리스 2size 2컬러</p>
									<p class='itemSales'>710,000원 </p><span class='salePrice'>61%</span>
									<h5 class='itemPrice'>269,900원</h5>
									<p class='itemReviewCount' onclick='location.href=""'>리뷰 8,603</p>
									<div class='productInfo'>
										<div class='free'><p>무료배송</p></div>
										<div class='specialPrice'><p>특가</p></div>
										<div class='buyIn'><p>바이인</p></div>
									</div>
								</div>						
							</li>	
							<li>
								<div class='aldaItems' onclick='location.href=""'>
									<img class='itemImg' src="../image/items/item2.png">
										<p class='itemName'>T402HF 오피스/학생 매쉬의자</p>
										<p class='itemSales'>258,000원 </p><span class='salePrice'>30%</span>
										<h5 class='itemPrice'>179,000원</h5>
										<p class='itemReviewCount' onclick='location.href=""'>리뷰 4,283</p>
										<div class='productInfo'>
											<div class='free'><p>무료배송</p></div>
											<div class='specialPrice'><p>특가</p></div>
											<div class='buyIn'><p>바이인</p></div>
									</div>
								</div>
							</li>
							<li>
								<div class='aldaItems' onclick='location.href=""'>
									<img class='itemImg' src="../image/items/item3.png">
									<p class='itemName'>2022NEW 블루스카이 공기청정기</p>
									<p class='itemSales'>359,000원 </p><span class='salePrice'>45%</span>
									<h5 class='itemPrice'>195,000원</h5>
									<p class='itemReviewCount' onclick='location.href=""'>리뷰 1,361</p>
									<div class='productInfo'>
										<div class='free'><p>무료배송</p></div>
										<div class='specialPrice'><p>특가</p></div>
										<div class='buyIn'><p>바이인</p></div>
									</div>
								</div>
							</li>
							<li>	
								<div class='aldaItems' onclick='location.href=""'>
									<img class='itemImg' src="../image/items/item4.png">
									<p class='itemName'>비침없는 화이트 도톰 레이스/쉬폰커튼</p>
									<p class='itemSales'>710,000원 </p><span class='salePrice'>61%</span>
									<h5 class='itemPrice'>269,900원</h5>
									<p class='itemReviewCount' onclick='location.href=""'>리뷰 8,603</p>
									<div class='productInfo'>
										<div class='free'><p>무료배송</p></div>
										<div class='specialPrice'><p>특가</p></div>
										<div class='buyIn'><p>바이인</p></div>
									</div>
								</div>
							</li>
							
						</ul>
					</div>
				</div>
				
			</div>
			
		</div>
		
	</main>
 	<%@include file="../footer.jsp"%>
 	<script>
 	 $(function() {
     	$('.topSubMenu').append(
     		"<h4 class='basketMenu'>장바구니 <span><span style='color: #242424;'>장바구니</span> > 주문결제 > 결제완료</span></h4>"		
     	);
     })
 	</script>
 	<script>
	 	 	const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
		    const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들 
		    let currentIdx = 0; //현재 슬라이드 index 
		    const slideCount = slideImg.length; // 슬라이드 개수 
		    const prev = document.querySelector('.prev'); //이전 버튼 
		    const next = document.querySelector('.next'); //다음 버튼 
		    const slideWidth = 230; //한개의 슬라이드 넓이 
		    const slideMargin = 10; //슬라이드간의 margin 값 
		    //전체 슬라이드 컨테이너 넓이 설정 
		    //slides.style.width = (slideWidth + slideMargin) * slideCount + 'px'; 
		    function moveSlide(num) { 
	     slides.style.left = -num * 250 + 'px'; 
	     currentIdx = num; 
	     }
	    	prev.addEventListener('click', function () {
	        /*첫 번째 슬라이드로 표시 됐을때는 이전 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx !==0일때만 moveSlide 함수 불러옴 */ 
	        if (currentIdx !== 0) moveSlide(currentIdx - 1); });
	        next.addEventListener('click', function () { 	
	        /* 마지막 슬라이드로 표시 됐을때는 다음 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx !==slideCount - 1 일때만 moveSlide 함수 불러옴 */
	        if (currentIdx !== slideCount - 1) { moveSlide(currentIdx + 1); } });
 	</script>
</body>
</html>