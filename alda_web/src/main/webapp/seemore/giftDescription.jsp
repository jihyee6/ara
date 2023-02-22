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
	.giftCardArea{
	    display: grid;
	    grid-template-columns: 50% 50%;
	    margin: 40px auto;
	    border-top: 1px solid #535353;
	    padding: 28px 0px;
	}
	.giftcardImgs{
		width: 476px;
		height: 388px;
		background-color: #F6F6F6;
		display: flex;
		align-items: center;
	}
	.giftcardImgs image{
		width: 346px;
	}
	.giftCardTxt p{
		font-family: NotoSans;
	}
	.giftUseInfo{
		border-top: 1px solid #CCCCCC;
		width: 460px;
		margin: 18px auto;
	}
	.giftUseInfo td{
		height: 40px;
		font-size: 14px;
		font-family: NotoSans;
		color: #242424;
		border-bottom: 1px solid #CCCCCC;
	}
	.giftUseInfo td:first-child{
		background-color: #F6F6F6;
		text-align: center;
		width: 132px;
	}
	.giftUseInfo td:last-child{
		padding-left: 16px;
	}
	.infoBtn button{
		width: 214px;
		height: 48px;
		background-color: white;
		border: 1px solid #8A8A8A;
		border-radius: 4px;
		font-size: 16px;
		font-family: NotoSans;
		color: #707070;
	}
	.presentBtn{
		width: 460px;
		height: 48px;
		border: none;
		border-radius: 4px;
		background-color: #4366A3;
		color: white;
		font-size: 19px;
		font-family: NotoSans;
	}
	.descriptionTxt{
		font-size: 22px;
		font-family: NotoSans;
		color: #242424;
		border-bottom: 1px solid #CCCCCC;
		padding-bottom: 12px;
	}
	.desinfoTxt p{
		font-size: 15px;
		font-family: NotoSans;
		color: #242424;
	}
	.giftInfoPop h4{
		font-size: 24px;
		font-family: NotoSans;
		color: #242424;
		margin: 14px;
	}
	.giftInfoTable{
		width: 476px;
		border-top: 1px solid #DFDFDF;
		font-family: Malgun;
		font-size: 14px;
		color: #474747;
		margin: 24px auto;
	}
	.giftInfoTable td{
		padding: 14px 0px;
	}
	.giftInfoTable td:first-child{
		background-color: #F8F8F8;
		text-align: center;
		width: 148px;
	}
	.giftInfoTable td:last-child{
		padding-left: 12px;
	}
	.giftInfoPop li{
		font-family: NotoSans;
		font-size: 16px;
		color: #242424;
	}
	#descriptionImg{
		max-width: 640px;
	}
	#giftCardImg{
		width: 346px;
	}
	
</style>
</head>
<body>
<%int giftId = Integer.parseInt(request.getParameter("giftcard_id"));%>

