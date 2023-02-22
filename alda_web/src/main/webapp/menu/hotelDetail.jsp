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
	 .hoverbollom 
	{
	position: relative;
	padding: 10px 10px 10px 10px;
	background: #FFFFFF;
	border-radius: 5px;
	border: #FFFFFF solid 1px;
	position: absolute;
	font-size: 16px;
	text-align: left;
	width: 300px;
	height: 96px;
	top: 404px;
	left: 365px;
	display: none;
	}
	
	.hoverbollom:after 
	{
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 26px 16px 0px 15.5px;
	border-color: #FFFFFF transparent;
	display: block;
	width: 0;
	z-index: 1;
	bottom: -25.5px; 
	left: 128px; 
	}
	
	.hoverbollom:before 
	{
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 26px 16px 0px 15.5px;
	border-color: #FFFFFF transparent;
	display: block;
	width: 0;
	z-index: 0;
	bottom: -27px;
	left: 128px;
	}
	.hoverImg img{
        width: 96px;
    }
    .hoverItem{
        display: grid;
        grid-template-columns: 30% 70%;
    }

    .hoverText{
        margin-left: 12px;
    }

</style>
</head>
<body>
<% String hotel_id = request.getParameter("lodgement_id"); %>
<%@include file="../header.jsp"%>

<main class='middleContent'>
	<!-- 호텔 정보 -->
	<div class='hotelRoomInfo'>
		<p class='hotelName'></p>
		<img class='roomImg' src=''>
		<!-- 호텔 룸 사진 위에 제품정보 위치 점들 -->
		<!-- <div class='roomDot'>
			<img class='RoomItemDot' style="position: absolute; top: 53%; left: 5%;" src='../image/icon/roomview.png'>
		</div> -->
		<!-- 해당 호텔 정보 -->
		<div class='roomText'>
			<p class='roomName'></p>
			<!-- <p class='roomPrice'>숙박 140,000원</p>
			<p class='roomPeople'>2인 기준 (최대 2인)</p>
			<p class='roomReview' onclick='location.href=""'>리뷰 272</p> -->
		</div>
	</div>
	<!-- 호텔에 배치되어있는 제품들 -->
	<div class='hotelRoomItems'>
			
			
	</div>
	<button type='button' class='reservationBtn' id=''>객실 예약하기</button>
</main>
<!-- 호텔객실 이미지안의 버튼에 마우스 호버시 해당 제품의 정보 나타내기 -->
	<div class="hoverbollom">
		    <div class="hoverItem">
	            <div class="hoverImg">
	                <img src="../image/items/roomItem1.png">
	            </div>
	            <div class="hoverText">
	                <p class='roomItemStore'>삼성전자</p>
	                <p class='roomItemName'>스마트 모니터 M5 FHD HDR10</p>
	                <p class='itemSales'>439,000원</p><span class='salePrice'>18%</span>
	                <p class='itemPrice'>357,000원</p>
	
	            </div>
	        </div>
		</div>
<%@include file="../footer.jsp"%>
<script>
	var user_id = '<%=id%>';
	var hotel_id = '<%=hotel_id%>';
	/* $(document).on('click','.RoomItemDot', function(){
		if($('.hoverbollom').css('display') == 'none'){			
			$('.hoverbollom').css('display','block');
		} else{
			$('.hoverbollom').css('display','none');
		}
	}) */
	
	$('.RoomItemDot').hover(function(){
		 $('.hoverbollom').css('display','block');
		}, function(){
		 $('.hoverbollom').css('display','none');
	});
	
	$(function(){
		
		$.ajax({
			url : "../buyins?lodgement=" + hotel_id, // 컨트롤러 위치
			type : "GET",
			dataType : 'JSON',
			beforeSend: function (xhr) {
	            xhr.setRequestHeader("user", user_id);
	        },
			success : function(result){
				data = result.data;
				console.log(data);
				for(var i in data){
					if(hotel_id == data[i].lodgement_id){
						$('.hotelName').text(data[i].lodgement_name);
						$('.roomName').text(data[i].lodgement_name);
						$('.roomImg').attr('src',data[i].lodgement_img_url);
						$('.reservationBtn').attr('id', data[i].lodgement_id);
					}
					
					itemData = data[i].buyin_products;
					console.log(itemData);
				}
				hotelItems();
				
				return false;
			},
			error : function(){
				alert("검색실패");
				return false;
			}
		})
	})
	
	function hotelItems(){
		for(var j in itemData){
			if(!itemData[j].dc_rate){
				$('.hotelRoomItems').append(
					"<div class='roomItems' id='" + itemData[j].product_id + "'>"
						+"<img class='roomItemImg' src='" + itemData[j].product_img_url + "'>"
						+"<p class='roomItemStore'>" + itemData[j].company_name + "</p>"
						+"<p class='roomItemName'>" + itemData[j].product_name + "</p>"
						+"<h5 class='itemPrice'>" + itemData[j].sale_price.toLocaleString('en') + "원</h5>"
					+"</div>"	
				)	
			} else{
				$('.hotelRoomItems').append(
					"<div class='roomItems' id='" + itemData[j].product_id + "'>"
						+"<img class='roomItemImg' src='" + itemData[j].product_img_url + "'>"
						+"<p class='roomItemStore'>" + itemData[j].company_name + "</p>"
						+"<p class='roomItemName'>" + itemData[j].product_name + "</p>"
						+"<p class='itemSales'>" + itemData[j].list_price.toLocaleString('en') + "원 </p><span class='salePrice'>" + itemData[j].dc_rate + "%</span>"
						+"<h5 class='itemPrice'>" + itemData[j].sale_price.toLocaleString('en') + "원</h5>"
					+"</div>"	
				)
			}
		}
	}
	
	$(document).on('click','.roomItems',function(){
		var product_id = $(this).attr('id');
		
		location.href ='productInfo?product=' + product_id;
	})
	
	
	$(document).on('click','.reservationBtn',function(){
		var hotel_id = $(this).attr('id');
		
		window.open("https://www.buyinhotel.co.kr/reserhotel/reservationhotel?hotel=" + hotel_id);
	})

</script>
</body>
</html>