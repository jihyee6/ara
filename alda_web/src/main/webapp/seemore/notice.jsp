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
			<li style='background-color: #8996A0;'><a href='notice' style='color: white; text-decoration: underline'>공지사항</a></li>
			<li><a href='giftcard'>선물하기</a></li>
			<li><a href='../menu/event'>이벤트</a></li>
			<li><a href='benefits'>회원등급혜택</a></li>
			<li><a href='faq'>FAQ</a></li>
			<li><a href='terms'>이용약관</a></li>
		</ul>
		</div>
		<div class='seemoreContent'>
			<h4>공지사항</h4>
			<div class='noticeList'>
				<div class='noticeContent' onclick='location.href="noticeContent"'>
					<div class='noticeText'>
						<p>[공지] 고객센터 이용 지연안내</p>
						<p>2022.01.01</p>
					</div>
					<div class='noticeArr'>
						<img style='margin-right: 18px;' src='../image/icon/noticeArr.png'>
					</div>
				</div>
				<div class='noticeContent'>
					<div class='noticeText'>
						<p>[공지] 개인정보처리방침 개정안내</p>
						<p>2022.01.01</p>
					</div>
					<div class='noticeArr'>
						<img style='margin-right: 18px;' src='../image/icon/noticeArr.png'>
					</div>
				</div>
				<div class='noticeContent'>
					<div class='noticeText'>
						<p>[공지] 알다 서비스 이용약관 변경 안내</p>
						<p>2022.01.01</p>
					</div>
					<div class='noticeArr'>
						<img style='margin-right: 18px;' src='../image/icon/noticeArr.png'>
					</div>
				</div>
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