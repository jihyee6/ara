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
	
	.idTxt{
		font-size: 16px;
		font-family: NotoSans;
		color: #242424;
		margin: 16px;
	}
	.idResult{
		border: 1px solid #CCCCCC;
		width: 312px;
		height: 44px;
		text-align: center;
	}
	.idBtn button{
		width: 148px;
		height: 49px;
		border: none;
		color: white;
		font-size: 17px;
		font-family: NotoSans;
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
			<div class='textbox'>
				<div class='findID'>
					<p class='idTxt'>회원님의 아이디는</p>
					<input type='text' class='idResult' readonly>
					<p class='idTxt'>입니다.</p>
				</div>
			</div>
			
			<div class='idBtn' style='margin-top: 40px;'>
				<button type='button' class='loginBtn' style='background-color: #8996A0; margin-right: 12px;'>로그인</button>
				<button type='button' class='findPWBtn' style='background-color: #A4A4A4;'>비밀번호 찾기</button>
			</div>
		</div>
	</main>

<%@include file="../footer.jsp"%>
	<script>
		$(document).on('click','.loginBtn',function(){
			location.href = 'login';
		})
		
		$(document).on('click','.findPWBtn',function(){
			location.href = 'findPw';
		})
	</script>
	<script>
	
	/* 찾은 아이디값 보여주는 ajax */
	$(function(){
		$.ajax({
			url : "https://www.buyinhotel.co.kr:5000/user/find-id?phone_numb=", // 컨트롤러 위치
			type : "GET",
			dataType : 'JSON',
			success : function(result){
				data = result.data;
				console.log(data);

				if(result.message == 'Success'){
					if(data.result == "Success"){
						/* data.type이 app일때만 id값을 알려줌 */
						if(data.type == 'app'){
							$('#idResult').val(data.login_id);
							/* data.type이 소셜로그인일때 해당 소셜로그인으로 가입한 회원임을 알려줌 */
						} else if(data.type == 'kakao'){
							$('.findID').css('display','none');
							$('.textbox').append(
								"<p>kakao로 가입한 회원입니다.</p>"		
							)
						} else if(data.type == 'naver'){
							$('.findID').css('display','none');
							$('.textbox').append(
								"<p>naver로 가입한 회원입니다.</p>"		
							)
						} else if(data.type == 'apple'){
							$('.findID').css('display','none');
							$('.textbox').append(
								"<p>apple로 가입한 회원입니다.</p>"		
							)
						}
						/* result가 false일때 가입한 회원이 아님 */
					} else{
						$('.findID').css('display','none');
						$('.textbox').append(
							"<p>가입한 회원이 아닙니다.</p>"		
						)
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