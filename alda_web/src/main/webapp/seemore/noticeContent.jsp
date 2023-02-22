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
			<div class='noticeInformation'>
				<div class='noticeContent'>
					<div class='noticeText'>
						<p id='noticeTitle'>[공지] 고객센터 이용 지연안내</p>
						<p id='noticeDate'>2022.01.01</p>
					</div>
				
				</div>
				<div class='notices'>
					<p id='noticeInfo'>
						안녕하세요.<br>
						(주)알아는 회원 여러분들의 개인정보를 소중하게 생각하고, 개인정보를 보호하기 위하여 항상 최선을 다해 노력하고 있습니다.<br>
						새롭게 변경될 개인정보처리방침 내용을 확인하시기를 바랍니다.<br>
						1. 주요 개정사항<br>
						새로운 크리에이터 개인정보 수집 및 이용에 관한 사항 추가<br>
						2. 변경시기<br>
						2022년 2월 01일(금)<br>
						3. 문의 및 동의철회<br>
						개정된 개인정보 처리방침 내용에 대한 문의와 이의제기는 고객센터(0000-0000)로 접수해 주시면 친절하게 안내해 드리겠습니다.<br>
						회사는 앞으로도 이용자의 개인정보를 보다 안전하게 보호할 것을 약속드리며, 신뢰받는 서비스로 보답하겠습니다.<br>
						감사합니다.
					</p>
				</div>
				
				<div class='articleList'>
					<div class='NoticeArticle' style='border-bottom: 1px solid #C2C2C2;'>
						<p>[공지] 고객센터 이용 지연 안내 <span id='nextContent'>다음글 <img src="../image/icon/articleUp.png"></span></p>
					</div>
					<div class='NoticeArticle'>
						<p>[공지] 알다 서비스 이용약관 변경 안내 <span id='prevContent'>이전글 <img src="../image/icon/articleDown.png"></span></p>
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