<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="체험 기반 종합 쇼핑몰 ARA입니다.">
<meta property="og:type" content="website"> 
<meta property="og:title" content="알아">
<meta property="og:description" content="체험 기반 종합 쇼핑몰 알아입니다.">
<meta property="og:url" content="http://www.aldainc.co.kr/">
<meta name="twitter:title" content="알아">
<meta name="twitter:card" content="summary">
<meta name="twitter:description" content="체헙기반 종합쇼핑몰 알아입니다.">
<meta name="robots" content=“index”>
<meta name="robots" content="follow">
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<title>ARA</title>
<style>
	
/* 메인 배너 슬라이더 */
.main-bn {
    width:100%;
    height:340px;
    position:relative;
}

.main-bn > .slider > .slideNumber > .bn {
    background-repeat:no-repeat;
    background-position:center;
    background-size:cover;
    position:absolute;
    top:0;
    left:0;
    right:0;
    bottom:0;
    opacity:0;
    visibility:hidden;d
    transition:opacity 1s, visibility 1s;
}
.main-bn > .slider > .slideNumber > .bn > img{
	width: 100%;
    height: 340px;
    cursor: pointer;
}

e
.main-bn > .slider > .slideNumber > .bn.active {
    opacity:1;
    visibility:visible;
}



/* 슬라이더 페이지 버튼 */
.main-bn > .slider > .page-btns {
    position:absolute;
    left: 854px;
    bottom: 8px;
}

.main-bn > .slider > .page-btns > .page-btn {
    color:#ffffff;
    display:inline-block;
    cursor:pointer;
    border: none;
    background-color: transparent;
}

.main-bn > .slider > .page-btns > .next-btn {
    margin-left:68px;
}

.main-bn > .slider > .page-btns > .page-btn > i {
    display:block;
    font-size:20px;
}

/* 슬라이더 페이지 번호 */
.main-bn > .slider > .page-btns > .page-no {
    position:absolute;
    top: -4px;
    left: 52%;
    transform:translateX(-50%);
    width: 80px;
    height: 28px;
    text-align: center;
    border-radius: 8px;

}

.main-bn > .slider > .page-btns > .page-no > span {
    display:inline-block;
    color:#fff;
    font-size:18px;
}
.topMenusCss{
	color: #4B5D68;
	border-bottom: 3px solid #4B5D68;
	padding-bottom: 8px;
	text-align: center;
}
	
