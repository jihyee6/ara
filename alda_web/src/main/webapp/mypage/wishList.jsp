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
		.basketMessage{
			margin: 36px auto;
		}
		.wishListItems{
			margin-top: 14px;
			border-top: 1px solid #C9C9C9;
			border-bottom: 1px solid #C9C9C9;
		}
		.wishImg{
			cursor: pointer;
		}
		.noWish{
			text-align: center;
			font-size: 24px;
			margin: 74px auto;
			font-family: NanumSquare_ac;
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
				<li><a href='Myinfo'>내정보</a></li>
				<li><a href='point'>포인트&middot;쿠폰</a></li>
				<li style='background-color: #8996A0;'><a href='wishList' style='color: white; text-decoration: underline'>위시리스트</a></li>
				<li><a href='recent'>최근본상품</a></li>
				<li><a href='review'>나의리뷰</a></li>
				<li><a href='giftBox'>선물함</a></li>
				<li><a href='PurchaseHistory'>상품구매내역</a></li>
				<li><a href='exchange'>교환&middot;반품내역</a></li>
			</ul>
		</div>
		<div class='wishContent'>
			<h4>위시리스트</h4>
			<p class='wisListCount'>찜한상품 <span id='wishCount'></span>개</p>
			<div class='wishListItems'>
				<!-- <div class='wishlistItem'>
					<div class='wishImg'><img src='../image/items/wishItem.png'></div>
					<div class='wishText'>
						<p class='itemName'>2022NEW 블루스카이 공기청정기</p>
						<p class='itemSales'><span class='listPrice'>359,000</span>원</p><span class='salePrice'><span id='salePercent'>45</span>%</span>
						<p class='itemPrice' style='font-weight: bold;'><span id='SalePrice'>195,000</span>원</p>
					</div>
					<div class='wishBtn' style='text-align: right;'>
						<button type='button' style='margin-top: 25px;'class='deleteShow'>삭제하기</button>
						<button type='button' class='purchaseBtn' style='border: 1px solid #727F8A; color: #727F8A;'>구매하기</button>
					</div>
				</div>
				 -->
			</div>
		</div>
		
	</main>
 	<%@include file="../footer.jsp"%>
 		<!-- 장바구니 팝업 -->
 	 <div class="basketPop">
 	 	<div class='window'>
 	 		<div class='popup' style='height: 153px;'>
			        <p class="basketMessage">삭제하시겠습니까?</p>
			        <div class="basketPopBtn">
			            <button type="button" style='margin-right: 18px;' id='close'>취소</button>
			            <button type="button" id='deleteBtn'>확인</button>
			        </div>
	 	 		</div>
	 	 	</div>
	    </div>
    
    <script>
    	var user_id = '<%=id%>';
    	
 	  $(function() {
    	$('.topSubMenu').append(
    		"<h4 class='basketMenu'>마이페이지</h4>"		
    	);
	
	    	/* 위시리스트 목록 */
			if(user_id == "null") {
				alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
				location.href = '../login/login';
			} else{
				$.ajax({
					url : "../wishlists", // 컨트롤러 위치 
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        	},
					success : function(result){
						data = result.data;
						console.log(data);
						
						if(data.length == 0){
							$('.wishListItems').append(
								"<div class='noWish'>"
									+"<p>아직 찜해놓은 상품이 없습니다.</p>"
								+"</div>"
							)
						} else{
							wishlists();
						}
							wishCount();
					
						return false;
					},
						error : function(){
							alert("검색실패");
							return false;
						}
					})
				}
 	   	 })
 	    
 	    /* 구매하기 버튼 클릭시 페이지이동 */
 		$(document).on('click','.purchaseBtn',function(){
 			var product_id = $(this).attr('id');
 			
 			location.href='../menu/productInfo?product=' + product_id;
 		})
 		
 		$(document).on('click','.wishImg',function(){
 			var product_id = $(this).attr('id');
 			
 			location.href='../menu/productInfo?product=' + product_id;
 		})
 	</script>
    
 	<script>
 		var deleteId;
 		
 		$(document).on('click','.deleteShow',function(){
			$('.basketPop').addClass('show'); 	
			
			deleteId = $(this).attr('id');
 		})
 		
 		$(document).on('click','#deleteBtn',function(){
 			
 			$.ajax({
				 url : "../wishlists?product=" + deleteId, // 컨트롤러 위치
				 type : "DELETE",
				 beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
			     },
				dataType : 'JSON',
				success : function(result){
					
					console.log(result)
					
					if(result.message == 'Success'){

						$('#wishLists'+deleteId).remove();
						$('.basketPop').removeClass('show');
						wishCount();
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
 		})
 		
 		$(document).on('click','#close',function(){
 			$('.basketPop').removeClass('show');
 		})
 		
 		function wishlists(){
 			for(var i = 0; i < data.length; i++){
 				$('.wishListItems').append(
					"<div class='wishlistItem' id='wishLists" + data[i].product_id + "'>"
 						+ "<div class='wishImg' id='" + data[i].product_id + "'><img src='" + data[i].product_img_url + "' style='width: 148px;'></div>"
 						+"<div class='wishText'>"
 							+"<p class='itemName'>" + data[i].product_name + "</p>"
 							+"<div id='itemPrices" + i + "'>" 
 							
 							+"</div>"
 							+"<div id='item_sticker" + i + "'>"
 							
 							+"</div>"
 						+"</div>"
 						+"<div class='wishBtn'>"
 							+"<button type='button' class='deleteShow' id='" + data[i].product_id + "'>삭제하기</button>"
 							+"<button type='button' class='purchaseBtn' id = '" + data[i].product_id + "' style='border: 1px solid #727F8A; color: #727F8A;'>구매하기</button>"
 						+"</div>"
 					+"</div>"	
 				)
 				
 				if(data[i].dc_rate == null){
 					$('#itemPrices'+i).append(
						"<h5 class='itemPrice' style='padding-top: 46px;'>" + data[i].list_price.toLocaleString('en') + "원</h5>"	
 					)
 				} else{
 					$('#itemPrices'+i).append(
		 				"<p class='itemSales'><span class='listPrice'>" + data[i].list_price.toLocaleString('en') + "</span>원</p><span class='salePrice'><span id='salePercent'>" + data[i].dc_rate + "</span>%</span>"
						+"<p class='itemPrice' style='font-weight: bold;'><span id='SalePrice'>" + data[i].sale_price.toLocaleString('en') + "</span>원</p>"
 					)
 				}
 			}
 		}
 		
 		function wishCount(){
 			$('#wishCount').text($('.wishlistItem').length);
 		}
 		
 	</script>
</body>
</html>