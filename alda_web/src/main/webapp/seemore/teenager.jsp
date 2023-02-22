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
			margin: 20px auto;
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
						<li><a href="marketing" class='policyTxt'>마케팅활용동의</a></li>
						<li><a href="teenager" class='policyTxt termTabCss'>청소년보호정책</a></li>
						<li><a href="location" class='policyTxt'>위치정보이용약관</a></li>
						<li style="border-right: none;"><a href="cancelTerms" class='policyTxt'>취소규정</a></li>
					</ul>
				</div>
				
				<div class='termsText'>
						<p>
							주식회사 잘래는 유해한 환경으로부터 청소년들의 정신적, 신체적 건강을 보호하기 위하여, ‘청소년 보호법' 및
							'정보통신망 이용촉진 및 정보보호 등에 관한 법률' 등 관계 법령에 따른 청소년 보호정책을 마련하여 시행하고 있으며
							청소년들이 안전하게 인터넷 서비스를 이용할 수 있도록 다음과 같은 활동을 하고 있습니다.<br> <br>
							-청소년 유해정보로부터의 청소년 보호계획의 수립<br> -청소년 유해정보에 대한 청소년 접근제한 및
							관리조치<br> -정보통신업무 종사자에 대한 청소년 유해정보로부터의 청소년보호를 위한 교육<br>
							-청소년 유해정보로 인한 피해상담 및 고충처리<br> -그 밖에 청소년 유해정보로부터 청소년을 보호하기
							위하여 필요한 사항<br>
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