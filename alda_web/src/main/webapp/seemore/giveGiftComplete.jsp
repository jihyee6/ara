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
</head>
<body>
<% 
	String OID = (String) session.getAttribute("OID");
	String payment_state = (String) session.getAttribute("payment_state");
	String payment_message = (String) session.getAttribute("payment_message");
	String payTotalCharge = (String) session.getAttribute("payTotalCharge");
	String TID = (String) session.getAttribute("TID");
%>
<%@include file="../header_noTop.jsp"%>
   <!-- <div class='topSubs'>
	   		<div class='topMenus'>
	   			<div class=topSubMenu>
			   		<h4 class='basketMenu'>결제완료 <span>선물하기 > 선물결제하기 > <span style='color: #242424;'>결제완료</span></span></h4>
	   			</div>
		   		<div class='memberInfo2'>
	   			<p style='float: left; height: 30px;'>000님 | </p>
	   			<p>로그아웃</p>
	   		</div>
	   </div>
   </div> -->
	
	
	<main class='content'>
		
		<div class='giveCompleteMessage'>
			<img src='../image/icon/present.png'>
			<h4>결제가 완료되었습니다.</h4>
			<p>주문내역은 [마이페이지] -[선물함] 에서 확인하실 수 있습니다.</p>
		</div>
		
		
		<div class='giveInfo'>
			<p class='giveSubTitle'>상품정보</p>
			
			<div class='giveItem'>
				<div class='giveItemImg'>
					<img id='giveImg' src="">
				</div>
				<div class='giveItemInfo'>
					<p class='giveStore'>보니에가구</p>
					<p class='giveName'></p>
					<p class='giveOption'></p>
				</div>
				<div class='giveItemPrice'>
					<p class='givePrice'><span id='giftPrice'></span>원</p>
				</div>
			</div>
		</div>
		
		<div class='giveCompleteInfo'>
			<p class='giveCompleteTitle'>구매정보</p>
			<table>
				<tr>
					<td>구매번호</td>
					<td id='oid'></td>
				</tr>
				<tr>
					<td>선물구매일</td>
					<td>2022.03.01</td>
				</tr>
				<tr>
					<td>결제수단</td>
					<td id='paymentMethod'></td>
				</tr>
				<tr>
					<td>총 결제금액</td>
					<td style='font-weight: bold;'><span id='totalAmount'></span>원</td>
				</tr>
			</table>
			
		</div>	
			<div class='giveCompleteInfo'>
				<p class='giveCompleteTitle'>보내는 분</p>
				<table>
					<tr>
						<td>이름</td>
						<td id='sender_name'></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td id='sender_tel'></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td id='sender_email'></td>
					</tr>
				</table>
		</div>
		<div class='giveCompleteInfo'>
			<p class='giveCompleteTitle'>받는 분</p>
			<table>
				<tr>
					<td>이름</td>
					<td id='receiver_name'></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td id='receiver_tel'></td>
				</tr>
			</table>
		</div>
		<div class='giveCompleteBtn'>
			<button type='button' onclick='location.href="../mypage/giftBox"'>선물내역확인</button>
			<button type='button' onclick='location.href="../index.jsp"' style='color: #8996A0; border: 1px solid #8996A0;'>메인으로</button>
		</div>
	</main>
 	<%@include file="../footer.jsp"%>
 	<script>
 	var user_id = '<%=id%>';
 	var OID = '<%=OID%>';
	var payment_state = '<%=payment_state%>';
	var payment_message = '<%=payment_message%>';
	var payTotalCharge = '<%=payTotalCharge%>';
	var TID = '<%=TID%>';
 	$(function() {
    	$('.topSubMenu').append(
    		"<h4 class='basketMenu'>결제완료 <span>선물하기 > 선물결제하기 > <span style='color: #242424;'>결제완료</span></span></h4>"		
    	);
    	
    	var sendData = {
			TID : TID,
			OID : OID,
			payment_state : payment_state,
			payment_message : payment_message,
			
		 }
    	console.log(sendData);
    	
    	var giftCardInfo = JSON.parse(payTotalCharge);
    	 
    	 $.ajax({
			 contentType: "application/json; charset=utf-8",
			 url : "../payments", // 컨트롤러 위치
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
					
					$('#giveImg').attr('src', giftCardInfo.gift_img);
					$('.giveName').text(giftCardInfo.gift_name);
					$('#giftPrice').text(giftCardInfo.gift_price.toLocaleString('en'));
					$('#totalAmount').text(giftCardInfo.gift_price.toLocaleString('en'));
					$('.giveOption').text();
					$('.giveStore').text("ARA");
					$('#oid').text(OID);
					$('#paymentMethod').text(result.payment_method);
					$('#sender_name').text(result.payment_user_info.name);
					
					var num1 = result.payment_user_info.tel.substring(0,3);
					var num2 = result.payment_user_info.tel.substring(3,7);
					var num3 = result.payment_user_info.tel.substring(7,11);
					
					var senderTel = num1 + "-" + num2 + "-" + num3; 

					$('#sender_tel').text(senderTel);
					
					$('#sender_email').text(result.payment_user_info.email);
					$('#receiver_name').text(result.gift_receiver_info.name);
					
					var Rnum1 = result.gift_receiver_info.tel.substring(0,3);
					var Rnum2 = result.gift_receiver_info.tel.substring(3,7);
					var Rnum3 = result.gift_receiver_info.tel.substring(7,11);
					
					var receiverTel = Rnum1 + "-" + Rnum2 + "-" + Rnum3;
					
					$('#receiver_tel').text(receiverTel);
					
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
				alert("기프트카드 정보를 불러오지 못했습니다. 잠시후에 다시 시도해 주세요.");
				return false;
			}
		})
    })
    
 	</script>
</body>
</html>