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
<%@include file="../header.jsp"%>

<main class='content'>
	<p class="menuTitle">핫<span class='titleLine'>&nbsp;&nbsp;&nbsp;</span>딜</p>
	<!-- 핫딜 남은 시간 배너 -->
	<div class="timeRemaining">
		<img class='timeBackground' src="../image/hotdealBack.png">
		<div class='dealTime'>
			<p>남은시간</p>
			<div class='TimeLines'>
			</div>
			<div class='time'>
				<span id="d-day-hour">00</span>
	            <span class="col">:</span>
	            <span id="d-day-min">00</span>
	            <span class="col">:</span>
	            <span id="d-day-sec">00</span>
			</div>
			<!-- <p class='time'>
			</p> -->
		</div>
	</div>
	<!-- 핫딜 상품 -->
	<div class='storeItems'>
		<!-- <div class='aldastoreItems' onclick='location.href="productInfo"'>
			<img class='itemImg' src="../image/items/item1.png">
			<p class='itemName'>Q4 유로탑 롤팩 매트리스 2size 2컬러</p>
			<p class='itemSales'>710,000원 </p><span class='salePrice'>61%</span>
			<h5 class='itemPrice'>269,900원</h5>
			<p class='itemReviewCount' onclick='location.href=""'>리뷰 8,603</p>
				<div class='productInfo'>
					<div class='free'><p>무료배송</p></div>
					<div class='specialPrice'><p>특가</p></div>
					<div class='buyIn'><p>바이인</p></div>
				</div>
		</div>	 -->
		<!-- 핫딜 상품 하나 끝 -->
	</div>
</main>
<%@include file="../footer.jsp"%>
<script>
	var user_id = '<%=id%>';

	$(function(){
		$.ajax({
			url : "../hotdeal", // 컨트롤러 위치
			type : "GET",
			dataType : 'JSON',
			beforeSend: function (xhr) {
	            xhr.setRequestHeader("user", user_id);
	        },
			success : function(result){
				data = result.data;
				console.log(data);
				productData = data.products;
				
				dealItem();
				remaindTime();
				
				return false;
			},
			error : function(){
				alert("검색실패");
				return false;
			}
		})
	})
	
	$(document).on('click','.aldastoreItems',function(){
		var product_id;
		product_id = $(this).attr('id');
		
		location.href = 'productInfo?product=' + product_id;
	})
</script>
<script>
	function dealItem(){
		for(var i = 0; i < productData.length; i++){
			$('.storeItems').append(
				"<div class='aldastoreItems' id='" + productData[i].product_id + "'>"
					+"<img class='itemImg' src='" + productData[i].product_img_url + "'>"
					+"<p class='itemName'>" + productData[i].product_name + "</p>"
					+"<div id='itemPrices" + i + "'>"

					+"</div>"
					//+"<p class='itemReviewCount'>리뷰 " + productData[i].review_num + "</p>"
						+"<div class='productInfo' id='productInfo" + i + "'>"
					
						+"</div>"
				+"</div>"			
			)
			
			if(!productData[i].dc_rate){
				$('#itemPrices'+i).append(
					"<h5 class='itemPrice'>" + productData[i].sale_price.toLocaleString('en') + "원</h5>"	
				)
			} else {
				$('#itemPrices'+i).append(
					//"<p class='itemSales'>" + productData[i].list_price.toLocaleString('en') + "원 </p><span class='salePrice'>" + productData[i].dc_rate + "%</span>"
					"<h5 class='itemPrice'>" + productData[i].sale_price.toLocaleString('en') + "원</h5>"	
				)
			}
			
			/* 특가상품일때 */
			if(productData[i].bargain_price == true){
				$('#productInfo'+i).append(
					"<div class='specialPrice'><p>특가</p></div>"		
				)
			}
			/* 무료배송일때 */
			if(productData[i].delivery_price == false){
				$('#productInfo'+i).append(
					"<div class='free'><p>무료배송</p></div>"		
				)
			}
			/* 바이인호텔 상품일때 */
			if(productData[i].is_buyinhotel == true){
				$('#productInfo'+i).append(
					"<div class='buyIn'><p>바이인</p></div>"		
				)
			}
		}
	}
	
	function remaindTime() {
        var now = new Date(); //현재시간을 구한다. 
        var open = new Date(data.hotdeal_due);
    
        var nt = now.getTime(); // 현재의 시간만 가져온다
        var ot = open.getTime(); // 오픈시간만 가져온다
    
    if(nt<ot){ //현재시간이 오픈시간보다 이르면 오픈시간까지의 남은 시간을 구한다.   
        sec = parseInt(ot - nt) / 1000;
        hour = parseInt(sec/60/60);
        sec = (sec - (hour*60*60));
        min = parseInt(sec/60);
        sec = parseInt(sec-(min*60));
    
        if(hour<10){hour="0"+hour;}
        if(min<10){min="0"+min;}
        if(sec<10){sec="0"+sec;}
        $("#d-day-hour").html(hour);
        $("#d-day-min").html(min);
        $("#d-day-sec").html(sec);
    } else{ //현재시간이 종료시간보다 크면
        $("#d-day-hour").html('00');
        $("#d-day-min").html('00');
        $("#d-day-sec").html('00');
    }
    }
    setInterval(remaindTime,1000);
	
	
</script>
</body>
</html>