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
		.termsMenu{
			margin: 20px auto;
		}
		.language{
			margin: 24px auto;
		}
		.languageCss{
			outline: 2px solid #8996A0;
			color: #8996A0;
			font-weight: bold;
		}
		.termsText{
			font-famliy: NotoSansR;
			color: #242424;
			font-size: 16px;
			margin-top: 30px;
		}
		.termsText h3{
			font-size: 32px;
			font-weight: bold;
		}
		.termsText p{
			line-height: 24px;
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
			<li><a href='benefits'>회원등급혜택</a></li>
			<li><a href='faq'>FAQ</a></li>
			<li style='background-color: #8996A0;'><a href='terms' style='color: white; text-decoration: underline'>이용약관</a></li>
		</ul>
		</div>
		<div class='seemoreContent'>
			<h4>이용약관</h4>
				<div class='termsMenu'>
					<ul>
						<li><a href="terms" class='policyTxt'>이용약관</a></li>
						<li><a href="personal" class='policyTxt'>개인정보처리방침</a></li>
						<li><a href="email" class='policyTxt termTabCss'>이메일무단수집거부</a></li>
						<li><a href="marketing" class='policyTxt'>마케팅활용동의</a></li>
						<li><a href="teenager" class='policyTxt'>청소년보호정책</a></li>
						<li><a href="location" class='policyTxt'>위치정보이용약관</a></li>
						<li style="border-right: none;"><a href="cancelTerms" class='policyTxt'>취소규정</a></li>
					</ul>
				</div>
				<div class='termsText tabcontent' id='korean'>
					<p>
						<br>
							본 사이트에 게시된 이메일 주소가 전자우편 수집프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며,<br>
							이를 위반할 경우 정보통신망 법에 의해 형사 처벌됨을 유념하시기 바랍니다.<br>
							<br>
							<br>
							관련법규 - 정보통신망 이용촉진 및 정보보호 등에 관한 법률<br>
							<br>
							제50조의2 (전자우편주소의 무단 수집행위 등 금지)<br>
							① 누구든지 인터넷 홈페이지 운영자 또는 관리자의 사전 동의 없이 인터넷 홈페이지에서 자동으로 전자우편주소를 수집하는 프로그램이나 그 밖의 기술적 장치를 이용하여 전자우편주소를 수집하여서는 아니 된다.<br>
							② 누구든지 제1항을 위반하여 수집된 전자우편주소를 판매·유통하여서는 아니 된다.<br>
							③ 누구든지 제1항과 제2항에 따라 수집·판매 및 유통이 금지된 전자우편주소임을 알면서 이를 정보 전송에 이용하여서는 아니 된다.<br>
						<br>
					</p>
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