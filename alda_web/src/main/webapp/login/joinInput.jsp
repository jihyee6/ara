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
	.longInput{
		width: 482px;
		height: 44px;
		border: 1px solid #CCCCCC;
		margin-bottom: 12px;
		padding-left: 6px;
		font-size: 15px;
		font-weight: 600;
		font-family: NotoSans;
	}
	.shortInput{
		width: 136px;
		height: 44px;
		border: 1px solid #CCCCCC;
		margin-right: 6px;
		font-size: 15px;
		font-weight: 600;
		font-family: NotoSans;
		padding-left: 4px;
	}
	
	.AgreeCheck{
		font-size: 14px;
		font-family: NotoSans;
		margin-top: 40px;
		text-align: left;
		width: 483px;
	}
	.detailAgree label{
		display: inline-block;
		width: 239px;
		text-align: left;
		margin-bottom: 6px;
		font-size: 13px;
	}
	.checkHr{
		margin: 10px auto;
	}
	.joinBtn{
		width: 476px;
		height: 49px;
		background-color: #8996A0;
		border: none;
		color: white;
		font-size: 17px;
		font-family: NotoSans;
		margin-top: 40px;
	}
	#idCheckBtn{
		width: 88px;
		height: 48px;
		border: none;
		border-radius: 6px;
		font-size: 14px;
		color: white;
		background-color: #8996A0;
		cursor: pointer;
	}
	#pwCheck, #pwReCheck{
		font-size: 12px;
		margin-bottom: 8px;
	}
</style>

</head>
<body>
	<main class='loginContent' style='padding-bottom: 130px;'>
		<div class='logoIcon'>
			<img src='../image/icon/araLoginLogo.png' onclick='location.href="../index.jsp"'>
		</div>
		<div>
			<h4 class='joinTitle'>회원가입</h4>
		</div>
		<div class='inputs'>
			<div id='useridBox'>
				<input class='longInput' type='text' placeholder='아이디' id='userid' style="width: 384px;" onkeyup ='onlyAlphabet(this)' style='ime-mode: disabled;' maxlength= "20">
				<input type="button" id="idCheckBtn" value="중복체크">
			</div>
			<div id='userpwBox'>
				<input class='longInput' type='password' id='userpw' placeholder='비밀번호'>
				<div id ='pwCheck'></div>
				<input class='longInput' type='password' id='pwRE' placeholder='비밀번호 확인'>
				<div id='pwReCheck'></div>
			</div>
			<div>
				<input type='text' class='longInput' id='username' placeholder='이름' readonly>
			</div>
			<div>
				<input type='tel' class='longInput' id='usertel' placeholder='휴대폰번호' readonly>
			</div>
			<div class='emailBox' style='margin-left: 5px;'>
				<input class='shortInput' type='text' id='emailAccount' placeholder='이메일' style='margin-left: 0px;'>&nbsp;@&nbsp;<input class='shortInput' id='emailDomain' type='text'>
				<select class='shortInput' id='email_select' style='width: 156px; height: 48px;'> 
					<option value="" selected>직접입력</option>
					<option value = "naver.com">naver.com</option>
					<option value = "hanmail.net">hanmail.net</option>
					<option value = "daum.net">daum.net</option>
					<option value = "hotmail.net">hotmail.net</option>
					<option value = "nate.com">nate.com</option>
					<option value = "gmail.com">gmail.com</option>
				</select>
			</div>
		</div>	
		<div class='AgreeCheck'>
			<label style='color: #FF0000;'><input type='checkbox' id="allCheck">&nbsp;전체동의</label>
			<hr class='checkHr'>
			<div class='detailAgree'>
				<label><input type='checkbox' name = "oneCheck" id='serviceTerms'>&nbsp;이용약관 동의(필수)</label>
				<label><input type='checkbox' name = "oneCheck" id='ageTerms'>&nbsp;만 14세 이상 확인(필수)</label>
				<label><input type='checkbox' name = "oneCheck" id='privacyTerms'>&nbsp;개인정보 수집 이용 동의 (필수)</label>
				<label><input type='checkbox' name = "oneCheck" id='marketingTerms'>&nbsp;마케팅 알림 수신 동의(선택)</label>
				<label style='float: left;'><input type='checkbox' name = "oneCheck" id='locationTerms'>&nbsp;위치기반 서비스 이용약관 동의(선택)</label>
			</div>
		</div>
		
		<button type='button' class='joinBtn'>회원가입</button>	
	</main>

