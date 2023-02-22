<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>ARA</title>
<style>
	.Myinfo h3{
		font-size: 32px;
		font-family: NotoSansM;
		color: #242424;
	}
	.Myinfo h3 img{
		width: 50px;
		height: 18px;
	}
	.infoModifyBtn button{
		width: 148px;
		height: 40px;
		border: 1px solid #707070;
		font-size: 16px;
		color: #707070;
		margin-right: 12px;
	}
	.infoTd{
		font-size: 14px;
		color: #A4A4A4;
		font-family: NotoSansR;
	}
	.orderTel:focus{
		outline: none;
	}
	#pwCheck, #pwChangeBtn{
		width: 120px;
		height: 38px;
		background-color: white;
		border: 1px solid #CCCCCC; 
		color: #242424;
		font-size: 16px;
		font-family: NotoSansR;
	}
	.changePw{
		display: none;
	}
	#newResult, #checkResult{
		padding-left: 24px;
		font-size: 12px;
	}
</style>
</head>
<body>
<%@include file="../header_noTop.jsp"%>
   <!-- <div class='topSubs'>
	   		<div class='topMenus'>
	   			<div class=topSubMenu>
			   		<h4 class='basketMenu'>마이페이지</h4>
	   			</div>
		   		<div class='memberInfo2'>
	   			<p style='float: left; height: 30px;'>000님 | </p>
	   			<p>로그아웃</p>
	   		</div>
	   </div>
   </div> -->
	
	
	<main class='Mypagecontent'>
		<aside>
		<div class='mypageSideMenu'>
			<ul>
				<li style='background-color: #8996A0;'><a href='Myinfo.jsp' style='color: white; text-decoration: underline'>내정보</a></li>
				<li><a href='point'>포인트&middot;쿠폰</a></li>
				<li><a href='wishList'>위시리스트</a></li>
				<li><a href='recent'>최근본상품</a></li>
				<li><a href='review' >나의리뷰</a></li>
				<li><a href='giftBox'>선물함</a></li>
				<li><a href='PurchaseHistory'>상품구매내역</a></li>
				<li><a href='exchange'>교환&middot;반품내역</a></li>
				
			</ul>
			</div>
		</aside>
		<div class='wishContent'>
				<div class='orderInfoTitle'>
				<h4>정보수정</h4>
				<div class='orderInfo'>
					<p class='standardInfo'>기본정보</p>
					<table class='orderTable'>
						<tr>
							<td class='infoTd'>성명</td>
							<td><input class='input1' type='text' id='myName'></td>
						</tr>
						<tr>
							<td class='infoTd'>휴대폰 번호</td>
							<td>
							<select class='orderTel' id='userTel'>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="012">012</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							<input class='input3' style='margin: 0px 12px;' type='tel' id='tel1'>
							<input class='input3' type='tel' id='tel2'>
							</td>
						</tr>
						<tr>
							<td class='infoTd'>이메일</td>
							<td><input class='input1' type='text' id='email'></td>
						</tr>
					</table>
				</div>
				<hr style='border: 1px solid #CCCCCC;'>
				<div class='orderInfo'>
					<p class='standardInfo'>배송지정보</p>
					<table class='orderTable'>
						<tr>
							<td class='infoTd'>성명</td>
							<td><input class='input1' type='text'></td>
						</tr>
						<tr>
							<td class='infoTd'>휴대폰 번호</td>
							<td>
								<select class='orderTel' id='deliveryTel'>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="012">012</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
								<input class='input3' style='margin: 0px 12px;' type='tel'>
								<input class='input3' type='tel'>
							</td>
						</tr>
						<tr>
							<td class='infoTd'>주소</td>
							<td><input class='input1' type='text' name='zip' id='zip'><button class='postCodeBtn' type='button'>우편번호 검색</button>
								<input class='input2' name='addr1' id='addr1' style='margin: 12px auto;' type='text'>
							</td>
						</tr>
						<tr>
							<td class='infoTd'>상세주소</td>
							<td><input class='input2' name='addr2' id='addr2' type='text'></td>
						</tr>
					</table>
				</div>
				<div class='orderInfo'>
					<p class='standardInfo'>비밀번호 변경</p>
					<table class='orderTable'>
						<tr>
							<td class='infoTd'>현재 비밀번호</td>
							<td>
								<input class='input2 currentPw' type='password'>
								<button type='button' id='pwCheck'>확인</button>
							</td>
						</tr>
					</table>
					<table class='changePw'>
						<tr>
							<td class='infoTd'>새 비밀번호</td>
							<td>
								<input class='input2' type='password' id='newPw'>
								<p id='newResult'></p>
							</td>
						</tr>
						<tr>
							<td class='infoTd'>새 비밀<br>번호 확인</td>
							<td>
								<input class='input2' type='password' id='newPwCheck'>
								<button type="button" id='pwChangeBtn'>변경완료</button>
								<p id='checkResult'></p>
							</td>
						</tr>					
					</table>
				</div>
				
				<div class='infoModifyBtn'>
					<button type="button" id='modifyBtn'>수정완료</button>
					<button type="button" style='border: 1px solid #A4A4A4; color: #A4A4A4;' onclick='location.href="memDelete"'>회원탈퇴</button>
				</div>
			</div>
			
		</div>
		
	</main>
 	<%@include file="../footer.jsp"%>
 	<script>
 	var user_id = '<%=id%>';
 	
 	  $(function() {
 	    	$('.topSubMenu').append(
 	    		"<h4 class='basketMenu'>마이페이지</h4>"		
 	    	);
 	    })
 	</script>
 	<script> 
		$(document).ready(function(){ 
			$(".postCodeBtn").on("click",function(){
				new daum.Postcode({ 
					oncomplete: function(data) { 
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 
						
						// 각 주소의 노출 규칙에 따라 주소를 조합한다. 
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다. 
						var fullAddr = ''; // 최종 주소 변수 
						var extraAddr = ''; // 조합형 주소 변수 
						
						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다. 
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우 
							fullAddr = data.roadAddress; 
						} else { // 사용자가 지번 주소를 선택했을 경우(J) 
							fullAddr = data.jibunAddress; 
						} 
						
						// 사용자가 선택한 주소가 도로명 타입일때 조합한다. 
						if(data.userSelectedType === 'R'){ 
							//법정동명이 있을 경우 추가한다. 
							if(data.bname !== ''){ 
								extraAddr += data.bname; 
							} 
							// 건물명이 있을 경우 추가한다. 
							if(data.buildingName !== ''){ 
								extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName); 
							} 
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다. 
							fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : ''); 
						} 
						
						// 우편번호와 주소 정보를 해당 필드에 넣는다. 
						document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용 
						document.getElementById('addr1').value = fullAddr; // 커서를 상세주소 필드로 이동한다. 
						document.getElementById('addr2').focus(); 
					} 
				}).open(); 
			});
		}); 
		</script> 
		<script>
		if(user_id == "null") {
			alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
			location.href = '../login/login';
		} else{
			$.ajax({
				url : "https://www.buyinhotel.co.kr:5000/basic-myinfo?user=" + user_id, // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				success : function(result){
					
					if(result.message == 'Success'){
						data = result.data;
						console.log(data);	
						
						$('#myName').val(data.user_name);
						$('#email').val(data.user_email);
						
						user_tel = data.user_tel;
						
						$('#userTel').val(user_tel.substr(0,3));
						$('#tel1').val(user_tel.substr(3,4));
						$('#tel2').val(user_tel.substr(7,4));
						
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
		}
			
			//회원정보 수정완료
			$(document).on('click','#modifyBtn',function(){
				
				var userName = $('#myName').val();
				var userTel;
				var userEmail;
				
				userTel = $('#userTel').val() + $('#tel1').val() + $('#tel2').val();
				userEmail = $('#email').val();

				var sendData = {
						user: user_id,
						name: userName,
						tel: userTel,
						email: userEmail,
					 }
				
				  console.log(sendData);
				 $.ajax({
					 contentType: "application/json; charset=utf-8",
					 url : "https://www.buyinhotel.co.kr:5000/basic-myinfo?user=" + user_id, // 컨트롤러 위치
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
							alert("정보변경이 완료되었습니다.");
							location.href="Myinfo";
							return false;
						} else if(result.message == 'Fail'){
							alert("서버오류 발생");
							return false;
						} else if(result.message == 'Duplicate') {
							alert("전화번호가 동일한 회원이 있습니다.");
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
			
			//비밀번호 변경 > 현재비밀번호 확인
			$(document).on('click','#pwCheck',function(){
				var currentPw = $('.currentPw').val();
				console.log(currentPw);
				
				var sendData = {
						user: user_id,
						pw : currentPw,
					 }
				
				  console.log(sendData);
				 $.ajax({
					 contentType: "application/json; charset=utf-8",
					 url : "https://www.buyinhotel.co.kr:5000/user/password-check", // 컨트롤러 위치
					// get, post
					// get은 쿼리스트링 방식
					// post 숨겨서 보내야 되므로 ajax안에 data: {}
					 type : "POST",
					 beforeSend: function (xhr) {
				            xhr.setRequestHeader("user", user_id);
				        }, 
					 data : JSON.stringify(sendData),
					//dataType : response 어떤 타입으로 받을지
					dataType : 'JSON',
					success : function(result){
						
						console.log(result);
						
						if(result.message == 'Success'){
							$('.changePw').css('display','block');
							return false;
						} else if(result.message == 'Fail'){
							alert("비밀번호가 일치하지 않습니다.");
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
			
			
			//새 비밀번호 입력후 비밀번호 유효성 검사
			function newPw(){
				var pw = $('#newPw').val();
				
		        $.ajax({
			        url : "../PwCheckCon.do", // 컨트롤러 위치
			        type : "post",
			        data : {pw: pw},
			        dataType : 'text',
			        success : function(result){
				        if (result == "Regex") {
					          $('#newResult').text("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
		                	  $('#newResult').css({"color":"red"});
		                	  
		                	  pwCheck = false;
		                	  return false;
		    			} else if(result == "Success"){
		    				  $('#newResult').text('사용 가능한 비밀번호 입니다.');
		                	  $('#newResult').css({"color":"#666DF2"});
		                	  
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
			
			//새 비밀번호와 비밀번호 확인에 입력된 값이 같은지 확인
			function RePwCheck(){
				var pw = $('#newPw').val();
				var pwRe = $('#newPwCheck').val();
				
				$.ajax({
				 url : "../PwReCon.do", // 컨트롤러 위치
				 type : "post",
				 data : {pw: pw, pwRe: pwRe},
				 dataType : 'text',
				 success : function(result){
				
				// 5~20자의 영문자, 숫자만 사용 가능합니다.
				
				   if (result == "Blank") {
					   $('#checkResult').text("비밀번호를 먼저 입력 해주세요.");
				       $('#checkResult').css({"color":"red"});
				       return false;
				   } else if(result == "Match") {
				       $('#checkResult').text("비밀번호가 일치하지 않습니다.");
				       $('#checkResult').css({"color":"red"});
				       return false;
				   } else if(result == "Success"){
					   if(pwRe != ''){
					       $('#checkResult').text("비밀번호가 일치합니다.");
					       $('#checkResult').css({"color":"#08a600"});
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
			}
			
			$(document).on('click','#pwChangeBtn',function(){
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
							location.href='Myinfo';
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
			
			 /* 새 비밀번호에 값 입력시 비밀번호 유효성 검사와 일치여부 함수 실행되게 함 */
			$(document).on('keyup','#newPw',function(){
				newPw();
				RePwCheck();
			})
			
			/* 비밀번호 확인에 값 입력시 비밀번호 유효성 검사와 일치여부 함수 실행되게 함 */
			$(document).on('keyup','#newPwCheck',function(){
				RePwCheck();
			})
			
		</script>
</body>
</html>