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
	.Myinfo{
		border-bottom: 1px solid #C9C9C9;
	}
	.myTable{
		width: 100%;
		margin-bottom: 30px;
	}
	.myTable td:first-child{
		width: 172px;
		text-align: center;
	}
	.myTable td{
		height: 44px;
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
		<div class='wishContent'>
			<h4>내정보</h4>
			
			<div class='Myinfo'>
				<table class='myTable'>
					<tr>
						<td>이름</td>
						<td><span id='user_name'></span>님</td>
					</tr>
					<!-- <tr>
						<td>휴대폰번호</td>
						<td id='user_phone'>000-0000-0000</td>
					</tr> -->
					<tr>
						<td>이메일</td>
						<td id='user_email'>0000</td>
					</tr>
				</table>	
				
			</div>
			<div class='infoModifyBtn' style='text-align: center; margin: 40px auto;'>
				<button type='button' class='myModifyBtn'>정보수정</button>			
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
 	    
 	    /* 정보 수정 버튼 클릭 */
 	    $(document).on('click','.myModifyBtn',function(){
 	    	location.href = 'infoModify';
 	    })
 	    
		$(function() {
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
							
							$('#user_name').text(data.user_name);
							$('#user_email').text(data.user_email);
							
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
		})
			
 	</script>
</body>
</html>