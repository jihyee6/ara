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
		.cancelTable{
			width: 100%;
			border-top: 1px solid #707070;
			border-bottom: 1px solid #707070;
		}
		.cancelTable tr:first-child{
			background-color: #F3F3F3;
		}
		.cancelTable td{
			border-bottom: 1px solid rgb(209,209,209,0.5);
			height: 48px;
			font-size: 16px;
			text-align: center;
		}
		.cancelTable tr:last-child td{
			border-bottom: none;
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
						<li><a href="teenager" class='policyTxt'>청소년보호정책</a></li>
						<li><a href="location" class='policyTxt'>위치정보이용약관</a></li>
						<li style="border-right: none;"><a href="cancelTerms" class='policyTxt termTabCss'>취소규정</a></li>
					</ul>
				</div>
				
				<div class='termsText'>
					<h3>취소규정</h3>																						
						<table class="cancelTable">
							<tr>
								<td>유형</td>
								<td>환불기준</td>
							</tr>
							<tr>
								<td>체크인 10일전</td>
								<td>총 결제금액 중 100% 환불</td>
							</tr>
							<tr>
								<td>체크인 7일전</td>
								<td>총 결제금액 중 70% 환불</td>
							</tr>
							<tr>
								<td>체크인 5일전</td>
								<td>총 결제금액 중 50% 환불</td>
							</tr>
							<tr>
								<td>체크인 3일전</td>
								<td>총 결제금액 중 30% 환불</td>
							</tr>
							<tr>
								<td>당일취소 및 노쇼</td>
								<td>환불불가</td>
							</tr>
						</table>
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