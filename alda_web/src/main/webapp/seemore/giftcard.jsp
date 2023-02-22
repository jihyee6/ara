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
	.giftcardTitle{
		text-align: center;
		margin: 40px auto;
	}
	.giftcardTitle h4{
		font-size: 32px;
		color: #727F8A;
		font-family: AGhodic;
	}
	.SelectGiftcard{
		font-size: 16px;
		font-family: NotoSans;
		color: #000000;
		font-weight: 600;
		margin: 20px auto;
	}
	.giftCard{
		width: 220px;
		text-align: center;
		display: inline-block;
		font-family: NotoSans;
		line-height: 26px;
		margin-bottom: 40px;
		margin-right: 28px;
		cursor: pointer;
	}
	.shopName{
		font-size: 14px;
		color: #707070;
	}
	.giftCardName{
		font-size: 16px;
		color: #242424;
	}
	.giftCardPrice{
		font-size: 16px;
		font-weight: bold;
		color: #727F8A;
	}
	.cardImage{
		margin-top: 12px;
	}
	
	.giftCard:hover{
		outline: 2px solid #8996A0;
	}

</style>
</head>
<body>
<%@include file="../header_noTop.jsp"%>
   <!-- <div class='topSubs'>
	   		<div class='topMenus'>
	   			<div class=topSubMenu>
			   		<h4 class='basketMenu'>더보기</h4>
	   			</div>
		   		<div class='memberInfo2'>
	   			<p style='float: left; height: 30px;'>000님 | </p>
	   			<p>로그아웃</p>
	   		</div>
	   </div>
   </div> -->
	
	<main class='Mypagecontent'>
		<div class='giftcardTitle'>
			<h4>선<span style='border-bottom: 2px solid #727F8A;'>물하</span>기</h4>
		</div>
		<div>
			<img src="../image/giftcardBanner.png">
		</div>
		<div>
			<p class='SelectGiftcard'>기프트카드 선택</p>
			<div class='giftCardLists'>
				<!-- <div class='giftCard'>
					<img class='cardImage' src='../image/icon/gift3.png'>
					<p class='shopName'>ARA</p>
					<p class='giftCardName'>기프트카드 30,000원권</p>
					<p class='giftCardPrice'>30,000</p>
				</div> -->
			</div>
			
		</div>
		
	</main>
 	<%@include file="../footer.jsp"%>
	<script>
	var user_id = '<%=id%>';
		/* 더보기 탑메뉴 */	
		$(function() {
	    	$('.topSubMenu').append(
	    		"<h4 class='basketMenu'>더보기</h4>"		
	    	);
	    	
	    	$.ajax({
				url : "../giftcards", // 컨트롤러 위치
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
						
						giftCardList();
						
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
		
		$(document).on('click','.giftCard',function(){
			var giftId = $(this).attr('id');
			location.href='giftDescription?giftcard_id=' + giftId;
		})
	</script>
	<script>
		function giftCardList(){
			for(var i = 0; i < data.length; i++){
				$('.giftCardLists').append(
					"<div class='giftCard' id='" + data[i].giftcard_id + "'>"
						+"<img class='cardImage' src='" + data[i].giftcard_img_url + "'>"
						+"<p class='shopName'>ARA</p>"
						+"<p class='giftCardName'>" + data[i].giftcard_name + "</p>"
						+"<p class='giftCardPrice'>" + data[i].giftcard_price.toLocaleString('en') + "</p>"
					+"</div>"		
				)
			}
		}
	</script>
</body>
</html>