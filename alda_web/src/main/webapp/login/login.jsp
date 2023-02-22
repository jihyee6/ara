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
	.idZone{
		margin-top: 48px;
		display: flex;
		border-bottom: 2px solid #8996A0;
		padding-bottom: 6px;
		width: 320px;
	}
	.loginTitle{
		font-size: 15px;
		font-family: NotoSans;
		color: #242424;
		margin-left: 8px;
	}
	.loginText{
		width: 228px;
		height: 16px;
		border: none;
		font-size: 16px;
	}
	.loginCheck{
		font-size: 13px;
		font-family: NotoSans;
		color: #242424;
		display: flex;
		margin-top: 10px;
		width: 320px;
	}
	.loginbutton , .joinBtn{
		width: 320px;
		height: 49px;
		font-family: NotoSans;
		font-size: 17px;
	}
	.socialLogin button{
		width: 152px;
		height: 49px;
		border: none;
		font-size: 16px;
		font-family: NotoSans;
	}
	.kakaoBtn{
		background-color: #FAE100;
		color: #242424;
		margin-right: 10px;
	}
	.naverBtn{
		background-color: #1EC545;
		color: #FFFFFF;
	}
</style>
</head>
<body>
	<main class='loginContent'>
		<div class='logoIcon'>
			<img src='../image/icon/araLoginLogo.png' onclick = 'location.href="../index.jsp"'>
		</div>
		<div class='idZone'>
			<p class='loginTitle'>아이디</p>
			<input class='loginText' type='text' id='user_id'>
		</div>
		<div class='idZone'>
			<p class='loginTitle'>비밀번호</p>
			<input class='loginText' type='password' id='user_pw'>
		</div>
		<div class='loginCheck'>
			<label style='margin-left: 0px; display: flex; align-items: center;'><input type='checkbox'>&nbsp;아이디 저장</label>
			<p style='margin-right: 0px; cursor: pointer;'><span id='findId'>아이디</span> | <span id='findPw'>비밀번호 찾기</span></p>
		</div>
		<div class='loginBtns' style='margin: 43px auto;'>
			<button type='button' class='loginbutton' id='btlog' style='background-color: #8996A0; color: #FFFFFF; border: none;'>로그인</button>
			<div class='socialLogin' style="margin-top: 20px;">
				<button type='button' class='kakaoBtn'>카카오 로그인</button>
				<button type='button' class='naverBtn'>네이버 로그인</button>
			</div>
		</div>
		<div class='join'>
			<button type='button' class='joinBtn' style='background-color: #FFFFFF; border: 2px solid #8996A0; color: #8996A0;'>회원가입</button>
		</div>
		
	</main>
	<%@include file="../footer.jsp"%>
	
	<script>
		/* 아이디찾기 페이지로 넘어가기 */
		$(document).on('click','#findId',function(){
			location.href='findId';
		})
		
		/* 비밀번호 찾기 페이지로 넘어가기 */
		$(document).on('click','#findPw',function(){
			location.href='findPw';
		})
	</script>
	<script>
		$(document).ready(function() {			
			// 엔터키 입력
			$("#user_id").keydown(function(key) {
				if (key.keyCode == 13) {
					$("#user_pw").focus();
				}
			});
		
			$("#user_pw").keydown(function(key) {
				if (key.keyCode == 13) {
					AppLogin();
				}
			});
			
			$('#btlog').click(function() {
				AppLogin();
			});
			
			$('#kakao').click(function() {
				KakaoLink();
			});
			
			$('.joinBtn').click(function() {
				JoinType(null, 'app');
			});
		});
		
		
		function SocialLogin(login_type, social_token) {
			var sendData = {
					login_type : login_type,
					social_token : social_token,
					fcm_token : null,
					is_ara : true
				};
			
			$.ajax({
				contentType: "application/json; charset=utf-8",
				url: "https://www.buyinhotel.co.kr:5000/user/social-login-try", // 컨트롤러 위치
				type: "post",
				dataType: 'JSON',
				data: JSON.stringify(sendData),
				success: function(result) {
					console.log(result)
					
					var message = result.message;
					
					if(message == "Success") {
						Login(result.app_token, login_type);
						
						return false;
					} else if(message == "Join") {
						JoinType(social_token, login_type);
						
						return false;
					} else if(message == "ReJoin") {
						if(login_type == "kakao") {
							Kakao.API.request({
							  url: '/v1/user/unlink',
							  success: function(response) {
							    console.log(response);
							    
							    KakaoLink();
							  },
							  fail: function(error) {
							    console.log(error);
							  },
							});
						} else if(login_type == "naver") {
							$.ajax({
								url: "../NaverUnlinkCon.Webdo",
								type: "GET",
								dataType: 'text',
								data: {
									access_token : naver_access_token,
								},
								success: function(result) {
									console.log(result)
									
									$('#naver_id_login_anchor').trigger('click');
									
									return false;
								},
								error: function(error) {
									console.log(error);
									
									return false;
								}
							});
						}
						return false;
					} else if(message == "Exited") {
						alert("탈퇴처리중인 회원입니다.");
						
						return false;
					} else if(message == "Fail") {
						alert("회원확인 처리중 오류 발생");
						
						return false;
					}
					
					return false;
				},
				error: function() {
					swal("서버 요청 실패", "연결을 다시 확인 해주세요.", "error");
					return false;
				}
			});
		}
		
		function AppLogin() {
			var sendData = {
					login_id : $('#user_id').val(),
					password : $('#user_pw').val(),
					fcm_token : null
				};
			
			$.ajax({
				contentType: "application/json; charset=utf-8",
				url: "https://www.buyinhotel.co.kr:5000/user/app-user-login", // 컨트롤러 위치
				type: "post",
				dataType: 'JSON',
				data: JSON.stringify(sendData),
				success: function(result) {
					console.log(result)
					
					var message = result.message;
					
					if(message == "Success") {
						Login(result.app_token, "app");
						
						return false;
					} else if(message == "False") {
						alert("아이디 또는 비밀번호가 잘못되었습니다.");
						
						return false;
					} else if(message == "Exited") {
						alert("탈퇴처리중인 회원입니다.");
						
						return false;
					} else if(message == "Fail") {
						alert("회원확인 처리중 오류 발생");
						
						return false;
					}
					
					return false;
				},
				error: function() {
					swal("서버 요청 실패", "연결을 다시 확인 해주세요.", "error");
					return false;
				}
			});
		}
		/*  function Login() {
			// 아이디 패스워드
			var id = $('#user_id').val();
			var pw = $('#user_pw').val();
	
			$.ajax({
				url: "../WebLoginCon.do", // 컨트롤러 위치
				type: "post",
				dataType: 'text',
				data: {
	
					id: id,
					pw: pw,
	
				},
				success: function(result) {
					console.log(result)
	
					if (result == "loginId") {
						swal("아이디 오류", "아이디를 입력해주세요.", "error");
						$("#id").focus();
						return false;
					} else if (result == "loginPw") {
						swal("비밀번호 오류", "비밀번호를 입력해주세요.", "error");
						$("#pw").focus();
						return false;
					} else if (result == "loginFailed") {
						swal("로그인 실패", "아이디와 비밀번호를 확인 해주세요.", "error");
						$("#id").focus();
						return false;
					} else if (result == "inipay") {
						location.href = document.referrer;
						
						return false;
					}
					
					window.location.reload();
					return false;
				},
				error: function() {
					swal("서버 요청 실패", "연결을 다시 확인 해주세요.", "error");
					return false;
				}
			});
		} */
		
		function Login(id, login_type) {
			/* var id = $('#user_id').val(); */
			
			$.ajax({
				url: "../WebLoginCon.Webdo", // 컨트롤러 위치
				type: "post",
				dataType: 'text',
				data: {
					id: id,
					login_type: login_type,
				},
				success: function(result) {
					console.log(result)
					if (result == "loginId") {
						alert("아이디 오류");

						return false;
					} else if (result == "loginType") {
						alert("타입 오류");

						return false;
					} else if (result == "login") {
						location.href = document.referrer;
						return false;
					}
					
					return false;
				},
				error: function() {
					swal("서버 요청 실패", "연결을 다시 확인 해주세요.", "error");
					return false;
				}
			});
		}
		
		function JoinType(token, join_type) {
			$.ajax({
				url: "../JoinTypeCon.do", // 컨트롤러 위치
				type: "post",
				dataType: 'text',
				data: {
	
					token: token,
					join_type: join_type,
					origin_page : document.referrer
	
				},
				success: function(result) {
					console.log(result)
					if (result == "joinToken") {
						alert("아이디 오류");

						return false;
					} else if (result == "joinType") {
						alert("타입 오류");

						return false;
					} else if (result == "join") {
						location.href = 'join';
						
						return false;
					}
					
					return false;
				},
				error: function() {
					swal("서버 요청 실패", "연결을 다시 확인 해주세요.", "error");
					return false;
				}
			});
		}
	</script>
</body>
</html>