</style>
</head>
<body>
<% String id = (String) session.getAttribute("id"); %>
<header>
		<div class='top_header'>
			<div class='header_margin'>
				<div class='logo'>
					<a href='index.jsp'><img src="image/header/headerAaraLogo.png"></a>
				</div>
				  <div class="searchBox">
					<a class='glasses'><img class='searchImg' id='searchIcon' src="image/header/glasses.png"></a>      
			      	<input type="text" class="searchTxt" placeholder="검색"><button class='searchBtn' type='button' onclick = 'searchProductText()'>검색</button>
			    </div>
			   <nav class='headNav'>
			   		<ul id='main_menu'>
			   			<li><a href='mypage/wishList'><img src='image/header/wish.png'></a></li>
			   			<li><a href='menu/basket'><img src='image/header/shopping.png'></a></li>
			   			<li class='myMenu'><a><img src='image/header/info.png'></a>
			   				<div class='subBollom subMy'>
				   				<ul class ='submenu'>
				   					<li><a href='mypage/Myinfo'>내정보</a></li>
				   					<li><a href='mypage/point'>포인트 &middot; 쿠폰</a></li>
				   					<li><a href='mypage/wishList'>위시리스트</a></li>
				   					<li><a href='mypage/recent'>최근 본 상품</a></li>
				   					<li><a href='mypage/review'>나의리뷰</a></li>
				   					<li><a href='mypage/giftBox'>선물함</a></li>
				   					<li><a href='mypage/PurchaseHistory'>상품구매내역</a></li>
				   					<li><a href='mypage/exchange'>교환 &middot; 반품내역</a></li>
				   					<!-- <li><a onclick='logout()'>로그아웃</a></li> -->
				   				</ul>
			   				</div>
		   				</li>   				
			   				
			   			<li class='seeMenu'><a><img src='image/header/seemore.png'></a>
			   				<div class='subBollom subSee'>
			   				<ul class='submenu'>
			   					<li><a href='seemore/notice'>공지사항</a></li>
			   					<li><a href='seemore/giftcard'>선물하기</a></li>
			   					<li><a href='menu/event'>이벤트</a></li>
			   					<li><a href='seemore/benefits'>회원등급혜택</a></li>
			   					<li><a href='seemore/faq'>FAQ</a></li>
			   					<li><a href='seemore/terms'>이용약관</a></li>
			   				</ul>
		   				</div>
			   			</li>
			   		</ul>
			   </nav>
			</div>
		</div>
		
	   <div class='top_menu'>
	   		<div class='topMenus'>
		   		<ul>
		   			<li class='topMenusCss'><a class='topMenusTag' href='index.jsp'>홈</a></li>
		   			<li><a class='topMenusTag' href='menu/store'>스토어</a></li>
		   			<li><a class='topMenusTag' href='menu/search'>카테고리검색</a></li>
		   			<li><a class='topMenusTag' href='menu/buyin'>바이인</a></li>
		   			<li><a class='topMenusTag' href='menu/hotdeal'>핫딜</a></li>
		   			<li><a class='topMenusTag' href='menu/event'>이벤트</a></li>
		   		</ul>
	   		
		   		<div class='memberInfo'>
		   			<p id='userName' style='float: left;'></p>
		   			<p id='loginBtn' style='float: right; margin-left: 0px;'></p>
		   		</div>
	   		</div>
	   </div>
	</header>
	
	<main class='content'>
		<div class='bannerSlide'>
			<div class='wrap'>
				<div class='main-bn'>
					<div class='slider'>
						<div class='slideNumber' style='height: 340px;'>
							<!-- <div class='bn active'>
								<img src="image/header/slide1.png">
							</div>
							<div class='bn'>
								<img src="image/items/pointAd.png">
							</div> -->
						</div>
						 <div class="page-btns">
		                    <button class="page-btn prev-btn"><i class="xi-angle-left"></i></button>
		                    <button class="page-btn next-btn"><i class="xi-angle-right"></i></button>
		                    <div class="page-no">
		                        <span class="current-slide-no"></span>
		                        <span class="slash">/</span>
		                        <span class="total-slide-no"></span>
		                    </div>
		                </div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- <div class='menuList'>
			<div class='menuContent' onclick='location.href="menu/store"'>
				<img src="image/header/Store.png">
				<p>스토어</p>	
			</div>
			<div class='menuContent' onclick='location.href="menu/buyin"'>
				<img src="image/header/Buyin.png">
				<p>바이인</p>	
			</div>
			<div class='menuContent' onclick='location.href="mypage/point"'>
				<img src="image/header/Coupon.png">
				<p>쿠폰/포인트받기</p>	
			</div>
			<div class='menuContent' onclick='location.href=""'>
				<img src='image/header/Delivery.png'>
				<p>당일배송</p>	
			</div>
			<div class='menuContent' onclick='location.href="menu/hotdeal"'>
				<img src="image/header/Hotdeal.png">
				<p>핫딜</p>	
			</div>
			<div class='menuContent' onclick='location.href="menu/event"' style='margin-right: 0px;'>
				<img src="image/header/Event.png">
				<p>이벤트</p>	
			</div>
		</div> -->
		
		<div class='alda_product'>
			<p class='aldaHeading'>ARA 대표상품 <span class='viewAll' onclick='location.href="menu/store"'>전체보기</span></p>
			<div class='slideBtn'><span class='prev'><img src="image/icon/arrleft.png"></span><p style='font-family: pretendard;'><span id='current'>1</span> / <span id='total'></span></p><span class='next'><img src="image/icon/arrRight.png"></span></div>
			<div class='productSlide'>
				<div class='slideShow'>
					<div class='swiperbox'>
						<ul class='slides'>
							<!-- <li>
								<div class='aldaItems'>
									<img class='itemImg' src="image/items/item1.png">
									<p class='itemName'>Q4 유로탑 롤팩 매트리스 2size 2컬러</p>
									<p class='itemSales'>710,000원 </p><span class='salePrice'>61%</span>
									<h5 class='itemPrice'>269,900원</h5>
									<p class='itemReviewCount'>리뷰 8,603</p>
									<div class='productInfo'>
										<div class='free'><p>무료배송</p></div>
										<div class='specialPrice'><p>특가</p></div>
										<div class='buyIn'><p>바이인</p></div>
									</div>
								</div>						
							</li> -->
							
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class='buyinHotel'>
			<p class='buyinhotelHeading'>바이 인 호텔 <span class='viewAll' onclick='location.href="menu/buyin"'>전체보기</span></p>
			<div class='slideBtn'><span class='prev2'><img src="image/icon/arrleft.png"></span><p style='font-family: pretendard;'><span id='buyinCount'>1</span> / <span id='buyinTotal'></span></p><span class='next2'><img src="image/icon/arrRight.png"></span></div>
			<div class='hotelItem'>
				<div class='slideShow'>
					<div class='swiperbox'>
						<ul class='slides2'>
							<!-- <li><img class='hotelImg' src="image/items/hotel1.png"></li> -->
						</ul>
					</div>
				</div>
			</div>
		</div>
	</main>	
	<footer>
		<div class="footer">
			<div class="foot">
				<div class="flogo">
					<img src="image/icon/footerAraLogo.png" alt="address">
				</div>
				<div class="address">
					<ul class="link">
						<li><a href="seemore/terms" target="_blank">이용약관</a></li>
						<li><a href="seemore/personal" target="_blank">개인정보처리방침</a></li>
						<li><a href="seemore/email"  target="_blank">이메일무단수집거부</a></li>
						<li><a href="seemore/marketing"  target="_blank">마케팅활용동의</a></li>
					</ul>
					&copy;Copyrights 2021 ARA All rights reserved. Contact Us.<br>
					광주광역시 북구 자미로 6번길 7(신안동)&nbsp;|&nbsp;대표자 임충섭&nbsp;|&nbsp;전화번호 : 062-230-0115&nbsp;|&nbsp; FAX: 062-227-6400
				</div>
			</div>
		</div>
	</footer>
	
	<script>
	    /* 알다대표상품 슬라이드 */
	    const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
	    const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들 
	    let currentIdx = 0; //현재 슬라이드 index 
	    const slideCount = slideImg.length; // 슬라이드 개수 
	    const prev = document.querySelector('.prev'); //이전 버튼 
	    const next = document.querySelector('.next'); //다음 버튼 
	    const slideWidth = 230; //한개의 슬라이드 넓이 
	    const slideMargin = 10; //슬라이드간의 margin 값 
	    const currentNum = 1;
	    //전체 슬라이드 컨테이너 넓이 설정 
	    //slides.style.width = (slideWidth + slideMargin) * slideCount + 'px'; 
	             
	    function moveSlide(num) { 
            slides.style.left = -num * 400 + 'px'; 
            currentIdx = num; 
        }
        prev.addEventListener('click', function () {
                /*첫 번째 슬라이드로 표시 됐을때는 이전 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx !==0일때만 moveSlide 함수 불러옴   */
           if (currentIdx !== 0) moveSlide(currentIdx - 1);
               
           if($('#total').text() == $('#current').text()){
        	   $('#current').text($('#total').text());
           } else{
		       	$('#current').text(currentIdx+1);
           }
                
       });
  	      next.addEventListener('click', function () { 
            /* 마지막 슬라이드로 표시 됐을때는 다음 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx !==slideCount - 1 일때만 moveSlide 함수 불러옴 */
       if (currentIdx !== $('.bannerImg').length - 1) { 
       	moveSlide(currentIdx + 1);
       	/* if ($('.slides').css("width").replace("px","") < parseInt($('.slides').css("left"))*-1) {
           	$('.slides').css("left", -10);
           }  */
           if($('#total').text() == $('#current').text()){
        	   $('#current').text($('#total').text());
           } else{
		       	$('#current').text(currentIdx+1);
           }
        }
 	 });
	    
           /* function moveSlide(num) { 
               slides.style.left = (-num * 250 - 24) + 'px'; 
               currentIdx = num; 
           }
           prev.addEventListener('click', function () {
                /*첫 번째 슬라이드로 표시 됐을때는 이전 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx !==0일때만 moveSlide 함수 불러옴 
                if (currentIdx > 0) {
              	  moveSlide(currentIdx - 1); 
                } else {
              	  moveSlide($('.slides li').length - 3);
                }
           });
           
           next.addEventListener('click', function () { 
                /* 마지막 슬라이드로 표시 됐을때는 다음 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx !==slideCount - 1 일때만 moveSlide 함수 불러옴 
                 if (currentIdx < $('.slides li').length - 3) { 
                 	moveSlide(currentIdx + 1);
                 } else {
              	   moveSlide(0);
                 }
           }); */
            
            /* 바이인호텔 슬라이드 */
            const slides2 = document.querySelector('.slides2'); //전체 슬라이드 컨테이너
            const slideImg2 = document.querySelectorAll('.slides2 li'); //모든 슬라이드들 
            let currentIdx2 = 0; //현재 슬라이드 index 
            const slideCount2 = slideImg2.length; // 슬라이드 개수 
            const prev2 = document.querySelector('.prev2'); //이전 버튼 
            const next2 = document.querySelector('.next2'); //다음 버튼 
            const slideWidth2 = 320; //한개의 슬라이드 넓이 
            const slideMargin2 = 30; //슬라이드간의 margin 값 
            const currentNum2 = 1;
            //전체 슬라이드 컨테이너 넓이 설정 
            //slides.style.width = (slideWidth + slideMargin) * slideCount + 'px'; 
           
            function moveSlide2(num) { 
                slides2.style.left = -num * 600 + 'px'; 
                currentIdx2 = num; 
           }
           prev2.addEventListener('click', function () {
               /*첫 번째 슬라이드로 표시 됐을때는 이전 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx !==0일때만 moveSlide 함수 불러옴 */ 
               if (currentIdx2 !== 0) moveSlide2(currentIdx2 - 1); 
               if($('#buyinTotal').text() == $('#buyinCount').text()){
            	   $('#buyinCount').text($('#buyinTotal').text());
               } else{
    		       	$('#buyinCount').text(currentIdx2+1);
               }
          });
          next2.addEventListener('click', function () { 
               /* 마지막 슬라이드로 표시 됐을때는 다음 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx !==slideCount - 1 일때만 moveSlide 함수 불러옴 */
          		if (currentIdx2 !== $('.slides2 li').length - 1) moveSlide2(currentIdx2 + 1);
          		 if($('#buyinTotal').text() == $('#buyinCount').text()){
              	   $('#buyinCount').text($('#buyinTotal').text());
                 } else{
      		       	$('#buyinCount').text(currentIdx2+1);
                 }
          });
            
           /*  function moveSlide2(num) { 
                slides2.style.left = (-num * 320 - 24) + 'px'; 
                currentIdx2 = num; 
            }
            prev2.addEventListener('click', function () {
                 /*첫 번째 슬라이드로 표시 됐을때는 이전 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx !==0일때만 moveSlide 함수 불러옴 
                 if (currentIdx2 > 0) {
               	  moveSlide2(currentIdx2 - 1); 
                 } else {
               	  moveSlide2($('.slides2 li').length - 3);
                 }
            });
            
            next2.addEventListener('click', function () { 
                 /* 마지막 슬라이드로 표시 됐을때는 다음 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx !==slideCount - 1 일때만 moveSlide 함수 불러옴
                  if (currentIdx2 < $('.slides2 li').length - 3) { 
                  	moveSlide2(currentIdx2 + 1);
                  } else {
               	   moveSlide2(0);
                  }
            }); */
	</script>
	<script>
		$(document).on('click','.passIcon',function(){
			if($('.searchAllList').css('display') == 'none'){
				$('.searchAllList').css('display','block');	
			} else {
				$('.searchAllList').css('display','none');	
			}
		})
	</script>
	
	<script>
   	 //console.clear();
		 // 상단 메인 배너 슬라이더
		 $('.main-bn > .slider > .page-btns > .page-btn').click(function(){
		     var $clicked = $(this);
		     var $slider = $(this).closest('.slider');
		     
		     var index = $(this).index();
		     var isLeft = index == 0;
		     
		     var $current = $slider.find(' > .slideNumber > .bn.active');
		     var $post;
		     
		     if (isLeft){
		         $post = $current.prev();
		     }
		     else {
		         $post = $current.next();
		     }
		     
		     if ( $post.length == 0 ){
		         if ( isLeft ){
		             $post = $slider.find(' > .slideNumber > .bn:last-child');
		         }
		         else {
		             $post = $slider.find(' > .slideNumber > .bn:first-child');
		         }
		     }
		     
		     $current.removeClass('active');
		     $post.addClass('active');
		     
		     pageNumber__Init();
		     updateCurrentPageNumber();
		 });
				
		 setInterval(function(){
		     $('.main-bn > .slider > .page-btns > .next-btn').click();
		 }, 8000);
		
		 // 슬라이더 페이지 번호 지정
		 function pageNumber__Init(){
		     // 전채 배너 페이지 갯수 세팅해서 .slider 에 'data-slide-total' 넣기
		     var totalSlideNo = $('.main-bn >.slider >.slideNumber >.bn').length;
		     
		     $('.main-bn > .slider').attr('data-slide-total', totalSlideNo);
		     
		     // 각 배너 페이지 번호 매기기
		     $('.main-bn > .slider > .slideNumber > .bn').each(function(index, node){
		         $(node).attr('data-slide-no', index + 1);
		     });
		 };
		
		
		 // 슬라이더 이동시 페이지 번호 변경
		 function updateCurrentPageNumber(){
		     var totalSlideNo = $('.main-bn > .slider').attr('data-slide-total');
		     var currentSlideNo = $('.main-bn > .slider > .slideNumber > .bn.active').attr('data-slide-no');
		     
		     $('.main-bn > .slider > .page-btns > .page-no > .total-slide-no').html(totalSlideNo);
		     $('.main-bn > .slider > .page-btns > .page-no > .current-slide-no').html(currentSlideNo);
		 };
		
	</script>
	<script>
		/* 검색어 롤링 */
	    function textScroll(scroll_el_id) {
	        this.objElement = document.getElementById(scroll_el_id);
	        this.objElement.style.position = 'relative';
	        this.objElement.style.overflow = 'hidden';

	        this.objLi = this.objElement.getElementsByTagName('li');
	        this.height = this.objElement.offsetHeight; // li 엘리먼트가 움직이는 높이(외부에서 변경가능)
	        this.num = this.objLi.length; // li 엘리먼트의 총 갯수
	        this.totalHeight = this.height*this.num; // 총 높이
	        this.scrollspeed = 2; // 스크롤되는 px
	        this.objTop = new Array(); // 각 li의 top 위치를 저장
	        this.timer = null;
	    
	    for(var i=0; i<this.num; i++){
	        this.objLi[i].style.position = 'absolute';
	        this.objTop[i] = this.height*i;
	        this.objLi[i].style.top = this.objTop[i]+"px";
	    }
	}

	textScroll.prototype.move = function(){
	    for(var i=0; i<this.num; i++) {
	        this.objTop[i] = this.objTop[i] - this.scrollspeed;
	        this.objLi[i].style.top = this.objTop[i]+"px";
	    }
	    if(this.objTop[0]%this.height == 0){
	        this.jump();
	    }else{
	        clearTimeout(this.timer);
	        this.timer = setTimeout(this.name+".move()",50);
	    }
	}

	textScroll.prototype.jump = function(){
	    for(var i=0; i<this.num; i++){
	        if(this.objTop[i] == this.height*(-2)){
	            this.objTop[i] = this.objTop[i] + this.totalHeight;
	            this.objLi[i].style.top = this.objTop[i]+"px";
	        }
	    }
	    clearTimeout(this.timer);
	    this.timer = setTimeout(this.name+".move()",3000);
	}

	textScroll.prototype.start = function() {
	    this.timer = setTimeout(this.name+".move()",3000);
	}
	
	  var real_search_keyword = new textScroll('scroll'); // 스크롤링 하고자하는 ul 엘리먼트의 id값을 인자로 넣습니다
	    real_search_keyword.name = "real_search_keyword"; // 인스턴스 네임을 등록합니다
	    real_search_keyword.start(); // 스크롤링 시작
	
	
		/* 알다 대표상품 클릭시 */ 		
		$(document).on('click','.aldaItems',function(){
			var product_id;
			product_id = $(this).attr('id');
			
			location.href='menu/productInfo?product=' + product_id;
		})
		
		/* 바이인 호텔 클릭시 */
		$(document).on('click','.hotelImg',function(){
			location.href='menu/hotelDetail';
		})
		
		
	</script>
	<script>
		var user_id = '<%=id%>';
		
		$(function() {
			
			$.ajax({
				url : "mainpage", // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        },
				success : function(result){
					data = result.data;
					console.log(data);
					
					eventData = data.events;
					productData = data.thumb_products;
					buyinData = data.thumb_buyinhotels;
					
					eventBanner();
					productItem();
					buyin();
					pageNumber__Init();
					updateCurrentPageNumber();
					
					$('#total').text(productData.length);
					$('#buyinTotal').text(buyinData.length);
					return false;
				},
				error : function(){
					alert("검색실패");
					return false;
				}
			})
			
		})
	</script>
	<script>
		function eventBanner(){
			for(var i = 0; i < eventData.length; i++)
			$('.slideNumber').append(
				"<div class='bn'>"
					+"<img id='" + eventData[i].event_id + "' src='" + eventData[i].event_img_url + "' onclick= 'newEventScreen(\"" + eventData[i].event_contents_url + "\")'>"
				+"</div>"		
			)
			$('.bn').eq(0).addClass('active');
		}
		function newEventScreen(src) {
			window.open(src, "event", 'width=800px');
		}
		
		function productItem(){
			var bannerLength = 260 * productData.length;
			
			for(var i = 0; i < productData.length; i++){
				$('.slides').append(
					"<li>"
						+"<div class='aldaItems' id='" + productData[i].product_id + "'>"
							+"<img class='itemImg' src='" + productData[i].product_img_url + "'>"
							+"<p class='itemName'>" + productData[i].product_name + "</p>"
							+"<div id='itemPrices" + i + "'>" 
								
							+"</div>"
							//+"<p class='itemReviewCount'>리뷰 " + productData[i].review_num + "</p>"
							+"<div class='productInfo' id = 'productInfo" + i + "'>"
							
							+"</div>"
						+"</div>"						
					+"</li>"		
				)
				
				if(!productData[i].dc_rate){
					$('#itemPrices'+i).append(
							"<h5 class='itemPrice'>" + productData[i].sale_price.toLocaleString('en') + "원</h5>"	
						)
				}else{
					$('#itemPrices'+i).append(
						"<p class='itemSales'>" + productData[i].list_price.toLocaleString('en') + "원 </p><span class='salePrice'>" + productData[i].dc_rate + "%</span>"
						+"<h5 class='itemPrice'>" + productData[i].sale_price.toLocaleString('en') + "원</h5>"	
					)
				}
				
				
				
				/* 무료배송일때 */
				if(productData[i].delivery_price == false){
					$('#productInfo'+i).append(
						"<div class='free'><p>무료배송</p></div>"		
					)
				}
				/* 세일제품일때 */
				if(productData[i].bargain_price == true){
					$('#productInfo'+i).append(
						"<div class='specialPrice'><p>특가</p></div>"		
					)
				}
				/* 바이인호텔일때 */
				if(productData[i].is_buyinhotel == true){
					$('#productInfo'+i).append(
						"<div class='buyIn'><p>바이인</p></div>"	
					)
				}
			}
			$('.slides').css('width', bannerLength);
		}
		
		//알다 대표상품 클릭시
		$(document).on('click','.aldaItems',function(){
			var product_id;
			product_id = $(this).attr('id');
			
			location.href='menu/productInfo?product=' + product_id;
		})
		
		function buyin(){
			var buyinLength = 330 * buyinData.length;
			
			for(var i = 0; i < buyinData.length; i++){
				$('.slides2').append(
					"<li>"
						+"<img class='hotelImg' id='" + buyinData[i].lodgement_id + "' src='" + buyinData[i].lodgement_img_url + "'>"
					+"</li>"		
				)
			}
			$('.slides2').css('width',buyinLength);
		} 
		
	</script>
	<script>
	/* 	function count(type)  {
			  // 결과를 표시할 element
			  const resultElement = document.getElementById('current');
			  const totalElement = document.getElementById('total');
			  
			  // 현재 화면에 표시된 값
			  let number = resultElement.innerText;
			  let totalNumber = totalElement.innerText;
			  
			  // 더하기/빼기
			  if(type === 'plus') {
			    number = parseInt(number) + 1;
			    if(number > totalNumber){
			    	number = tetalNumber;
			    }
			  }else if(type === 'minus')  {
			    number = parseInt(number) - 1;
			    if(number < 1){
			    	number = 1;
			    }
			  }
			  
			  // 결과 출력
			  resultElement.innerText = number;
			} */
	</script>
	<script>
		$(document).on('click','.searchBtn',function(){
			var text;
			text = $('.searchTxt').val();
			
			if(text == "") {
				alert("검색어를 입력해 주세요.");
			} else {
				 $.ajax({
					url : "products?thumb=true&text="+ text + "&large_category=" + null + "&small_category=" + null , // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					success : function(result){
						data = result.data;
						console.log(data);
	
						searchResult();
						
						location.href='menu/search?text=' + text;
						return false;
					},
					error : function(){
						alert("검색실패");
						return false;
					}
				})
			}
		})
		/* 검색결과 */
			function searchResult(){
				for(var i = 0; i < data.length; i++){
					$('.searchItemsArea').append(
						"<div class='searhResultItem'>"
							+"<div class='searchResultImg'>"
								+"<img class='roomItemImg' src='" + data[i].product_img_url + "'>"
							+"</div>"
							+"<p class='roomItemName'>" + data[i].product_name + "</p>"
							+"<div id='itemPrices" + i + "'>" 
							
							+"</div>"
							+"<p class='searchReviewCount'>리뷰 " + data[i].review_num + "</p>"
							+"<div class='productInfo' id='productInfo" + i + "'>"
								
							+"</div>"
						+"</div>"		
					)
					
					if(data[i].dc_rate == null){
						$('#itemPrices'+i).append(
							"<h5 class='itemPrice' style='padding-top: 46px;'>" + data[i].list_price.toLocaleString('en') + "원</h5>"	
						)
					} else {
						$('#itemPrices'+i).append(
							"<p class='itemSales'>" + data[i].list_price.toLocaleString('en') + "원 </p><span class='salePrice'>" + data[i].dc_rate + "%</span>"
							+"<h5 class='itemPrice'>" + data[i].sale_price.toLocaleString('en') + "원</h5>"	
						)
					}
					
					if(data[i].delivery_price == true){
						$('#productInfo'+i).append(
							"<div class='free'><p>무료배송</p></div>"
						)
					}
					
					if(data[i].bargain_price == true){
						$('#productInfo'+i).append(
							"<div class='specialPrice'><p>특가</p></div>"
						)
					}
					
					if(data[i].is_buyinhotel == true){
						$('#productInfo'+i).append(
							"<div class='buyIn'><p>바이인</p></div>"
						)
					}
				}
			}
	</script>
	
	<script>
	//////////로그인 전, 후 헤더 탑 변화//////////////////
	$(function() {
		/* $.ajax({
			url: "WebLoginStateCheckCon.do", // 컨트롤러 위치
			type: "post",
			dataType: 'text',
			success: function(result) {
				console.log(result)

				if (result == "") {
					$('#userName').text("");
					$('#loginBtn').text("로그인");
					$('#loginBtn').attr('onClick', "location.href='login/login'");
					
					return false;
				} else {
					$('#userName').text(result + "님 | ");
					$('#loginBtn').text("로그아웃");
					$('#loginBtn').attr('onClick', "logout()");
					
					return false;
				}
				
				return false;
			},
			error: function() {
				alert("서버 요청 실패", "연결을 다시 확인 해주세요.");
				return false;
			}
		}); */
		
		if(user_id == "null") {
			$('#userName').text("회원가입 | ");
			$('#userName').css('cursor','pointer');
			
			$('#loginBtn').text("로그인");
			$('#loginBtn').attr('onClick', "location.href='login/login'");
		} else {
			$.ajax({
				url : "https://www.buyinhotel.co.kr:5000/basic-myinfo?user=" + user_id, // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				success : function(result){
					
					if(result.message == 'Success'){
						
						user_info = result.data;
						console.log(user_info);	
						
						$('#userName').text(user_info.user_name + "님 | ");
						$('#loginBtn').text("로그아웃");
						$('#loginBtn').attr('onClick', "logout()");
						
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
	
	$(document).on('click','#userName',function(){
		if($(this).text() == "회원가입 | "){
			JoinType(null,'app');
		}
	})
	
	
	function JoinType(token, join_type) {
		$.ajax({
			url: "JoinTypeCon.do", // 컨트롤러 위치
			type: "post",
			dataType: 'text',
			data: {
	
				token: token,
				join_type: join_type,
				origin_page : document.referrer
	
			},
			success: function(result) {
				console.log(result)
				if (result == "joinToken") {
					alert("아이디 오류");
	
					return false;
				} else if (result == "joinType") {
					alert("타입 오류");
	
					return false;
				} else if (result == "join") {
					location.href = 'login/join';
					
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
	
	function logout() {
		$.ajax({
			url: "WebLogoutCon.do", // 컨트롤러 위치
			type: "post",
			dataType: 'text',
			success: function(result) {
				console.log(result)

				location.reload();
				
				return false;
			},
			error: function() {
				alert("서버 요청 실패", "연결을 다시 확인 해주세요.");
				return false;
			}
		});
	}
	
	$(document).on('click','.myMenu',function(){
		if($('.subMy').css('display') == 'none'){	
			$('.subMy').css('display','block');
			$('.subSee').css('display','none');
		} else{
			$('.subMy').css('display','none');
		} 
	})
	
	$(document).on('click','.seeMenu',function(){
		if($('.subSee').css('display') == 'none'){
			$('.subSee').css('display','block');
			$('.subMy').css('display','none');
		} else{
			$('.subSee').css('display','none');
		}
	})
	
	</script>
	<script>
		$(document).on('click','.hotelImg',function(){
			var hotel_id;
			hotel_id = $(this).attr('id');
			location.href='menu/hotelDetail?lodgement_id=' + hotel_id;
		})
	</script>
	</body>
</html>