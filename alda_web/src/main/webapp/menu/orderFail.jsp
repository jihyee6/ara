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
	.infoTxt{
		font-size: 16px;
		font-family: NotoSans;
		color: #242424;
		text-align: center;
		margin: 20px auto;
		line-height: 30px;
	}
</style>
</head>
<body>
<%@include file="../header_noTop.jsp"%>
   <!-- <div class='topSubs'>
	   		<div class='topMenus'>
	   			<div class=topSubMenu>
			   		<h4 class='basketMenu'>결제실패</h4>
	   			</div>
		   		<div class='memberInfo2'>
	   			<p style='float: left; height: 30px;'>000님 | </p>
	   			<p>로그아웃</p>
	   		</div>
	   </div>
   </div> -->
	
	
	<main class='content'>
		<div class='CompleteMessage'>
			<img src="../image/icon/failIcon.png">
			<p class='messageInfo'>결제를 실패했습니다.</p>
			<p class='messageDetail'>다시 시도해주시기 바랍니다.</p>
		</div>
		<div class='deliveryInfo'>
			<div class='okInfoTable'>
				<h4>안내정보</h4>
				<table>
					<tr>
						<td>상품정보</td>
						<td>프라제르 아쿠아텍스 4인용 소파(스툴증정) 외 1건</td>
					</tr>
					<tr>
						<td>실패사유</td>
						<td>한도초과</td>
					</tr>
				</table>
			</div>
			<div class='infoTxt'>
				<p>이외 문의사항은 고개센터로 문의해주시기 바랍니다.</p>
				<p style='font-weight: bold;'>0000-0000</p>
				<p>문의 가능 시간 : 09:00 - 18:00</p>
			</div>
			<div class='completeBtn'>
				<button type='button'>다시시도</button>
				<button type='button' style='border: 1.5px solid #727F8A; color: #727F8A;' onclick='location.href="../index.jsp"'>메인으로</button>
			</div>
		</div>
	</main>
 	<%@include file="../footer.jsp"%>
 	<script>
 	  $(function() {
 	    	$('.topSubMenu').append(
 	    		"<h4 class='basketMenu'>결제실패</h4>"		
 	    	);
 	    })
 	</script>
</body>
</html>