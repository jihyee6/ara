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
		.no{
			text-align: center;
			margin-top: 66px;
		}
		.noMesseage{
			font-size: 32px;
			margin: 20px auto;
			font-family: NotoSansR;
			color: #707070;
		}
	</style>
</head>
<body>
<%@include file="../header_noTop.jsp"%>
   <!-- <div class='topSubs'>
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
			<li><a href='notice'>공지사항</a></li>
			<li><a href='giftcard'>선물하기</a></li>
			<li><a href='../menu/event'>이벤트</a></li>
			<li style='background-color: #8996A0;'><a href='benefits' style='color: white; text-decoration: underline'>회원등급혜택</a></li>
			<li><a href='faq'>FAQ</a></li>
			<li><a href='terms'>이용약관</a></li>
		</ul>
		</div>
		<div class='seemoreContent'>
			<h4>회원등급혜택</h4>
			<div class='no'>
				<img src='../image/icon/benefiticon.png'>
				<p class='noMesseage'>준비중입니다.</p>
			</div>
		</div>
		
	</main>
 	<%@include file="../footer.jsp"%>
	<script>
		 $(function() {
	    	$('.topSubMenu').append(
	    		"<h4 class='basketMenu'>더보기</h4>"		
	    	);
	    })
	</script>
</body>
</html>