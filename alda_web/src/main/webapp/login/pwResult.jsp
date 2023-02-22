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
	
	.pwTxt{
		font-size: 16px;
		font-family: NotoSans;
		color: #242424;
		margin: 16px;
	}
	.changePW{
		width: 312px;
		height: 44px;
		border: 1px solid #CCCCCC;
		font-size: 15px;
		font-family: NotoSans;
		font-weight: 600;
		padding-left: 6px;
	}
	.pwChangeBtn{
		width: 312px;
		height: 49px;
		border: none;
		background-color: #8996A0;
		color: white;
		font-size: 17px;
		font-family: NotoSans;
	}
	#pwCheck, #pwReCheck{
		font-size: 12px;
		padding-top: 6px;
	}
	.newCheck, .reCheck{
		margin-bottom: 16px;
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
			<h4 class='joinTitle'>비밀번호 변경</h4>
			<p class='pwTxt'>변경하실 비밀번호를 입력해주세요</p>
			<div class='newCheck'>
				<input type='password' class='changePW' placeholder='비밀번호' id='newPw'>
				<p id='pwCheck'></p>
			</div>
			<div class='reCheck'>
				<input type='password' class='changePW' placeholder='비밀번호 확인' id='newPwCheck'>
				<p id='pwReCheck'></p>
			</div>
			<div class='changeBtn' style='margin-top: 40px;'>
				<button type='button' class='pwChangeBtn'>변경완료</button>
			</div>
		</div>
	</main>
<%@include file="../footer.jsp"%>
	<script>
	var user_id = '<%=id%>';
	var login_pw;
		
		/* 비밀번호 입력 유효성검사 */
		 	function PwCheck() {
		 		var pw = $('#newPw').val();
				
		        $.ajax({
			        url : "../PwCheckCon.do", // 컨트롤러 위치
			        type : "post",
			        data : {pw: pw},
			        dataType : 'text',
			        success : function(result){
				        if (result == "Regex") {
					          $('#pwCheck').text("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
		                	  $('#pwCheck').css({"color":"red"});
		                	  
		                	  pwCheck = false;
		                	  return false;
		    			} else if(result == "Success"){
		    				  $('#pwCheck').text('사용 가능한 비밀번호 입니다.');
		                	  $('#pwCheck').css({"color":"#666DF2"});
		                	  
		                	  pwCheck = true;
		                	  
							  return true;
						} 
		    			return false;
				    },
			        error : function(){
				        alert("비밀번호 검증 실패");
				        return false;
			        }
				});
		 	}
			
			
			// 새 비밀번호와 비밀번호 확인에 입력한 값이 일치한지 확인하는 함수
		   function RePwCheck() {
		     	var pw = $('#newPw').val();
				var pwRe = $('#newPwCheck').val();
				
				$.ajax({
				 url : "../PwReCon.do", // 컨트롤러 위치
				 type : "post",
				 data : {pw: pw, pwRe: pwRe},
				 dataType : 'text',
				 success : function(result){
				
				   if (result == "Blank") {
					   $('#pwReCheck').text("비밀번호를 먼저 입력 해주세요.");
				       $('#pwReCheck').css({"color":"red"});
				       return false;
				   } else if(result == "Match") {
				       $('#pwReCheck').text("비밀번호가 일치하지 않습니다.");
				       $('#pwReCheck').css({"color":"red"});
				       return false;
				   } else if(result == "Success"){
					   /* 입력한 새 비밀번호와 비밀번호 확인 값이 일치할때 */
					   if(pwRe != ''){
					       $('#pwReCheck').text("비밀번호가 일치합니다.");
					       $('#pwReCheck').css({"color":"#08a600"});
					       login_pw = $('#newPwCheck').val();
					   }
				       return true;
				   } 
				      return false;
				  },
				  error : function(){
				   alert("비밀번호 검증 실패");
				   return false;
				  }
				})
		    };
		
		 /* 비밀번호 변경 후 변경완료 버튼 클릭 */
		$(document).on('click','.pwChangeBtn',function(){
			var sendData = {
					user: user_id,
					new_pw: login_pw,
				 }
			
			  console.log(sendData);
			 $.ajax({
				 contentType: "application/json; charset=utf-8",
				 url : "https://www.buyinhotel.co.kr:5000/user/password", // 컨트롤러 위치
				// get, post
				// get은 쿼리스트링 방식
				// post 숨겨서 보내야 되므로 ajax안에 data: {}
				 type : "PUT",
				 beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        }, 
				 data : JSON.stringify(sendData),
				//dataType : response 어떤 타입으로 받을지
				dataType : 'JSON',
				success : function(result){
					
					console.log(result);
					
					if(result.message == 'Success'){
						alert("비밀번호 변경이 완료되었습니다.")
						location.href='login';
						return false;
					} else if(result.message == 'Fail'){
						alert("서버오류 발생");
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
			
		 	/* 새 비밀번호에 값 입력할때 비밀번호 유효성, 확인 함수 실행 */
			$(document).on('keyup','#newPw',function(){
				PwCheck();
				RePwCheck();
			})
			
			/* 비밀번호 확인에 값 입력할때 비밀번호 유효성, 확인 함수 실행 */
			$(document).on('keyup','#newPwCheck',function(){
				RePwCheck();
			})
	</script>
</body>
</html>