<%@include file="../footer.jsp"%>
	
	<script>
		var join_type = '<%= session.getAttribute("join_type")%>';
	 	var name = '<%= session.getAttribute("user_name")%>';
	 	var phone = '<%= session.getAttribute("phone_no")%>';
	 	var token = '<%= session.getAttribute("token")%>';
	 	var origin_page = '<%= session.getAttribute("origin_page")%>';
	 	var idCheck = false;
	 	var pwCheck = false;
	 	var join_name = null;
	 	var join_phone = null;
	 	var login_id;
	 	var login_pw;
	 	
	 	var id = "";
	 	
	 	$(function() {
			
			if (join_type != "app") {
				$('#useridBox').css('display', 'none');
				$('#userpwBox').css('display', 'none');
			}
			
			if (name == 'null' || phone == 'null') {
				alert("회원가입 중 오류가 발생했습니다. 처음부터 다시 시도해주세요.");
				location.href = 'join';
			} else {
				$('#username').val(name);
				$('#usertel').val(phone);
				join_name = name;
				join_phone = phone;
			}
		});
	 	
	 	function IDCheck() {
	 		id = $('#userid').val();
	 		
	 		if(id == ""){
	 			alert("아이디를 입력해주세요.");
	 		} else {
				var input_phone = $('#usertel').val();
		 		
		 		if (phone != input_phone) {
	 				alert("전화번호 변조 위험");
	 			
	 				return;
	 			}
		 		
		 		var sendData = {
	 				user_id : id,
	 				user_phone_numb : phone,
	 				is_ara : true
		 		};
		 		
				$.ajax({
					contentType: "application/json; charset=utf-8",
					url: "https://www.buyinhotel.co.kr:5000/user/app-user-id-check", // 컨트롤러 위치
					type: "post",
					dataType: 'JSON',
					data: JSON.stringify(sendData),
					success: function(result) {
						console.log(result)
						
						var message = result.message;
						
						if(message == "Success") {
							if(id.length > 5){
								idCheck = true;
								alert("사용가능한 아이디입니다.");
								login_id = $('#userid').val();
							} else{
								alert("5~20자의 영문 소문자, 숫자만 사용가능합니다.");
							}
							
							return false;
						} else if(message == "duplicate") {
							idCheck = false;
							
							alert("중복된 아이디입니다.");
							
							return false;
						} else if(message == "Exist") {
							idCheck = false;
							
							alert("이미 회원가입이 완료되었습니다.");
							
							return false;
						} else if(message == "Fail") {
							idCheck = false;
							
							alert("전화번호 체크중 오류 발생");
							
							return false;
						}
						
						return false;
					},
					error: function() {
						alert("서버 요청 실패");
						return false;
					}
				});
	 		}
	 	}
	 	
	 	function PwCheck() {
	 		var pw = $('#userpw').val();
			
	        $.ajax({
		        url : "../PwCheckCon.do", // 컨트롤러 위치
		        type : "post",
		        data : {pw: pw},
		        dataType : 'text',
		        success : function(result){
			        if (result == "Regex") {
				          $('#pwCheck').text("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
	                	  $('#pwCheck').css({"color":"red","padding-left":"24px"});
	                	  
	                	  pwCheck = false;
	                	  
	                	  return false;
	    			} else if(result == "Success"){
	    				  $('#pwCheck').text('사용 가능한 비밀번호 입니다.');
	                	  $('#pwCheck').css({"color":"#666DF2", "padding-left":"24px"});
	                	  
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
	 	
	 		
	            
	  	// 비밀번호 확인
	   function RePwCheck() {
	     	var pw = $('#userpw').val();
			var pwRe = $('#pwRE').val();
			
			$.ajax({
			 url : "../PwReCon.do", // 컨트롤러 위치
			 type : "post",
			 data : {pw: pw, pwRe: pwRe},
			 dataType : 'text',
			 success : function(result){
			
			// 5~20자의 영문자, 숫자만 사용 가능합니다.
			
			   if (result == "Blank") {
				   $('#pwReCheck').text("비밀번호를 먼저 입력 해주세요.");
			       $('#pwReCheck').css({"color":"red","font-size":"12px"});
			       return false;
			   } else if(result == "Match") {
			       $('#pwReCheck').text("비밀번호가 일치하지 않습니다.");
			       $('#pwReCheck').css({"color":"red","font-size":"12px"});
			       return false;
			   } else if(result == "Success"){
				   if(pwRe != ''){
				       $('#pwReCheck').text("비밀번호가 일치합니다.");
				       $('#pwReCheck').css({"color":"#08a600","font-size":"12px"});
				       login_pw = $('#userpw').val();
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
	 	
	 	function JoinComplete() {
		 	if (name == 'null' || phone == 'null') {
				return;
			}
	 		
	 		var input_name = join_name;
	 		var input_phone = join_phone;
	 		
		 	if (name != input_name || phone != input_phone) {
	 			alert("정보 변조 위험");
	 			
	 			return;
	 		}
	 		
	 		var account_check;
	 		var email_account = $('#emailAccount').val();
	 		var email_domain = $('#emailDomain').val();
	 		var service_terms_check = $('#serviceTerms').is(":checked");
	 		var age_terms_check = $('#ageTerms').is(":checked");
	 		var privacy_terms_check = $('#privacyTerms').is(":checked");

	 		if (join_type == "app") {
	 			console.log(idCheck);
	 			
	 			account_check = idCheck && pwCheck;
	 			
	 			console.log(account_check);
	 		} else {
	 			account_check = true;
	 		}
	 		
	 		if(!account_check) {
	 			alert("아이디 중복체크 및 올바른 비밀번호를 입력해주세요.");
	 		} else if(email_account == "") {
	 			alert("이메일 입력은 필수사항입니다.");
	 			 $('#emailAccount').focus();
	 		} else if(email_domain == "") {
	 			alert("이메일 입력은 필수사항입니다.");
	 			$('#emailDomain').focus();
	 		} else if(!service_terms_check || !age_terms_check || !privacy_terms_check) {
	 			alert("필수 약관에 동의해주세요.");
	 		} else {
	 			var sendData;
	 			
	 			if (join_type == "app") {
	 				sendData = {
 						login_id : login_id,
 						login_type : "app",
 						username : name,
 						user_email_account : email_account,
 						user_email_domain : email_domain,
 						user_phone_numb : phone,
 						password : login_pw,
 						social_token : null,
 						marketing_check : $('#marketingTerms').is(":checked"),
 						location_check : $('#locationTerms').is(":checked"),
 						is_ara : true
	 				};
	 			} else {
	 				sendData = {
						login_id : null,
						login_type : join_type,
						username : name,
						user_email_account : email_account,
						user_email_domain : email_domain,
						user_phone_numb : phone,
						password : null,
						social_token : token,
						marketing_check : $('#marketingTerms').is(":checked"),
						location_check : $('#locationTerms').is(":checked"),
						is_ara : true
	 				};
	 			}
	 			
	 			console.log(sendData);
	 			
	 			$.ajax({
					contentType: "application/json; charset=utf-8",
					url: "https://www.buyinhotel.co.kr:5000/user/join-complete", // 컨트롤러 위치
					type: "put",
					dataType: 'JSON',
					data: JSON.stringify(sendData),
					success: function(result) {
						console.log(result);
						
						var message = result.message;
						
						if(message == "Success") {
							location.href = '../index.jsp';
							
							return false;
						} else if(message == "Fail") {							
							alert("회원가입 중 오류 발생");
							
							return false;
						}
						
						return false;
					},
					error: function() {
						alert("서버 요청 실패");
						return false;
					}
				});
	 		}
	 	}
	 	
		function Login(id, login_type) {	
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
						location.href = origin_page;
						
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
	 	
		$("#idCheckBtn").click(function() {
			IDCheck();
		});
		
		$('#userpw').keyup(function() {
			PwCheck();
			RePwCheck();
			$(this).val($(this).val().replace(/ /g, ''));
		})
		
		$('#pwRE').keyup(function(){
			RePwCheck();
		})
		
		$("#email_select").change(function() {
			var domain = $(this).val();
			if (domain == "") {
				$("#emailDomain").val(domain);
				$("#emailDomain").attr('readonly', false);
			} else {
				$("#emailDomain").val(domain);
				$("#emailDomain").attr('readonly', true);
			}
		});
		
		/* 체크박스 전체 체크 클릭시 전체 체크박스 체크, 체크박스 전체 체크시 전체체크 체크박스 체크 */
		/* 전체체크 클릭시 */
		$("#allCheck").click(function() {
			if($("#allCheck").is(":checked")) $("input[name=oneCheck]").prop("checked", true);
			else $("input[name=oneCheck]").prop("checked", false);
		});
		/* 체크박스 하나 클릭시 */
		$("input[name=oneCheck]").click(function() {
			var total = $("input[name=oneCheck]").length;
			var checked = $("input[name=oneCheck]:checked").length;
			
			if(total != checked) $("#allCheck").prop("checked", false);
			else $("#allCheck").prop("checked", true); 
		});
		
		$(".joinBtn").click(function() {
			JoinComplete();
		});
	
		/* 아이디에 영문과 숫자만 입력 */
		function onlyAlphabet(e){
			e.value = e.value.replace(/[^A-Za-z0-9@_.-]/gi,'');
		}
	</script>
</body>
</html>