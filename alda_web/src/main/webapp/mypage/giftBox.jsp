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
	.pageNum.active , .pageNum2.active{
		color: #070707;
		font-weight: 600;
		font-size: 18px;
	}
	
	.pageNum, .pageNum2{
		margin: 4px;
		padding: 0px 6px 2px 6px;
		cursor: pointer;
		background: white;
		color: #A2A2A2;
		font-size: 18px;
	}

	.inner img{
		height: 16px;
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
			<div class="tab">
				<div class="selectmenu tabnav">
					<div class="tablinks" onclick="openMenu(event,'send')" id="defaultOpen">보낸선물</div>
					<div class="tablinks" onclick="openMenu(event,'receive')">받은선물</div>  
			    </div>		
			</div>
			
			<div id='send' class='tabcontent'>
				<p class='sendGift'>보낸 선물: <span id='sendCount'>0</span>개</p>
				<div class='giftList'>
					<!-- 보낸선물 목록 시작 -->
					<div class='purchaseItem'>
						<div class='purchaseImg'>
							<img src='../image/items/product1.png'>
						</div>
						<div class='purchaseInfo'>
							<p class='sender'>To.000님</p>
							<p class='purchaseName'>프라제르 아쿠아텍스 4인용 소파</p>
							<p class='giftPeriod'>유효기간: 2022.01.31</p>
						</div>
						<div class='purchaseBtn'>
							<button type='button' class='viewSendGift'>상세보기</button>
						</div>
					</div>
					<!-- 보낸선물 목록 끝 -->
				</div>
				<div class="paging">
					<div class="pagination inner" id='pagination' style='text-align: center;'>
					</div>
				</div>
			</div>
			
			<div id='receive' class='tabcontent'>
				<p class='sendGift'>받은 선물: <span id='receiveCount'>0</span>개</p>
					<div class='giftList receiveList'>
						<!-- 받은 선물 목록 시작 -->
						<div class='purchaseItem receiveItem'>
							<div class='purchaseImg'>
								<img src='../image/items/product1.png'>
							</div>
							<div class='purchaseInfo'>
								<p class='sender'>To. 000님</p>
								<p class='purchaseName'>프라제르 아쿠아텍스 4인용 소파</p>
								<p class='giftState'>사용전</p>
								<p class='giftPeriod'>유효기간: 2022.01.31</p>
							</div>
							<div class='purchaseBtn'>
								<button class='purchasebutton' type='button' use = '1'>상세보기</button>
							</div>
						</div>
						<!-- 받은 선물 목록 끝 -->
					</div>
					<div class="paging">
						<div class="pagination inner" id='pagination2' style='text-align: center;'>
						</div>
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
 	    	
 	    	page();
 	    	page2();
 	    })
 	</script>
 	<script>
	 	function openMenu(evt, tabMenu) {
			var i, tabcontent, tablinks;
			  tabcontent = document.getElementsByClassName("tabcontent");
			  for (i = 0; i < tabcontent.length; i++) {
		   		 tabcontent[i].style.display = "none";
				}			
			  tablinks = document.getElementsByClassName("tablinks");
			  for (i = 0; i < tablinks.length; i++) {
			    tablinks[i].className = tablinks[i].className.replace(" active", "");
			  }
			  document.getElementById(tabMenu).style.display = "block";
			  evt.currentTarget.className += " active";
			}
	  	  document.getElementById("defaultOpen").click();
	  	  
	  	  
	  	function page() {	
	 		// ****더 중요한점 테이블 이름 적어줘야함!!
	 	    $('.giftList').each(function () {
	 	        var pagesu = 10;  //페이지 번호 갯수
	 	        var currentPage = 0;
	 	        var numPerPage = 5;  //목록의 수
	 	        var $div = $(this);
	 	        var pagination = $("#pagination");

	 	        //length로 원래 리스트의 전체길이구함
	 	        var numRows = $div.find('.purchaseItem').length;

	 	        //Math.ceil를 이용하여 반올림
	 	        var numPages = Math.ceil(numRows / numPerPage);

	 	        //리스트가 없으면 종료
	 	        if (numPages == 0) return;

	 	        //pager라는 클래스의 div엘리먼트 작성
	 	        var $pager = $('<div class="pager"></div>');
	 	        var nowp = currentPage;
	 	        var endp = nowp + 10;

	 	        //페이지를 클릭하면 다시 셋팅
	 	        $div.bind('repaginate', function () {

	 	        //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
	 	            $div.find('.purchaseItem').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	 	            $("#pagination").html("");
	 	            if (numPages > 1) {     // 한페이지 이상이면
	 	                if (currentPage < 5 && numPages - currentPage >= 5) {   // 현재 5p 이하이면
	 	                    nowp = 0;     // 1부터 
	 	                    endp = pagesu;    // 10까지
	 	                } else {
	 	                    nowp = currentPage - 5;  // 6넘어가면 2부터 찍고
	 	                    endp = nowp + pagesu;   // 10까지
	 	                    pi = 1;
	 	                }
	 	                if (numPages < endp) {   // 10페이지가 안되면
	 	                    endp = numPages;   // 마지막페이지를 갯수 만큼
	 	                    nowp = numPages - pagesu;  // 시작페이지를   갯수 -10
	 	                }
	 	                if (nowp < 1) {     // 시작이 음수 or 0 이면
	 	                    nowp = 0;     // 1페이지부터 시작
	 	                }
	 	            } else {       // 한페이지 이하이면
	 	                nowp = 0;      // 한번만 페이징 생성
	 	                endp = numPages;
	 	            }
	 	            // [처음]
	 	            $('<span class="pageNum first">《</span>').bind('click', { newPage: page }, function (event) {
	 	                currentPage = 0;
	 	                $div.trigger('repaginate');
	 	                $($(".pageNum")[2]).addClass('active').siblings().removeClass('active');
	 	            }).appendTo(pagination).addClass('clickable');
	 	            // [이전]
	 	            $('<span class="pageNum back"><img src="../image/icon/blackleft.png"></span>').bind('click', { newPage: page }, function (event) {
	 	                if (currentPage == 0) return;
	 	                currentPage = currentPage - 1;
	 	                $div.trigger('repaginate');
	 	                $($(".pageNum")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
	 	            }).appendTo(pagination).addClass('clickable');
	 	            // [1,2,3,4,5,6,7,8]
	 	            for (var page = nowp; page < endp; page++) {
	 	                $('<span class="pageNum"></span>').text((page + 1)).bind('click', { newPage: page }, function (event) {
	 	                	// 여기가 data인데 우리는 항상 data로 data를 정의하기에 그냥 갖다 쓰면 됨!
	 	                    currentPage = event.data['newPage'];
	 	                    $div.trigger('repaginate');
	 	                    $($(".pageNum")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
	 	                }).appendTo(pagination).addClass('clickable');
	 	            }

	 	            // [다음]
	 	            $('<span class="pageNum next"><img src="../image/icon/blackRight.png"></span>').bind('click', { newPage: page }, function (event) {
	 	                if (currentPage == numPages - 1) return;
	 	                currentPage = currentPage + 1;
	 	                $div.trigger('repaginate');
	 	                $($(".pageNum")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
	 	            }).appendTo(pagination).addClass('clickable');

	 	            // [끝]
	 	            $('<span class="pageNum last">》</span>').bind('click', { newPage: page }, function (event) {
	 	                currentPage = numPages - 1;
	 	                $div.trigger('repaginate');
	 	                $($(".pageNum")[endp - nowp + 1]).addClass('active').siblings().removeClass('active');
	 	            }).appendTo(pagination).addClass('clickable');

	 	            $($(".pageNum")[2]).addClass('active');
	 	            
	 	        });

	 	        $pager.insertAfter($div).find('span.pageNum:first').next().next().addClass('active');
	 	        $pager.appendTo(pagination);
	 	        $div.trigger('repaginate');
	 	    });
	 	}
	  	
	  	
	  	
	  	function page2() {	
	 		// ****더 중요한점 테이블 이름 적어줘야함!!
	 	    $('.receiveList').each(function () {
	 	        var pagesu = 10;  //페이지 번호 갯수
	 	        var currentPage = 0;
	 	        var numPerPage = 5;  //목록의 수
	 	        var $div = $(this);
	 	        var pagination = $("#pagination2");

	 	        //length로 원래 리스트의 전체길이구함
	 	        var numRows = $div.find('.receiveItem').length;

	 	        //Math.ceil를 이용하여 반올림
	 	        var numPages = Math.ceil(numRows / numPerPage);

	 	        //리스트가 없으면 종료
	 	        if (numPages == 0) return;

	 	        //pager라는 클래스의 div엘리먼트 작성
	 	        var $pager = $('<div class="pager"></div>');
	 	        var nowp = currentPage;
	 	        var endp = nowp + 10;

	 	        //페이지를 클릭하면 다시 셋팅
	 	        $div.bind('repaginate', function () {

	 	        //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
	 	            $div.find('.receiveItem').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	 	            $("#pagination2").html("");
	 	            if (numPages > 1) {     // 한페이지 이상이면
	 	                if (currentPage < 5 && numPages - currentPage >= 5) {   // 현재 5p 이하이면
	 	                    nowp = 0;     // 1부터 
	 	                    endp = pagesu;    // 10까지
	 	                } else {
	 	                    nowp = currentPage - 5;  // 6넘어가면 2부터 찍고
	 	                    endp = nowp + pagesu;   // 10까지
	 	                    pi = 1;
	 	                }
	 	                if (numPages < endp) {   // 10페이지가 안되면
	 	                    endp = numPages;   // 마지막페이지를 갯수 만큼
	 	                    nowp = numPages - pagesu;  // 시작페이지를   갯수 -10
	 	                }
	 	                if (nowp < 1) {     // 시작이 음수 or 0 이면
	 	                    nowp = 0;     // 1페이지부터 시작
	 	                }
	 	            } else {       // 한페이지 이하이면
	 	                nowp = 0;      // 한번만 페이징 생성
	 	                endp = numPages;
	 	            }
	 	            // [처음]
	 	            $('<span class="pageNum2 first">《</span>').bind('click', { newPage: page }, function (event) {
	 	                currentPage = 0;
	 	                $div.trigger('repaginate');
	 	                $($(".pageNum2")[2]).addClass('active').siblings().removeClass('active');
	 	            }).appendTo(pagination).addClass('clickable');
	 	            // [이전]
	 	            $('<span class="pageNum2 back"><img src="../image/icon/blackleft.png"></span>').bind('click', { newPage: page }, function (event) {
	 	                if (currentPage == 0) return;
	 	                currentPage = currentPage - 1;
	 	                $div.trigger('repaginate');
	 	                $($(".pageNum2")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
	 	            }).appendTo(pagination).addClass('clickable');
	 	            // [1,2,3,4,5,6,7,8]
	 	            for (var page = nowp; page < endp; page++) {
	 	                $('<span class="pageNum2"></span>').text((page + 1)).bind('click', { newPage: page }, function (event) {
	 	                	// 여기가 data인데 우리는 항상 data로 data를 정의하기에 그냥 갖다 쓰면 됨!
	 	                    currentPage = event.data['newPage'];
	 	                    $div.trigger('repaginate');
	 	                    $($(".pageNum2")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
	 	                }).appendTo(pagination).addClass('clickable');
	 	            }

	 	            // [다음]
	 	            $('<span class="pageNum2 next"><img src="../image/icon/blackRight.png"></span>').bind('click', { newPage: page }, function (event) {
	 	                if (currentPage == numPages - 1) return;
	 	                currentPage = currentPage + 1;
	 	                $div.trigger('repaginate');
	 	                $($(".pageNum2")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
	 	            }).appendTo(pagination).addClass('clickable');

	 	            // [끝]
	 	            $('<span class="pageNum2 last">》</span>').bind('click', { newPage: page }, function (event) {
	 	                currentPage = numPages - 1;
	 	                $div.trigger('repaginate');
	 	                $($(".pageNum2")[endp - nowp + 1]).addClass('active').siblings().removeClass('active');
	 	            }).appendTo(pagination).addClass('clickable');

	 	            $($(".pageNum2")[2]).addClass('active');
	 	            
	 	        });

	 	        $pager.insertAfter($div).find('span.pageNum2:first').next().next().addClass('active');
	 	        $pager.appendTo(pagination);
	 	        $div.trigger('repaginate');
	 	    });
	 	}
	  	  
 	</script>
 	<script>
 		/* 보낸선물 상세보기 */
 		$(document).on('click','.viewSendGift',function(){
 			location.href='giftboxDetailSend'
 		})
 		
 		/* 받은선물 상세보기 */
 		$(document).on('click','.purchasebutton',function(){
	 		if($(this).attr('use') == 1){
	 			location.href = 'giftboxReceiveBefore';
	 		} else if($(this).attr('use') == 0){
	 			location.href = 'giftboxDetailReceive';
	 		}
 		})
 	</script>
</body>
</html>