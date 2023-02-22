<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARA</title>
	<link rel = "stylesheet" href = "../css/main.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
	<style>
		.deleteBox{
			margin: 88px auto;
		}
	</style>
</head>
<body>
	<%@include file="../header.jsp"%>
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
			<div class="wishContent">
				<div class='deleteBox'>
					<div class="maintitle">회원탈퇴</div>
						<div class="deleteTab">
						<hr class="deleteLine">
						 <!-- 회원탈퇴 안내 div -->
							<div class="deleteConfirm">
								<p>회원탈퇴를 하시려면 안내 및 동의가 필요합니다.</p>
								<p style='color: #FF0000;'>회원탈퇴를 진행하시겠습니까?</p>
							</div>
						<hr class="deleteLine">
							<!-- 탈퇴 주의사항 div -->
							<div class="deleteNotice">
								<p>탈퇴 시 주의사항</p>
								<ul>
									<li>&middot; 탈퇴시 적립된 포인트와 쿠폰 등 금액에 관련된 내용은 삭제되어 복구가 불가능합니다.</li>
									<li>&middot; 등록된 리뷰는 자동으로 삭제되지 않으니 탈퇴 전 개별적으로 삭제해주시기 바랍니다.</li>
									<li>&middot; 계정 정보 및 위시리스트 정보 등 서비스 이용정보는 복구가 불가능합니다.</li>
								</ul>
							</div>
							<!-- 탈퇴 동의 체크박스 -->
							<div class="deletecheck">
								<label><input type="checkbox" class='oneCheck'> 위 주의사항을 모두 숙지했고, 탈퇴에 동의합니다.</label>
							</div>
							<!-- 탈퇴 버튼 div -->
							<div class="deleteButt">
								<button type="button" class='memDeleteBtn'>탈퇴하기</button>
							</div>
						</div>
					</div>
				</div>
			</main>
		<%@include file="../footer.jsp"%>
	<script>
		var user_id = '<%=id%>';
		/* 탈퇴하기 버튼 클릭하여 회원 탈퇴 하기 */
		$(document).on('click','.memDeleteBtn',function(){
			/* 탈퇴동의 체크박스에 체크를 해야 탈퇴하기 기능이 실행됨 */
			if($('.oneCheck').is(":checked") == false){
				alert('탈퇴 동의약관에 동의 하셔야 탈퇴 처리 됩니다.');
				$('.oneCheck').focus();
			} else{
				var sendData = {
						user: user_id,
					 }
				  console.log(sendData);
				 $.ajax({
					 contentType: "application/json; charset=utf-8",
					 url : "https://www.buyinhotel.co.kr:5000/user/exit" , // 컨트롤러 위치
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
							alert("회원탈퇴가 완료되었습니다.");
							location.href='../index.jsp';
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
			}
		})
		
	</script>
</body>
</html>