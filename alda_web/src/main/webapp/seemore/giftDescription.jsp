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
			   		????????????</h4>
	   			</div>
		   		<div class='memberInfo2'>
	   			<p style='float: left; height: 30px;'>000??? | </p>
	   			<p>????????????</p>
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
				<p style='color: #727F8A; font-size: 22px; font-weight: 600;'><span id='giftCardPrice'></span>???</p>
				
				<div style="margin-top: 63px;">
					<table class='giftUseInfo'>
						<tr>
							<td>????????????</td>
							<td id='validity'></td>
						</tr>
						<tr>
							<td>?????????</td>
							<td id='whereUse'></td>
						</tr>
					</table>
					<div class='infoBtn' style="margin-bottom: 12px;">
						<button type='button' id='giftInfo' style="margin-right: 26px;">??????????????????</button>
						<button type='button' id='returnInfo'>???????????? ??? ??????</button>
					</div>
					<button type='button' class='presentBtn'>????????????</button>
				</div>
			</div>
		</div>
		
		<div style="margin: 12px auto;">
			<p class='descriptionTxt'>????????????</p>
			<div style='text-align: center;'>
				<img id='descriptionImg' src='../image/items/giftcardDetail.png'>
			</div>
		</div>
		
		<div>
			<p class='descriptionTxt'>????????????</p>
			<div class='desinfoTxt' style='margin: 14px auto; line-height: 34px;'>
				<p>??? ????????? ???????????? ARA?????? ?????? ????????? ???????????? ?????? GIFT CARD?????????.</p>
				<p>?????? ????????? ???????????? ?????????, ???????????? ????????? [??????????????? > ????????? > ????????????]?????? ???????????? ??? ????????????.</p>
			</div>
		</div>
		
	</main>
 	<%@include file="../footer.jsp"%>
 	<div class='couponPop'>
	 		<div class='window'>
	 	 		<div class='popup' style='width: 508px; height: 343px;'>
	 	 		 <img id='close4' style="left: 490px;" src="../image/icon/whiteDelete.png">
		 	 		<div class='giftInfoPop'>
		 	 			<h4>??????????????????</h4>
		 	 			<table class='giftInfoTable'>
		 	 				<tr>
		 	 					<td>?????????</td>
		 	 					<td>ARA</td>
		 	 				</tr>
		 	 				<tr>
		 	 					<td>????????????, ????????????</td>
		 	 					<td>??????????????? ??????</td>
		 	 				</tr>
		 	 				<tr>
		 	 					<td>?????? ?????? ??????</td>
		 	 					<td>??????????????? ??????</td>
		 	 				</tr>
		 	 				<tr>
		 	 					<td>?????? ?????? ??????</td>
		 	 					<td>??????/???????????? ??????</td>
		 	 				</tr>
		 	 				<tr>
		 	 					<td>??????????????? ?????? ????????????</td>
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
		 	 			<h4>???????????? ??? ??????</h4>
		 	 			<ul style="line-height: 30px;">
		 	 				<li>- ????????? > ?????????????????? ??????????????? ???????????????. </li>
		 	 				<li>- ???????????? ?????? ?????? ????????? ??????????????? 100% ?????? ???????????????.</li>
		 	 				<li>- ???????????? ?????? ?????? ????????? ??????????????? 90% ?????? ???????????????.</li>
		 	 				<li>- ???????????? ?????? ??????????????? ??????????????? ???????????????.</li>
		 	 				<li>- ???????????? ?????? ??????????????? ??????????????? ???????????????.</li>
		 	 				<li>- ???????????? ?????? ????????? ????????? ?????? ????????????.</li>
		 	 				<li>- ??????????????? ??????????????????.</li>
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
     		"<h4 class='basketMenu'>????????????</h4>"		
     	);
     	
     	$.ajax({
			url : "../giftcard-info?giftcard="+giftcard_id, // ???????????? ??????
			type : "GET",
			dataType : 'JSON',
			// beforeSend = Header ?????? ?????????????????? 
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
					alert("???????????? ?????? ??????????????????.");
					return false;
				} else {
					alert("??? ??? ?????? ???????????????.");
					return false;
				}
				return false;					
			},
			error : function(){
				alert("????????????options");
				return false;
			}
			
		})
     })
 	
 		$(document).on('click','.presentBtn',function(){
 			
 			if(user_id == null || user_id == "null") {
 				alert("????????? ??? ???????????? ??? ????????????.")
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