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
						<li><a href="email" class='policyTxt'>이메일무단수집거부</a></li>
						<li><a href="marketing" class='policyTxt termTabCss'>마케팅활용동의</a></li>
						<li><a href="teenager" class='policyTxt'>청소년보호정책</a></li>
						<li><a href="location" class='policyTxt'>위치정보이용약관</a></li>
						<li style="border-right: none;"><a href="cancelTerms" class='policyTxt'>취소규정</a></li>
					</ul>
				</div>
				<div class='termsText tabcontent' id='korean'>
						<p>
							<br>
							① 수집 항목<br>
							- 연락처 정보 : 휴대전화, 이메일, 주소<br>
							 <br>
							② 이용 목적<br>
							- 서비스 및 프로모션 이벤트 정보 안내 등 마케팅 활동 자료로 활용<br>
							 <br>
							③ 보유 기간<br>
							- 회원탈퇴 시 또는 별도 거부의 요청시까지<br>
							 <br>
							④ 수집 방법<br>
							- 홈페이지<br>
							 <br>
							BUY IN HOTEL 마케팅 활동에 대한 활용을 목적으로 하는 동의서입니다.<br>
							본 내용에 대해 동의 하지 않으시면 회원가입 및 서비스 이용이 불가능 합니다.<br>
							비동의 시 BUY IN HOTEL의 상품과 혜택에 대한 다양한 정보를 받아보실 수 없습니다.​ <br>
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