<%@include file="../header_noTop.jsp"%>
   <!-- <div class='topSubs'>
	   		<div class='topMenus'>
	   			<div class=topSubMenu>
			   		<h4 class='basketMenu'>
			   		선물하기</h4>
	   			</div>
		   		<div class='memberInfo2'>
	   			<p style='float: left; height: 30px;'>000님 | </p>
	   			<p>로그아웃</p>
	   		</div>
	   </div>
   </div> -->
	
	<main class='Mypagecontent'>
		<div class='giftCardArea'>
			<div class='giftcardImgs'>
				<img id='giftCardImg' src=''>
			</div>
			<div class='giftCardTxt' style='line-height: 38px;'>
				<p style='font-size: 20px; color: #707070;'>ARA</p>
				<p style='color: #242424; font-size: 22px;' id='giftCardName'></p>
				<p style='color: #727F8A; font-size: 22px; font-weight: 600;'><span id='giftCardPrice'></span>원</p>
				
				<div style="margin-top: 63px;">
					<table class='giftUseInfo'>
						<tr>
							<td>유효기간</td>
							<td id='validity'></td>
						</tr>
						<tr>
							<td>사용처</td>
							<td id='whereUse'></td>
						</tr>
					</table>
					<div class='infoBtn' style="margin-bottom: 12px;">
						<button type='button' id='giftInfo' style="margin-right: 26px;">상품정보고시</button>
						<button type='button' id='returnInfo'>환불정책 및 방법</button>
					</div>
					<button type='button' class='presentBtn'>선물하기</button>
				</div>
			</div>
		</div>
		
		<div style="margin: 12px auto;">
			<p class='descriptionTxt'>상품설명</p>
			<div style='text-align: center;'>
				<img id='descriptionImg' src='../image/items/giftcardDetail.png'>
			</div>
		</div>
		
		<div>
			<p class='descriptionTxt'>이용안내</p>
			<div class='desinfoTxt' style='margin: 14px auto; line-height: 34px;'>
				<p>본 모바일 상품권은 ARA에서 상품 구매시 사용할수 있는 GIFT CARD입니다.</p>
				<p>실물 카드는 발급되지 않으며, 선물받은 카드는 [마이페이지 > 선물함 > 받은선물]에서 확인하실 수 있습니다.</p>
			</div>
		</div>
		
	</main>
 	<%@include file="../footer.jsp"%>
 	<div class='couponPop'>
	 		<div class='window'>
	 	 		<div class='popup' style='width: 508px; height: 343px;'>
	 	 		 <img id='close4' style="left: 490px;" src="../image/icon/whiteDelete.png">
		 	 		<div class='giftInfoPop'>
		 	 			<h4>상품정보고시</h4>
		 	 			<table class='giftInfoTable'>
		 	 				<tr>
		 	 					<td>발행자</td>
		 	 					<td>ARA</td>
		 	 				</tr>
		 	 				<tr>
		 	 					<td>유효기간, 이용조건</td>
		 	 					<td>상세페이지 참조</td>
		 	 				</tr>
		 	 				<tr>
		 	 					<td>이용 가능 매장</td>
		 	 					<td>상세페이지 참조</td>
		 	 				</tr>
		 	 				<tr>
		 	 					<td>잔액 환급 조건</td>
		 	 					<td>환불/취소정책 참조</td>
		 	 				</tr>
		 	 				<tr>
		 	 					<td>소비자상담 관련 전화번호</td>
		 	 					<td>0000-0000</td>
		 	 				</tr>
		 	 			</table>
		 	 		</div>
	 	 		</div>
	 	 	</div>
 		</div>
 		
 		<div class='refundPop'>
	 		<div class='window'>
	 	 		<div class='popup' style='width: 508px; height: 286px;'>
	 	 		 <img id='close4' style="left: 490px;" src="../image/icon/whiteDelete.png">
		 	 		<div class='giftInfoPop'>
		 	 			<h4>환불정책 및 방법</h4>
		 	 			<ul style="line-height: 30px;">
		 	 				<li>- 선물함 > 받은선물에서 환불요청이 가능합니다. </li>
		 	 				<li>- 유효기간 이내 환불 요청시 결제금액의 100% 환불 가능합니다.</li>
		 	 				<li>- 유효기간 이후 환불 요청시 결제금액의 90% 환불 가능합니다.</li>
		 	 				<li>- 유효기간 이내 환불금액은 구매자에게 환불됩니다.</li>
		 	 				<li>- 유효기간 이후 환불금액은 수신자에게 환불됩니다.</li>
		 	 				<li>- 일부금액 사용 후에는 환불이 되지 않습니다.</li>
		 	 				<li>- 부분환불은 불가능합니다.</li>
		 	 			</ul>
		 	 		</div>
	 	 		</div>
	 	 	</div>
 		</div>
 	<script>
 	var giftcard_id = <%=giftId%>;
 	var user_id = '<%=id%>';
 	
 	 $(function() {
     	$('.topSubMenu').append(
     		"<h4 class='basketMenu'>선물하기</h4>"		
     	);
     	
     	$.ajax({
			url : "../giftcard-info?giftcard="+giftcard_id, // 컨트롤러 위치
			type : "GET",
			dataType : 'JSON',
			// beforeSend = Header 먼저 보내주는부분 
			beforeSend: function (xhr) {
	            xhr.setRequestHeader("user", user_id);
	        },
			success : function(result){
				 
				
				if(result.message == 'Success'){
					data = result.data;
					console.log(data);	
					
					$('#giftCardImg').attr('src', data.giftcard_img_url);
					$('#giftCardName').text(data.giftcard_name);
					$('#giftCardPrice').text(data.giftcard_price.toLocaleString('en'));
					$('#validity').text(data.valid_period);
					$('#whereUse').text(data.giftcard_usage);
					$('#descriptionImg').attr('src',data.giftcard_detail_img_url);
					
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
				alert("검색실패options");
				return false;
			}
			
		})
     })
 	
 		$(document).on('click','.presentBtn',function(){
 			
 			if(user_id == null || user_id == "null") {
 				alert("로그인 후 이용하실 수 있습니다.")
 				location.href = '../login/login'
 			} else {
 				location.href = 'givingGift?giftcard_id=' + giftcard_id;
 			}
 		})
 		
 		$(document).on('click','#giftInfo',function(){
 			$('.couponPop').addClass('show');
 		})
 		$(document).on('click','#close4',function(){
 			$('.couponPop').removeClass('show');
 		})
 		
 		$(document).on('click','#returnInfo',function(){
 			$('.refundPop').addClass('show');
 		})
 		$(document).on('click','#close4',function(){
 			$('.refundPop').removeClass('show');
 		})
 	
 		
 	</script>
</body>
</html>