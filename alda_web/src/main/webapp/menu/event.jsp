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
	.eventList{
		margin: 20px auto;
	}
	.eventList img{
		margin: 10px auto;
		width: 100%;
		cursor: pointer;
	}
</style>

</head>
<body>
<%@include file="../header_noTop.jsp"%>
 <!--   <div class='topSubs'>
	   		<div class='topMenus'>
	   			<div class=topSubMenu>
			   		<h4 class='basketMenu'>더보기</h4>
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
			<li><a href='../seemore/notice'>공지사항</a></li>
			<li><a href='../seemore/giftcard'>선물하기</a></li>
			<li style='background-color: #8996A0;'><a href='event' style='color: white; text-decoration: underline'>이벤트</a></li>
			<li><a href='../seemore/benefits'>회원등급혜택</a></li>
			<li><a href='../seemore/faq'>FAQ</a></li>
			<li><a href='../seemore/terms'>이용약관</a></li>
		</ul>
		</div>
		<div class='seemoreContent'>
			<h4>이벤트</h4>
			<div class='eventList'>
			<!-- 이벤트 사진들 -->
				<!-- <img src='../image/items/event1.png'>
				<img src='../image/items/event2.png'> -->
			</div>
		</div>
	</main>
 	<%@include file="../footer.jsp"%>
 	<script>
 	var user_id = '<%=id%>';
 	
	$(function(){
		
    	$('.topSubMenu').append(
    		"<h4 class='basketMenu'>더보기</h4>"		
    	);
		
		$.ajax({
			url : "../events", // 컨트롤러 위치
			type : "GET",
			dataType : 'JSON',
			beforeSend: function (xhr) {
	            xhr.setRequestHeader("user", user_id);
	        },
			success : function(result){
				data = result.data;
				console.log(data);

				eventData = data;
				console.log(eventData);
				
				event();
				
				return false;
			},
			error : function(){
				alert("검색실패");
				return false;
			}
		})
	})
	
	function event(){
		for(var i = 0; i < eventData.length; i++){
			$('.eventList').append(
				"<img id='" + eventData[i].event_id + "' src='" + eventData[i].event_img_url + "' onclick= 'newEventScreen(\"" + eventData[i].event_contents_url + "\")'>"		
			)
		}
	}
	function newEventScreen(src) {
		window.open(src, "event", 'width=800px');
	}
 	</script>
</body>
</html>