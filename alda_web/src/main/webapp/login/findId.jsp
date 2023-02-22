<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>ARA</title>

<style>
	.joinTitle{
		font-family: NotoSans;
		font-size: 24px;
		color: #242424;
		margin: 50px auto;
	}
	.joinTxt{
		font-size: 16px;
		font-family: NotoSans;
		color: #242424;
		margin-bottom: 18px;
	}

</style>

</head>
<body>
	<main class='loginContent'>
		<div class='logoIcon'>
			<img src='../image/icon/araLoginLogo.png' onclick='location.href="../index.jsp"'>
		</div>
		<div>
			<h4 class='joinTitle'>아이디찾기</h4>
			<p class='joinTxt'>본인인증을 위해 휴대폰 인증을 진행해주세요.</p>
			<img class='phoneImg' src='../image/icon/phone.png'>
		</div>
	</main>

	<%@include file="../footer.jsp"%>
	
	<script>
		$(document).on('click','.phoneImg',function(){
			location.href='findIdResult';
		})
	</script>
	
	
</body>
</html>