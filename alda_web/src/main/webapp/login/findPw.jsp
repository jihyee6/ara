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
	.idArea{
		width: 323px;
		height: 44px;
		border: 1px solid #CCCCCC;
		font-size: 15px;
		font-family: NotoSans;
		font-weight: 600;
		margin-bottom: 16px;
		padding-left: 12px;
	}

</style>

</head>
<body>
<% String id = (String) session.getAttribute("id"); %>
	<main class='loginContent'>
		<div class='logoIcon'>
			<img src='../image/icon/araLoginLogo.png' onclick='location.href="../index.jsp"'>
		</div>
		<div>
			<h4 class='joinTitle'>비밀번호 찾기</h4>
			<p class='joinTxt'>비밀번호를 찾으실 아이디 입력 후 휴대폰 인증을 진행해주세요.</p>
			<input class='idArea' type='text' placeholder='아이디'>
			<img class='phoneImg' src='../image/icon/phone.png'>
		</div>
	</main>

	<%@include file="../footer.jsp"%>
	
	<script>
	var user_id = '<%=id%>';
	
	/* 아이디값과 휴대폰인증한 휴대폰 번호가 회원정보가 일치한지 확인 */
		$(document).on('click','#phoneImg',function(){
			var loginId = $('.idArea').val();
			
			/* 아이디와 휴대폰 인증번호가 일치하는지 확인 */
			 $.ajax({
				url : "https://www.buyinhotel.co.kr:5000/user/check-id?login_id=" + loginId + "&phone_numb=", // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        }, 
				success : function(result){
					data = result.data;
					console.log(data);

					if(result.message == 'Success'){
						if(data.result == 'Success'){
							/* 일치하면 비밀번호 변경하는 페이지로 이동 */
							location.href='pwResult';
						} else{
							alert("일치하는 회원정보가 없습니다.");
							location.href='login';
						}
						return false;
					} else if(result.message == 'Fail'){
						alert("잠시후에 다시 시도해주세요.");
						return false;
					} else {
						alert("알 수 없는 에러입니다.");
						return false;
					}
					return false;					
				},
				error : function(){
					alert("검색실패");
					return false;
				}
			}) 
		})
	</script>
	
</body>
</html>