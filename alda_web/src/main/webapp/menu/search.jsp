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
	.productSubDetail{
		display: grid;
		grid-template-columns: 20% 80%;
		display: none;
		margin: 0;
		padding: 10px 0;
	}
	.productSubDetailName{
		text-align: center;
		font-size: 16px;
		font-weight: bold;
	}
	.productSubNameDetail{
		width: 100%;
	}
	.productItemCss{
		box-sizing: border-box;
		color: #727F8A;
		text-decoration: underline;
	}
	.productSubCss{
		box-sizing: border-box;
		text-decoration: underline;
		color: #727F8A;
		font-weight: bold;
	}
	.productSubItem{
		font-size: 13px;
		display: flex;
		width: 150px;
		line-height: 34px;
		cursor: pointer;
		margin: 0;
		flex-wrap: wrap;
		align-items: center;
		justify-content: center;
	}
	#productSub{
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
	    justify-content: flex-start;
   		align-items: center;
	}
	 .pageNum.active{
		color: #070707;
		font-weight: 600;
		font-size: 18px;
		font-weight: bold;
	}
	
.pageNum {
	margin: 4px;
	padding: 0px 6px 2px 6px;
	cursor: pointer;
	background: white;
	color: #A2A2A2;
	font-size: 18px;
}

</style>
</head>
<body>
<% String searchText = request.getParameter("text"); %>
<%@include file="../header.jsp"%>
	   <div class='middleMenu'>
	   		<!-- <div class='keywords'>
		   		<p>추천키워드</p>
		   		<ul class='recommendKeyword'>
		   			<li><a href=''># 여름이였다</a></li>
		   			<li><a href=''># 홈카페</a></li>
		   			<li><a href=''># 홈시네마</a></li>
		   			<li><a href=''># 홈캠핑</a></li>
		   			<li><a href=''># 식물집사</a></li>
		   			<li><a href=''># 최애공간꾸미기</a></li>
		   		</ul>
	   		</div> -->
	   </div>
	<div class='recent'>
		<div class="recentProduct">
			<div class='recentTitle'>최근 본 상품</div>
			<div class="recentItem">
				<!-- 최근 본 상품들 이미지 -->
				<div class='recentImgs'>
					<!-- <img class='recentImg' src='../image/items/recent1.png'> -->
				</div>
				<!-- 최근 본 상품 페이징 -->
				<div class="recentNumber">
					<div class="paging">
						<div class="pagination inner" id='pagination' style='text-align: center;'>
						
						</div>
					</div>
					<!-- <img src='../image/icon/blackleft.png'>
					<p><span style='font-weight: bold;'>1</span>/2</p>
					<img src='../image/icon/blackRight.png'> -->
				</div>
			</div>
		</div>
	</div>
	
	<div class='middleContent'>
		<div class="searchArea">
			<div class='productArea'>
				<div class='productAreaName'>
					<p>카테고리별 상품</p>
				</div>
				<div class='productItems'>
					<ul class='CategoryList'>
						<!-- <li class = 'productCategory'>
							<div class='productItem'>
								<img src='../image/items/furniture.png'>
								<p>가구</p>
							</div>
						</li>-->
					</ul>
				</div>
			</div>
			
				<!-- 상품별 카테고리 1번째 서브 -->
		        <div class="productSub">
		            <div class="productSubName">
		                <p id='productSubTitle'></p>
		            </div>
		            <div class="productSubList">
		           		<ul id='productSub'>
		           			<!-- <li class='productSubItem'></li> -->
		           		</ul>
		               <!--<table>
		                   <tr id='productSub'>
		                       <!-- <td class='productSubItem'>가벽/파티션</td>
		                   </tr>
		               </table>-->
		            </div>
		        </div>
		        
		        <!-- 상품별 카테고리 2번째 서브 -->
		        <div class="productSubDetail">
		            <div class='productSubDetailName'>
		            	 <p></p>
		            </div>
		          <div class='productSubNameDetail'>
		            <ul id='subDetailProduct'>
		                <!-- <li>일반소파</li>-->
		             </ul>
		          </div>
		        </div>
    	
    		<!-- 공간별 상품 카테고리 -->
			<!-- <div class='productArea'>
				<div class='productAreaName'>
					<p>공간별 상품</p>
				</div>
				<div class='productItems'>
					<ul class='placeCategory'>
						<li>
							<div class='productItem'>
								<img src='../image/items/room1.png'>
								<p>원룸</p>
							</div>
						</li>
					</ul>
				</div>
			</div> -->
		</div>
	
		<div class="searchResult">
			<div class="searchCountTitle">
				<p class='resultText'><span id='resultCount'>0</span>개의 통합검색 결과가 있습니다.</p>
				<p class='storeNumber'>스토어 <span id='storeNum'>0</span></p>
			</div>
			<div class="searchItemsArea">
				<!--  <div class="searhResultItem">
					<div class="searchResultImg">
						<img class='roomItemImg' src='../image/items/search1.png'>
					</div>
					<p class='roomItemStore'>보니애가구</p>
					<p class='roomItemName'>프라제르 아쿠아텍스 4인용 소파(스툴증정)</p>
					<p class='searchDiscount'>74%<span>499,900</span></p>
					<p class='searchReviewCount'>리뷰 8,603</p>
					<div class='productInfo'>
						<div class='free'><p>무료배송</p></div>
						<div class='specialPrice'><p>특가</p></div>
						<div class='buyIn'><p>바이인</p></div>
					</div>
				</div>  -->
			</div>
		</div>
	</div>
		<%@include file="../footer.jsp"%>
		<script>
		var categoryId = "";
		var placeCategoryId = "";
		var subCategorydata;
		var text;
		var mediumCategoryId = "";
		var smallCategoryId = "";
		var placeId = "";
		var user_id = '<%=id%>';
		
			
		$(function(){
			
			$.ajax({
				url : "../category-lists", // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        },
				success : function(result){
					data = result.data;
					console.log(data);
					basicData = data;
					
					categoryProduct();
					/* placeCategory(); */
					
					return false;
				},
				error : function(){
					alert("검색실패");
					return false;
				}
			})
			
			if('<%=searchText%>' != "null"){
				$('.searchTxt').val('<%=searchText%>');
				searchProduct();
			}
			
			$('.searchBtn').attr('onclick', "searchProduct()");
			
			/* 최근검색목록 */
			$.ajax({
				url : "../recents", // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
	            xhr.setRequestHeader("user", user_id);
	        	},
				success : function(result){
					data = result.data;
					console.log(data);
					
					if(data.length == 0){
						$('.recent').css('display','none');
					} else{
						recentViewItem();
						page();
					}
					
					return false;
				},
				error : function(){
					alert("검색실패");
					return false;
				}
			})
		})
		</script>
		<script>
			/* 카테고리별 상품 목록 */
			
			// 지금은 color지만 나중에는 아이콘 경로로 변경해서 사용
			var category_icon = ["FAF8D6", "E9C04A", "CBA22C", "847C41", "D46529", "EEB38B", "F69E8A", "C54627", "8A4A41", 
				"7B5A45", "87B985", "379F48", "506C31", "263016", "452C17", "BA9387", "83646A", "53343A", "74225C", "442363"];
			
			function categoryProduct(){
				for(var i = 0; i < basicData.length; i++){
					//console.log('#' + category_icon[i]);
					$('.CategoryList').append(
						"<li class = 'productCategory'>"
							+"<div class='productItem CategoryProduct' id='" + basicData[i].category_id + "'>"
								+"<img style = 'background-color: #" + category_icon[i] + "'>"
								+"<p>" + basicData[i].category_name + "</p>"
							+"</div>"
						+"</li>"		
					)
				}
			}
			/* 카테고리별 상품 > 1번째 카테고리 */
	 		$(document).on('click','.CategoryProduct',function(){

				$('#productSubTitle').text($(this).text());
				categoryId = $(this).attr('id');
				
				if($('.productSub').css('display')=='none'){
					$('.productSub').css('display','grid');
				}  
				
				$('.CategoryProduct').removeClass('productItemCss');
				$(this).addClass('productItemCss');
				
				/* 서브 카테고리 가져오기 */
				$.ajax({
					url : "../category-lists", // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
		           		xhr.setRequestHeader("user", user_id);
		        	},
					success : function(result){
						data = result.data;
						for(i in data){
							if(categoryId == data[i].category_id){
								subCategorydata = data[i].medium_categories;	
								console.log(subCategorydata);
								subCategory();
							}
						}
						
						return false;
					},
					error : function(){
						alert("검색실패");
						return false;
					}
				})
				
				if(mediumCategoryId != "") {
					mediumCategoryId = "";	
				}
				
				if(smallCategoryId != "") {
					smallCategoryId = "";	
				}
				
				searchProduct();
				
				//1. 중간 카테고리 값 초기화
				//2. 하위 카테고리 값 초기화
				//3. 하위 카테고리 테그 숨기기
				
				$('#subDetailProduct *').remove();
				$('.productSubDetail').hide();
				
			})
			
			/* 카테고리별 상품 > 2번째 카테고리 */
			$(document).on('click','.productSubItem', function(){
				mediumCategoryId = $(this).attr('id');
				
				if($('.productSubDetail').css('display') =='none'){
					$('.productSubDetail').css('display','grid');
				}
				$('.productSubItem').removeClass('productSubCss');
				$(this).addClass('productSubCss');
				
				$.ajax({
					url : "../detail-category-lists?medium_category=" + mediumCategoryId, // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
		           		xhr.setRequestHeader("user", user_id);
		        	},
					success : function(result){
						data = result.data;
						console.log(data);
						detailData = data;
						
						subDetailCategory();
						
						return false;
					},
					error : function(){
						alert("검색실패");
						return false;
					}
				})
				
				//subDetailCategory($(this).index())
				
				searchProduct();
			})
			
			/* 상품 카테고리 2번째 카테고리 클릭 */
			$(document).on('click','.productSubDetail li',function(){
				smallCategoryId = $(this).attr('id');
				
				if($(this).css('font-weight') == '400'){
					$('.productSubDetail li').removeClass('productSubCss');
					$(this).addClass('productSubCss');
				} 
				
				searchProduct();
			})
			
			
			/* 공간별 상품  > 1번째 카테고리*/
			/* $(document).on('click','.CategoryPlace',function(){
				placeId = $(this).attr('id');
				
				/* if($('.placeSubArea').css('display')=='none'){
					$('.placeSubArea').css('display','grid');
				}   
				
				if($(this).hasClass('productItemCss')) {
					$(this).removeClass('productItemCss');
					placeCategoryId = "'";
				} else {
					$('.CategoryPlace').removeClass('productItemCss');
					$(this).addClass('productItemCss');
					
					$('#placeSubTitle').text($(this).text());
					placeCategoryId = $(this).attr('id');
				}
				
				searchProduct();
			}) */
			
			 /* 최근 검색 이미지 클릭시 */
			$(document).on('click','.recentImg',function(){
				var product_id = $(this).attr('id');
				
				location.href = 'productInfo?product=' + product_id;
			})
			
			/* 검색결과 이미지 클릭시 */
			$(document).on('click','.searhResultItem',function(){
				var productId = $(this).attr('id');
				
				location.href='productInfo?product=' + productId;
			})
			
			
	/* 	// dayBtn 클래스 누르면
		$(document).on('click', '.daysBtn', function() {
			// 클릭한거에 setDate 클래스를붙이고 나랑 같은 위치의 태그에 setDate를 지운다.
			$(this).addClass('setDate').siblings().removeClass('setDate');

		})
	
		$(document).on('click', '.setDate', function() {
			$(this).removeClass('setDate');
		}) */
			
			/* 공간별 상품 목록 */
			/* function placeCategory(){
				for(var i = 0; i < placeData.length; i++){
					$('.placeCategory').append(
						"<li>"
							+"<div class='productItem CategoryPlace' id='" + placeData[i].category_id + "'>"
								+"<img src='../image/items/room1.png'>"
								+"<p>" + placeData[i].category_name + "</p>"
							+"</div>"
						+"</li>"	
					)
				}
			} */
			/* 상품별 서브 카테고리 */
			function subCategory(){
				$('#productSub *').remove();
				for(var i = 0; i < subCategorydata.length; i++){
					$('#productSub').append(
						"<li class='productSubItem' id='" + subCategorydata[i].category_id + "'>" + subCategorydata[i].category_name + "</li>"		
					)
				}
			}
			
			function subDetailCategory(){
				$('#subDetailProduct *').remove();
				for(var i = 0; i < detailData.length; i++){
					$('#subDetailProduct').append(
							"<li id='" + detailData[i].category_id + "'>" + detailData[i].category_name + "</li>"	
					)
				}
			}
			
			/* 공간별 서브 카테고리 */
			function subPlaceCategory(){
				$('#placeSub *').remove();
				for(var i = 0; i < data.length; i++){
					$('#placeSub').append(
						"<li class='productSubItem' id='" + data[i].category_id + "'>" + data[i].category_name + "</li>"		
					)
				}
			}
			
			function subPlaceDetailCategory(){
				$('#subDetailplace *').remove();
				for(var i = 0; i < detailData.length; i++){
					$('#subDetailplace').append(
							"<li id='" + detailData[i].category_id + "'>" + detailData[i].category_name + "</li>"	
					)
				}
			}
			
			/* 검색결과 */
			function searchResult(){
				$('.searchItemsArea *').remove();
				
				for(var i = 0; i < data.length; i++){
					$('.searchItemsArea').append(
						"<div class='searhResultItem' id='" + data[i].product_id + "'>"
							+"<div class='searchResultImg'>"
								+"<img class='roomItemImg' src='" + data[i].product_img_url + "'>"
							+"</div>"
							+"<p class='roomItemName'>" + data[i].product_name + "</p>"
							+"<div id='itemPrices"+ i + "'>"

							+"</div>"
							+"<p class='searchReviewCount'>리뷰 " + data[i].review_num + "</p>"
							+"<div class='productInfo' id='productInfo" + i + "'>"
								
							+"</div>"
						+"</div>"		
					)
					
					/* 할인 %가 null이면 세일가, 퍼센트 없애고 정가만 보여주기 */
					if(!data[i].dc_rate){
						$('#itemPrices'+i).append(
							"<h5 class='itemPrice'>" + data[i].sale_price.toLocaleString('en') + "원</h5>"	
						)
					} else {
						$('#itemPrices'+i).append(
							//"<p class='itemSales'>" + data[i].list_price.toLocaleString('en') + "원 </p><span class='salePrice'>" + data[i].dc_rate + "%</span>"
							"<h5 class='itemPrice'>" + data[i].sale_price.toLocaleString('en') + "원</h5>"	
						)
					}
					/* 무료배송일때 */
					if(data[i].delivery_price == false){
						$('#productInfo'+i).append(
							"<div class='free'><p>무료배송</p></div>"
						)
					}
					/* 특가일때 */
					if(data[i].bargain_price == true){
						$('#productInfo'+i).append(
							"<div class='specialPrice'><p>특가</p></div>"
						)
					}
					/* 바이인호텔에 있는 상품 */
					if(data[i].is_buyinhotel == true){
						$('#productInfo'+i).append(
							"<div class='buyIn'><p>바이인</p></div>"
						)
					}
					
				}
			}
			
			/* 검색결과 ajax */
			function searchProduct(){
				
				text = $('.searchTxt').val();
				//console.log(text);
				/* if(text == "" && categoryId == "" && placeCategoryId == "") {
					alert("검색어를 입력해 주세요.")
				} else { */
					var url;
				
					if(text != ""){
						url = "../products?thumb=true&text="+ text;
						
					} else {
						url = "../products?thumb=false&text="+ text;
						
						if(categoryId != "") {
							url +=  "&large_category=" + categoryId;	
						}
						
						if(mediumCategoryId != ""){
							url +=  "&medium_category=" + mediumCategoryId;
						}
						
						if(smallCategoryId != "") {
							url += "&small_category=" + smallCategoryId;
						}
					}
					
					//console.log(url);
					
					$.ajax({
						url : url, // 컨트롤러 위치
						type : "GET",
						dataType : 'JSON',
						beforeSend: function (xhr) {
			           		xhr.setRequestHeader("user", user_id);
			        	},
						success : function(result){
							data = result.data;
							console.log(data);
								if(text != ""){
									$('.searchArea').css("display","none");	
								} else{
									$('.searchArea').css("display","block");
								}							
							
							if(data.length == ""){
								$('.searchItemsArea *').remove();
								
								$('.searchItemsArea').append(
									"<div>"
										+"<p style='text-align: center; margin-top: 60px; font-size: 18px;'>검색결과가 없습니다.</p>"
									+"</div>"		
								)
							} else{
								searchResult();
							}
							
							$('#resultCount').text(data.length);
							/* location.href='../menu/search?large=' + categoryId; */
							
							return false;
						},
							error : function(){
								alert("검색실패");
								return false;
							}
						})
					}
				
			
			/* 최근본상품 사이드바 */
			function recentViewItem(){
				for(var i = 0; i < data.length; i++){
					$('.recentImgs').append(
						"<img class='recentImg' id='" + data[i].product_id + "' src='" + data[i].product_img_url + "'>"		
					)
				}
			}
			
		</script>
		<script>
		 function page() {	
			// ****더 중요한점 테이블 이름 적어줘야함!!
		    $('div.recentImgs').each(function () {
		        var pagesu = 5;  //페이지 번호 갯수
		        var currentPage = 0;
		        var numPerPage = 5;  //목록의 수
		        var $div = $(this);
		        var pagination = $("#pagination");

		        //length로 원래 리스트의 전체길이구함
		        var numRows = $div.find('.recentImg').length;

		        //Math.ceil를 이용하여 반올림
		        var numPages = Math.ceil(numRows / numPerPage);

		        //리스트가 없으면 종료
		        if (numPages == 0) return;

		        //pager라는 클래스의 div엘리먼트 작성
		        var $pager = $('<div class="pager"></div>');
		        var nowp = currentPage;
		        var endp = nowp + 5;

		        //페이지를 클릭하면 다시 셋팅
		        $div.bind('repaginate', function () {

		        //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
		            $div.find('.recentImg').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
		            $("#pagination").html("");
		            if (numPages > 1) {     // 한페이지 이상이면
		                if (currentPage < 5 && numPages - currentPage >= 5) {   // 현재 5p 이하이면
		                    nowp = 0;     // 1부터 
		                    endp = pagesu;    // 10까지
		                } else {
		                    nowp = currentPage - 5;  // 6넘어가면 2부터 찍고
		                    endp = nowp + pagesu;   // 10까지
		                    pi = 1;
		                }
		                if (numPages < endp) {   // 10페이지가 안되면
		                    endp = numPages;   // 마지막페이지를 갯수 만큼
		                    nowp = numPages - pagesu;  // 시작페이지를   갯수 -10
		                }
		                if (nowp < 1) {     // 시작이 음수 or 0 이면
		                    nowp = 0;     // 1페이지부터 시작
		                }
		            } else {       // 한페이지 이하이면
		                nowp = 0;      // 한번만 페이징 생성
		                endp = numPages;
		            }
		            // [처음]
		            /* $('<span class="pageNum first">《</span>').bind('click', { newPage: page }, function (event) {
		                currentPage = 0;
		                $div.trigger('repaginate');
		                $($(".pageNum")[2]).addClass('active').siblings().removeClass('active');
		            }).appendTo(pagination).addClass('clickable'); */
		            // [이전]
		            $('<span class="pageNum back"><img src="../image/icon/blackleft.png"></span>').bind('click', { newPage: page }, function (event) {
		                if (currentPage == 0) return;
		                currentPage = currentPage - 1;
		                $div.trigger('repaginate');
		                $($(".pageNum")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
		            }).appendTo(pagination).addClass('clickable');
		            // [1,2,3,4,5,6,7,8]
		            for (var page = nowp; page < endp; page++) {
		                $('<span class="pageNum"></span>').text((page + 1)).bind('click', { newPage: page }, function (event) {
		                	// 여기가 data인데 우리는 항상 data로 data를 정의하기에 그냥 갖다 쓰면 됨!
		                    currentPage = event.data['newPage'];
		                    $div.trigger('repaginate');
		                    $($(".pageNum")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
		                }).appendTo(pagination).addClass('clickable');
		            }

		            // [다음]
		            $('<span class="pageNum next"><img src="../image/icon/blackRight.png"></span>').bind('click', { newPage: page }, function (event) {
		                if (currentPage == numPages - 1) return;
		                currentPage = currentPage + 1;
		                $div.trigger('repaginate');
		                $($(".pageNum")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
		            }).appendTo(pagination).addClass('clickable');

		            // [끝]
		           /*  $('<span class="pageNum last">》</span>').bind('click', { newPage: page }, function (event) {
		                currentPage = numPages - 1;
		                $div.trigger('repaginate');
		                $($(".pageNum")[endp - nowp + 1]).addClass('active').siblings().removeClass('active');
		            }).appendTo(pagination).addClass('clickable'); */

		            $($(".pageNum")[2]).addClass('active');
		            
		            $('.noticeAnswer').css('display', 'none');
		        });

			        $pager.insertAfter($div).find('span.pageNum:first').next().next().addClass('active');
			        $pager.appendTo(pagination);
			        $div.trigger('repaginate');
			    });
			}
		</script>
</body>
</html>