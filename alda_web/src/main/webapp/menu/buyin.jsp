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
	/* .regionList li{
		display: inline-block;
		margin: 0px 64px;
	}
	.regionList{
		width: 100%;
		height: 68px;
		border-top: 1px solid #DFDFDF;
		border-bottom: 1px solid #DFDFDF;
		line-height: 68px;
	} */
	.regionA{
		color: #AAAAAA;
		font-size: 15px;
		cursor: pointer;
	}
	.regionCss{
		font-weight: bold;
		color: #242424;
	
	}
	.hotelLinks{
		width: 476px;
		height: 264px;
	}
	#regionTab{
		margin-left: 0px;
	}
	.pageNum.active{
		color: #070707;
		font-weight: 600;
		font-size: 18px;
	}
	
	.pageNum {
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
	.hotelImages{
		min-height: 696px;
	}
</style>
</head>
<body>
<%@include file="../header.jsp"%>
<main class='content'>
	<p class="menuTitle">바<span class='titleLine'>이</span>인</p>
	<!-- <div class='regionList tab'>
		<div class='tabnav'>
			<ul id='regionTab'>
	   			<li><a class='regionA allRegion'>전체</a></li>
	   			
	   		</ul>
		</div>
	</div> -->
	
	<!-- 전체 탭 콘텐츠 -->
	<div class='hotelImages'>
		<!-- <div class='hotelItems'>
			<img class='hotelLinks' src="../image/items/hotel4.png">
			<p>평택 이끌림 클래식 호텔</p>
		</div> -->
	</div>
	<div class="paging">
		 <div class="pagination inner" id='pagination' style='text-align: center;'>
		 </div>
	 </div>
	
</main>
<%@include file="../footer.jsp"%>
<script>
 	var user_id = '<%=id%>';
 	
/* 	document.getElementById('defaultOpen').click(); */
	
	$(document).on('click','.hotelLinks',function(){
		var hotel_id;
		hotel_id = $(this).attr('id');
		location.href='hotelDetail?lodgement_id=' + hotel_id;
	})
	
</script>
<script>
 	/* function openMenu(evt, tabMenu) {
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
   	 document.getElementById("defaultOpen").click(); */
 	</script>
 	<script>
		$(function() {
			/* 숙소 카테고리 */
			$.ajax({
				url : "../buyins", // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        },
				success : function(result){
					data = result.data;
					console.log(data);
					
					//regionTabs();
					regionHotel();
					page();
					
					if(data.length == 0){
						$('.hotelImages').append(
							"<div style='text-align: center; font-size: 24px; margin-top: 104px; font-family: NotoSans; color: #707070;'>"
								+"<p>해당 지역에 호텔이 존재하지 않습니다.</p>"
							+"</div>"
						)
						$('.paging').css('display','none');
					}else{
						$('.paging').css('display','grid');
					}
					
					return false;
				},
				error : function(){
					alert("검색실패");
					return false;
				}
			})
			
			/* 전체 숙소 */
			/* $.ajax({
				url : "../region-buyins?region=", // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				success : function(result){
					data = result.data;
					console.log(data);
					
					regionHotel();
					
					return false;
				},
				error : function(){
					alert("검색실패");
					return false;
				}
			}) */
		})
		
		/* $(document).on('click', '.regionA', function(){
			$('.regionA').removeClass('regionCss');
			$(this).addClass('regionCss');
			regionId = $(this).attr('id');
			
			/* 숙소목록 
			$.ajax({
				url : "../region-buyins?region=" + regionId, // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				success : function(result){
					data = result.data;
					console.log(data);
					
					regionHotel();
					
					
					return false;
				},
				error : function(){
					alert("검색실패");
					return false;
				}
			})
		}) */
 	</script>
 	
 	<script> 
 		function regionTabs(){
 			for(var i = 0; i < data.length; i++){
 				if(i == 0) {
 					$('.hotelImages').append(
	 					"<li><a class='regionA regionCss' id='" + data[i].region_id + "'>" + data[i].region_name + "</a></li>"		
	 				)
 				} else {
	 				$('.hotelImages').append(
	 					"<li><a class='regionA' id='" + data[i].region_id + "'>" + data[i].region_name + "</a></li>"		
	 				)
 				}
 			}
 		}
 		
 		function regionHotel(){
 			$('.hotelImages *').remove();
 			for(var i = 0; i < data.length; i++){
 				$('.hotelImages').append(
					"<div class='hotelItems'>"
 						+"<img class='hotelLinks' id='" + data[i].lodgement_id + "' src='" + data[i].lodgement_img_url + "'>"
 						+"<p>" + data[i].lodgement_name + "</p>"
 					+"</div>"		
 				)
 			}
 		}
 	</script>
 	<script>
 	function page() {	
 		// ****더 중요한점 테이블 이름 적어줘야함!!
 	    $('.hotelImages').each(function () {
 	        var pagesu = 10;  //페이지 번호 갯수
 	        var currentPage = 0;
 	        var numPerPage = 4;  //목록의 수
 	        var $table = $(this);
 	        var pagination = $("#pagination");

 	        //length로 원래 리스트의 전체길이구함
 	        var numRows = $table.find('.hotelItems').length;

 	        //Math.ceil를 이용하여 반올림
 	        var numPages = Math.ceil(numRows / numPerPage);

 	        //리스트가 없으면 종료
 	        if (numPages == 0) return;

 	        //pager라는 클래스의 div엘리먼트 작성
 	        var $pager = $('<div class="pager"></div>');
 	        var nowp = currentPage;
 	        var endp = nowp + 10;

 	        //페이지를 클릭하면 다시 셋팅
 	        $table.bind('repaginate', function () {

 	        //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
 	            $table.find('.hotelItems').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
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
 	                $table.trigger('repaginate');
 	                $($(".pageNum")[2]).addClass('active').siblings().removeClass('active');
 	            }).appendTo(pagination).addClass('clickable');
 	            // [이전]
 	            $('<span class="pageNum back"><img src="../image/icon/blackleft.png"></span>').bind('click', { newPage: page }, function (event) {
 	                if (currentPage == 0) return;
 	                currentPage = currentPage - 1;
 	                $table.trigger('repaginate');
 	                $($(".pageNum")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
 	            }).appendTo(pagination).addClass('clickable');
 	            // [1,2,3,4,5,6,7,8]
 	            for (var page = nowp; page < endp; page++) {
 	                $('<span class="pageNum"></span>').text((page + 1)).bind('click', { newPage: page }, function (event) {
 	                	// 여기가 data인데 우리는 항상 data로 data를 정의하기에 그냥 갖다 쓰면 됨!
 	                    currentPage = event.data['newPage'];
 	                    $table.trigger('repaginate');
 	                    $($(".pageNum")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
 	                }).appendTo(pagination).addClass('clickable');
 	            }

 	            // [다음]
 	            $('<span class="pageNum next"><img src="../image/icon/blackRight.png"></span>').bind('click', { newPage: page }, function (event) {
 	                if (currentPage == numPages - 1) return;
 	                currentPage = currentPage + 1;
 	                $table.trigger('repaginate');
 	                $($(".pageNum")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
 	            }).appendTo(pagination).addClass('clickable');

 	            // [끝]
 	            $('<span class="pageNum last">》</span>').bind('click', { newPage: page }, function (event) {
 	                currentPage = numPages - 1;
 	                $table.trigger('repaginate');
 	                $($(".pageNum")[endp - nowp + 1]).addClass('active').siblings().removeClass('active');
 	            }).appendTo(pagination).addClass('clickable');

 	            $($(".pageNum")[2]).addClass('active');
 	            
 	        });

 	        $pager.insertAfter($table).find('span.pageNum:first').next().next().addClass('active');
 	        $pager.appendTo(pagination);
 	        $table.trigger('repaginate');
 	    });
 	}
 	</script>
</body>
</html>