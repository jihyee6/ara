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
.<style>
	.storeNav li{
		display: inline-block;
		margin: 0px;
		width: 97px;
		text-align: center;
	}
	.storeNav{
		width: 100%;
		border-top: 1px solid #DFDFDF;
		border-bottom: 1px solid #DFDFDF;
		line-height: 42px;
		margin: 24px auto;
	}
	.storeA{
		font-size: 15px;
		color: #AAAAAA;
		font-family: Malgun;
		font-weight: normal;
		cursor: pointer;
	}
	.storeImportant{
		color: #242424;
		font-weight: bold;
	}
	
</style>
</head>
<body>
<%@include file="../header.jsp"%>

<main class='content'>
	<p class="menuTitle">스<span class='titleLine'>토</span>어</p>
	
	<div class='storeNav'>
		<!-- 스토어 카테고리 목록 -->
		<ul id='storeCategory'>
			<!-- <li><a class='storeA' id='defaultOpen'>가구</a></li>	-->
		</ul>
	</div>
	
	<!-- 카테고리 상품들 -->
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
		</div> -->
	</div>
</main>
<%@include file="../footer.jsp"%>
<script>
	var user_id = '<%=id%>';
	
	var firstTab;
	
	$(function() {
		$.ajax({
			url : "../storepage", // 컨트롤러 위치
			type : "GET",
			dataType : 'JSON',
			beforeSend: function (xhr) {
	            xhr.setRequestHeader("user", user_id);
	        },
			success : function(result){
				data = result.data;
				console.log(data);
				
				categoryData = data.categories;
				console.log(categoryData);
				
				category();
				
				return false;
			},
			error : function(){
				alert("검색실패");
				return false;
			}
		})
		
		/* $.ajax({
			url : "../categories", // 컨트롤러 위치
			type : "GET",
			dataType : 'JSON',
			beforeSend: function (xhr) {
	            xhr.setRequestHeader("user", user_id);
	        },
			success : function(result){
				data = result.data;
				console.log(data);
				firstTab = data[0];
				
				category();
				return false;
			},
			error : function(){
				alert("검색실패");
				return false;
			}
		}) */
		
		$.ajax({
				url : "../products?thumb=false&large_category=" + 1, // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        },
				success : function(result){
					data = result.data;
					console.log(data);
						
					categoryProduct();
					return false;
				},
				error : function(){
					alert("검색실패");
					return false;
				}
			}) 
	})

	$(document).on('click', '.storeA', function(){
		$('.storeA').removeClass('storeImportant');
		$(this).addClass('storeImportant');
		
		categoryId = $(this).attr('id');
		
		$.ajax({
			url : "../products?thumb=false&large_category=" + categoryId, // 컨트롤러 위치
			type : "GET",
			dataType : 'JSON',
			beforeSend: function (xhr) {
	            xhr.setRequestHeader("user", user_id);
	        },
			success : function(result){
				data = result.data;
				console.log(data);
				
				categoryProduct();
				
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
		
		location.href='productInfo?product=' + product_id;
	})
</script>
<script>
	
	
	function category(){
		for(var i = 0; i < categoryData.length; i++){
			if(i == 0){
				$('#storeCategory').append(
					"<li>" 
						+"<a class='storeA storeImportant' id='" + categoryData[i].category_id + "'>" + categoryData[i].category_name + "</a>"
					+"</li>"
					)
			}else{
				$('#storeCategory').append(
					"<li>" 
						+"<a class='storeA' id='" + categoryData[i].category_id + "'>" + categoryData[i].category_name + "</a>"
					+"</li>"
				)
				
			}
		}
	}
	
	function categoryProduct(){
		$('.storeItems *').remove();
		
		for(var i = 0; i < data.length; i++){
			$('.storeItems').append(
				"<div class='aldastoreItems' id='" + data[i].product_id + "'>"
					+"<img class='itemImg' src='" + data[i].product_img_url + "'>"
					+"<p class='itemName'>" + data[i].product_name + "</p>"
					+"<div id='itemPrices" + i + "'>"

					+"</div>"
					+"<p class='itemReviewCount'>리뷰 " + data[i].review_num + "</p>"
						+"<div class='productInfo' id='productInfo" + i + "'>"
						+"</div>"
				+"</div>"			
			)
			
			
			if(!data[i].dc_rate){
				$('#itemPrices'+i).append(
						"<h5 class='itemPrice'>" + data[i].sale_price.toLocaleString('en') + "원</h5>"	
					)
			} else{
				$('#itemPrices'+i).append(
					//"<p class='itemSales'>" + data[i].list_price.toLocaleString('en') + "원 </p><span class='salePrice'>" + data[i].dc_rate + "%</span>"
					"<h5 class='itemPrice'>" + data[i].sale_price.toLocaleString('en') + "원</h5>"	
				)
			}
			
			/* 바이인 호텔에 있을시 */
			if(data[i].is_buyinhotel == true){
				$('#productInfo'+i).append(
					"<div class='buyIn'><p>바이인</p></div>"		
				)
			}
			/* 특가상품일시 */
			if(data[i].bargain_price == true){
				$('#productInfo'+i).append(
					"<div class='specialPrice'><p>특가</p></div>"		
				)
			}
			/* 무료배송일시 */
			if(data[i].delivery_price == false){
				$('#productInfo'+i).append(
					"<div class='free'><p>무료배송</p></div>"		
				)
			}
		}	
	}
	
</script>
</body>
</html>