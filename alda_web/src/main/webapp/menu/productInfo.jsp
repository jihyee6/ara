<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="체험 기반 종합 쇼핑몰 ARA입니다.">
<meta property="og:type" content="website"> 
<meta property="og:title" id='ogTitle' content="알아">
<meta property="og:url" id='ogURL' content="http://www.aldainc.co.kr/">
<meta name="robots" content=“index”>
<meta name="robots" content="follow">
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>ARA</title>
<style>
.infoBarCss{
	border-bottom: 3px solid #4B5D68;
	color: #4B5D68 !important;
	padding-bottom: 8px;
}
.mapTitle{
	font-family: NotoSansR;
	line-height: 34px;
	
}
.mapName{
	font-size: 24px;
	color: #242424;
}
.mapExplain{
	font-size: 16px;
	color: #707070;
}
.locationSign{
	display: flex;
	font-size: 14px;
	font-family: NotoSansR;
	width: 202px;
	margin-right: 0px;
}
.locationMap{
	width: 100%;
	height: 508px;
	border: 1px solid black;
	margin: 12px auto;
}
.mapContent{
	clear: right;
}
.showstep1{
	max-height: 550px;
	overflow: hidden;
}
.detailContent{
	width: 100%;
}
.hide{
	display: none;
}
.smallCss{
	outline: 3px solid #727F8A;
}
.productImgs{
	margin: 10px auto;
	width: 476px;
}
.detailViewButton{
	width: 100%;
	height: 150px;
	background-color: white;
	text-align: center;
	position: relative;
}
.btn_open:before{
    content: '';
    position: absolute;
    top: -106px;
    left: 0;
    display: block;
    width: 100%;
    height: 106px;
    background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0), rgba(255, 255, 255, 0.8) 66%, rgba(255, 255, 255, 0.94) 83%, rgba(255, 255, 255, 0.98) 91%, #ffffff);
}
 .pageNum.active, .pageNum2.active{
	color: #070707;
	font-weight: 600;
	font-size: 18px;
	font-weight: bold;
}
	
.pageNum, .pageNum2 {
	margin: 4px;
	padding: 0px 6px 2px 6px;
	cursor: pointer;
	background: white;
	color: #A2A2A2;
	font-size: 18px;
	display: flex;
	align-items: center;
}
.magnifietImg{
	position: absolute;
	transform: translate(434px, -43px);
	cursor: pointer;
}
.smallCount{
	width: 57px;
	height: 32px;
	background-color: rgba( 255, 255, 255, 0.5 );
	position: absolute;
	transform: translate(7px, -43px);
	text-align: center;
	line-height: 32px;
	font-size: 19px;
	color: #707070;
	font-family: NanumSquare_ac;
}
.bollom{
	width: 256px;
	height: 36px;
	margin-left: 302px;
	margin-top: 18px;
}
#share{
	position: relative;
}
.urlInput{
	width: 176px;
	height: 26px;
	border: 1px solid #CCCCCC;
	font-size: 12px;
	font-family: NotoSans;
	color: #000000;
}
.urlBtn{
	width: 64px;
	height: 30px;
	background-color: white;
	border: 1px solid #707070;
	font-size: 12px;
	font-family: NotoSans;
	color: #000000;
}
/* 감싸는 div */
 .wrap {
    position: relative;
    width: 476px;
    height: 476px;
    margin: 0 auto;
} 
/* 확대될 타겟이미지*/
.target {
    display: block;
    width: 100%;
}
/* 돋보기 */
.magnifier {
    width: 300px;
    height: 300px;
    position: absolute;
    /* border-radius: 100%; */
    box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.85), 0 0 3px 3px rgba(0, 0, 0, 0.25);
    z-index: 1000;
    display: none;
}
#reviewNum{
	float: none;
}
#deliveryFee{
	font-family: NotoSans;
	font-size: 16px;
	margin: 6px;
}
.reviewGoods p{
	width: 92px;
	display: flex;
	align-items: center;
	align-content: center;
	justify-content: center;
	margin-right: 4px;
}
.reviewGood{
	display: flex;
	align-items: center;
}
.deleteBtn{
	cursor: pointer;
}
#wishBtn{
	cursor: pointer;
	width: 30px; 
	height: 30px;
}
.likeBtn{
	cursor: pointer;
}

</style>
</head>
<body>
<% String product_id = request.getParameter("product"); %>
<% String name = (String) session.getAttribute("name");%>
<%@include file="../header_noTop.jsp"%>
   <!-- <div class='topSubs'>
	   		<div class='topMenus'>
	   			<div class=topSubMenu>
			   		<p class='productLocation'>가구 > 소파 > 일반소파</p>
	   			</div>
		   		<div class='memberInfo2'>
	   			<p style='float: left; height: 30px;'>000님 | </p>
	   			<p>로그아웃</p>
	   			<p onclick='location.href="../login/login"'>로그인</p>
	   		</div>
	   </div>
   </div> -->
   
	<div class='buyinAlarm'>
		<div class='alarmSide'>
			<img src='../image/icon/buyinSide.png' style='width: 200px;'>
		</div>
	</div>
	<main class='content'>
		<div class='productExplain'>
				<!-- 제품 사진들 -->
				<div class="productMainImg">
					<div class='wrap'>
						<img class='blgProductImg target' id='big_photo' data-zoom='2'>
					</div>
					<img class='magnifietImg' src="../image/icon/Magnifier.png">
					<!-- <div class='smallCount'><p><span>1</span> / <span>4</span></p></div> -->
					<!-- 제품 대표 사진 밑에 사진 선택 -->
					<div class='productImgs'>
						<!-- <img class='productSmallImg' id='productImg1' src='../image/items/product1.png'>
						 id='defaultOpen'
						<img class='productSmallImg' id='productImg2' src='../image/items/product2.png'>
						<img class='productSmallImg' id='productImg3' src='../image/items/product3.png'> -->
					</div>
				</div>
				
				<!-- 제품 설명 section -->
				<div class='productExplainInfo'>
					<div class='mainExplainText'>
						<p class='productStore'></p>
						<h4 class='productInfoName'></h4>
						<p class='productInfoDiscount'><span id='discountPercent'></span> <span id='listPrice'></span></p>
						<h4 class='productInfoPrice'>0</h4>
							<div class='productInfo' style='height: 20px; line-height: 18px;'>
								<!-- <div class='free'><p>무료배송</p></div>
								<div class='specialPrice'><p>특가</p></div>
								<div class='buyIn'><p>바이인</p></div> -->
							</div>
						<p class='productInfoReviews'>리뷰 <span id='reviewNum'></span> <span><img src="../image/icon/Sharing.png" id='share'><img style='margin-left: 18px;' class='present' src="../image/icon/present.png"></span></p>
							<!-- 공유하기 말풍선  -->
							<div class='bollom'>
								<input class='urlInput' type='text' value="" name='urlValue'>
								<button class='urlBtn' type='button' onclick="clip();">url 복사</button>	
 							</div>
						</div>
							
				<div class='productSelectOptions'>
					<!-- <div class="hashTag">
						<ul>
							<li># 소파</li>
							<li># 거실가구</li>
							<li># 인테리어</li>
							<li># 4인용소파</li>
						</ul>
						<p class='benefit'><span>혜택</span> 1,497P 적립 (WELCOME 0.3% 적용)</p>
					</div> -->
					<p id='deliveryFee'></p>
				</div>
					<!-- 제품 옵션 선택 select -->
				<div id = 'optionList' style = 'margin-top: 16px;'>
					<div id='options'></div>
					<!-- <select class = 'optionDetail'>
						<option value = '' disabled selected style='font-weight: bold;' id='optionSelectName'>선택</option>
						<option value = ''>스카이블루 (남은수량: 100개)</option>
						<option value = ''>블랙 (남은수량: 100개)</option>
						<option value = ''>화이트 (남은수량: 100개)</option>
					</select> -->
						<!-- 제품 옵션 사이즈 선택 -->
					<div id='selectList'>
						<select class = 'optionDetail optionSelectDetail'>
							<option selected disabled>추가 상품 선택</option>
						</select> 
					</div>
				</div>
				<div class='selectListProduct'>
					<!-- <div class = 'selectOptionList' style = 'margin-top: 16px;'>
						<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600;'>
							<div style='text-align: left; width: 100%;' class='selectProduct'>프라제르 아쿠아텍스 4인용 소파(스툴증정) 2colors</div>
							<div><img src='../image/icon/delete.png'></div>
						</div>
						<div style = 'height: calc(100%/3); font-size: 14px; text-align: left; width: 100%; font-weight: bold; color: #707070;'>컬러 : 스카이블루 | 사이즈 : 정면-270cm*88cm, 옆-78.1cm</div>
						<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600;'>
							<div style='display: flex;'>
								<input type = 'button' value = '-' onclick='minusCnt(this)' class = 'cntBtn'>
								<input type = 'text' value = '1' class = 'cntBtn' style = 'margin-left: -5px;'>
								<div class='cntBtn' style='line-height: 24px;'>0</div>
								<input type = 'button' value = '+' onclick='plusCnt(this)' class = 'cntBtn'>
							</div>
							<div style='width: 100%; text-align: right;'>499,000원</div>
						</div>
					</div> -->
				</div>
				<div class = 'totalGoods'>
					<div style='text-align: left; width: 100%;'>상품 <span id='productCount'>0</span>개</div>
					<div style='text-align: right; width: 100%;'><span id='totalProductPrice'>0</span>원</div>
				</div>
				<div style = 'display: flex; width:100%; align-items: center; margin-top: 16px;'>
					<div style = 'width: 15%; text-align: center; line-height: 16px;'>
						<div class='wishImg'>
							<!-- <img src = '../image/icon/stars.png' style = 'width: 30px; height: 30px;'> -->
						</div>
						<div id='wishNum' style='font-size: 12px; font-weight: bold; color: #4C4C4C;'>0</div>
					</div>
					<div style = 'width: 85%; text-align: end;'>
						<input type = 'button' value = '장바구니 담기' class = 'bucket' id='Bshow' idx=''>
						<input type = 'button' value = '구매하기' class = 'purchase'>
					</div>
				</div>
				<div style = 'margin-top: 16px;'>
					<input type = 'button' id='Mshow' value = '내주변둘러보기' class = 'myside'>
				</div>
			</div>
		</div>
			<div class='productDetailInformation'>
				<!-- 상세보기, 리뷰, 문의 탭 -->
				<div class='infoBar'>
					<ul>
						<li><a class='infoBarA scrollLocation location_detail' onclick = "moveLocation('detail')">상세</a></li>
						<li><a class='infoBarA scrollLocation location_review' onclick = "moveLocation('review')">리뷰</a></li>
						<!-- <li><a class='infoBarA scrollLocation location_ask' onclick = "moveLocation('ask')">문의</a></li> -->
					</ul>
				</div>
				
				<!-- 상세보기 section -->
				<div class='detailInfoImg contents showstep1' id='detail'>
					<!-- <img class='detailContent' src="../image/detailimg.png"> -->
				</div>
				<div class='detailViewButton'>
					<button type='button' class='btn_open'>상세정보 더보기<img style='margin-left: 14px;' src='../image/icon/downPass.png'></button>
					<button type='button' class='btn_close hide'>상세정보 접기<img style='margin-left: 14px;' src='../image/icon/upPass.png'></button>
				</div>
				<div class='infoTable'>
					<table class='productInfoTable'>
						<!-- <tr>
							<td>품명</td>
							<td>프라제르 생활방수 아쿠아텍스 4인소파 + 스툴</td>
						</tr> -->
					</table>
				</div>
				
				<!-- 리뷰 section -->
				<div class='infoReview contents' id='review'>
					<div class='infoReviewCount'>
						<p>리뷰<span style='color: #727F8A; margin-left: 12px;' id='productReview'>0</span></p>
					</div>
					<!-- 리뷰 사진들 -->
					<div class='infoReviewImgs'>
						<!-- <img src='../image/items/infoItems.png' class='photo_reviews'>
						<img src='../image/items/infoItems.png'>
						<img src='../image/items/infoItems.png'>
						<img src='../image/items/infoItems.png'>
						<img src='../image/items/infoItems.png'>
						<img src='../image/items/infoItems.png'> -->
						
						<!-- 더보기 이미지 -->
						<div class='more' id='Ashow'><p>더보기</p></div>
					</div>
					
					<div class="infoReviewTexts">
					<!-- 작성한 리뷰들 -->
						<div class='reviewTextArea'>
							<!-- <div class='reviewText'>
								<div class='reviewer'>
									<p class='reviewerName'>000님</p>
									<p class='reviewDate'>2021.08.30</p>
								</div>
								<div class='reviewGoods'>
									<p>좋아요 <span>368</span><img style='margin-left: 6px;' src='../image/icon/good.png'></p>
								</div>
								<div class='memberReview'>
									<p>딱딱한 느낌 좋아해서 후기 딱딱하다는건 알았지만 앉아있는부분이 심각하게 작아요 
									여잔데 누어있기 좀 불편 뒤척 거릴수 없음 생각보다 전체적인 소파사이즈가 작아요 
									그래도 쿠션감은 생각했던게 맞음</p>
								</div>
							</div>  -->
							<!-- 작성한 리뷰들 -->
							
						</div>
						<!-- 리뷰 페이징 -->
						<div class='pageBtn'>
							<div class="paging">
								<div class="pagination inner" id='pagination' style='text-align: center; display: flex; justify-content: center; align-content: center;'>
								
								</div>
							</div>
						</div>
						
						<!-- 문의하기 section-->
						<!-- <div class='ask contents' style='margin-top: 56px;' id='ask'>
							<div class='askTitle'>
								<p>문의<span>문의하기</span></p>
							</div>
							문의내용
							<div class='askText'>
								<div class='askContent'> 
									<p class='askName' style='margin: 16px auto;'>000님</p>
									<p class='inquiries'>혹시 주문취소는 가능할까요?</p>
									문의 답변
									<div class='seller'>
										<p class='sellerName'>판매자 답변</p>
										<p class='sellerAnswer'>주문취소 가능기간은<br> 배송전:주문취소가능<br> 배송후: 배송받은 일로부터 2주(포장을 뜯지 않았을시)<br> 위 사항대로 처리 가능하십니다.<br>감사합니다.</p>
									</div>
								</div>
								비밀글 문의
								<div class='askContent'> 
									<p class='askName' style='margin: 16px auto;'>000님</p>
									<p><img style='margin-right: 4px;' src='../image/icon/lock.png'> 비밀글입니다.</p>
								</div>
							</div>
							문의 페이징
							<div class='pageBtn'>
								<div class="paging">
									<div class="pagination2 inner" id='pagination2' style='text-align: center;'>
								
									</div>
							</div>
						</div>
					</div> -->
				</div>
			</div>
		</div>
	</main>
 	<%@include file="../footer.jsp"%>
 	
 	<!-- 장바구니 팝업 -->
 	 <div class="basketPop">
 	 	<div class='window'>
 	 		<div class='popup'>
	 	 		<img style='margin: 20px auto;' src="../image/icon/basketMessage.png">
			        <p class="basketMessage">장바구니에 담았습니다.</p>
			        <div class="basketPopBtn">
			            <button type="button" onclick='location.href="basket"'>장바구니 가기</button>
			            <button type="button" id='close'>쇼핑 계속하기</button>
			        </div>
	 	 		</div>
	 	 	</div>
	    </div>
   <!-- 더보기 클릭 후 사진 모음 팝업 -->
   <div class='moreView'>
        <div class="window">
            <div class="popup" style="width: 836px; height: 728px;">
                <div class='moreViewContent'>
                    <img id='outclose' src="../image/icon/whiteDelete.png">
                    <div class='moreViewTitle'>
                        <p>포토리뷰</p>
                    </div>
                    <div class='moreViewPhotos'>
                       	<!-- <img id= 'Rshow' src='../image/items/infoItems.png'> -->
                    </div>
                </div>
	        </div>
	    </div>
	</div>
 <!-- 사진 리뷰 상세보기 팝업 -->
    <div class='moreViewReview'>
        <div class="window">
            <div class="popup" style="width: 836px;">
                <div class='moreViewReviewContent'>
                    <div class='moreViewTitle'>
                        <p>포토리뷰<img style='float: right;' id='close1' src="../image/icon/blackDelete.png"></p>
                    </div>
                    <div class='moreViewReviews'>
                        <div class='bigMoreImg'>
                            <img id='popBigImg' src="../image/items/moreImg.png" style='width: 394px;'>
                        </div>
                        <div class='moreReviewText'>
								<p class='reviewerName' id='pop_writer_name'></p>
								<p class='reviewDate'></p>
								<p class='reviewGood'><span>좋아요 </span><span id='pop_like_num'></span><span class='likeIcon' id='is_liked'><img id='pop_like_photo_id' class='poplikeBtn' style='margin-left: 6px; width: 26px;' src='../image/icon/good.png'></span></p>
							<div class='moreReview'>
								<p id='popReviewText'></p>
							</div>
                        </div>
                    </div>
                </div>
	        </div>
	    </div>
	</div>
	<!-- 내주변 둘러보기 지도 팝업 -->
	<div class='map'>
	   <div class="window">
            <div class="popup" style="width: 1000px; height: 631px;">
                <div class='mapContent'>
                	<img id='close6' src="../image/icon/whiteDelete.png">
                    <div class='mapTitle'>
                        <p class='mapName'>내 주변 둘러보기</p>
                        <p class='mapExplain'>선택하신 상품의 체험가능 지점입니다.</p>
                    </div>
                    <div class='mapContent'>
                        <div class='locationSign'>
                        	<p style='color: #8996A0;'><img src='../image/icon/sign1.png'> HOTEL </p>
                        	<p style='color: #DF8927;'><img src='../image/icon/sign2.png'> CAFE </p>
                        	<p style='color: #44AB6D;'><img src='../image/icon/sign3.png'> 음식점 </p>
                        </div>
                    	<div class='locationMap'>
                    		
                    	</div>
                    </div>
                </div>
	        </div>
	    </div>
	</div>
    
    <script>
    var productDeliveryPrice;
	var product_id = '<%=product_id%>';
	var user_id = '<%=id%>';
	var optionLevels;
	var firstName;
   	var secondName;
   	var noOptionLevel;
   	var productOptionId;
   	var optionListId;
   	var SelectOptionPrice;
   	var selectProductName;
   	var optionName;
   	var optionPrice;
   	var productId;
   	var firstOptionLevel;
   	var secondOptionLevel;
   	var second_opionId;
   	var secondOptionPrice;
   	var noOption;
   	var noOptionId;
    
    	$(function(){
 			
			$.ajax({
				url : "../product-detail?product=" + product_id, // 컨트롤러 위치 
				type : "GET",
				beforeSend: function (xhr) {
		             xhr.setRequestHeader("user", user_id);
    			 },
				dataType : 'JSON',
				async: false,
				success : function(result){ 
						
					data = result.data;
					console.log(data);
					
					categoryData = data.categories;
					optionData = data.options;
					selectData = data.boolean_options;
					detailData = data.detail_img_list;
					infoData = data.information.product_announce;
					optionLevels = optionData[0].option_level;
					reviewData = data.reviews;
					
					$('.productStore').text(data.company_name);
					$('.productInfoName').text(data.product_name);
					$('.productInfoName').text(data.product_name);
					
					document.getElementById('ogTitle').setAttribute('content',data.company_name + " | " + data.product_name);
					document.getElementById('ogURL').setAttribute('content',"http://www.aldainc.co.kr/menu/productInfo?product=" + data.product_id);
					
					if(data.dc_rate == null){
						$('.productInfoPrice').text(data.list_price.toLocaleString('en'));
					} else{
						$('#discountPercent').text(data.dc_rate + "%");
						$('#listPrice').text(data.list_price.toLocaleString('en'));
						$('.productInfoPrice').text(data.sale_price.toLocaleString('en'));
					}
					
					if(data.delivery_price == true){
						$('#deliveryFee').text("배송비 " + data.delivery_money.toLocaleString('en') + "원");
						productDeliveryPrice = data.delivery_money;	
					} else{
						$('#deliveryFee').text("무료배송");
						productDeliveryPrice = 0;
					}
					
					/* 리뷰 갯수 넣기 */
		 			$('#productReview').text(reviewData.length.toLocaleString('en'));
					$('#reviewNum').text(data.review_num.toLocaleString('en'));
					
					//$('#wishNum').text(data.wish_num.toLocaleString('en'));
					
					productInfo();
					categories();
					options();
					selectOptions();
					productImgs();
					DetailImgs();
					productInfoTable();
					wishlist();
					reviews();
					moreReviewImgs();
					
					page();
					questionPage();
					return false;
				 },
				error : function(){
					alert("검색실패");
					return false;
				}
			})
			
			
    	})
    	
    	function categories(){
    		$('.topSubMenu').append(
  	    		"<p class='productLocation'>" + categoryData.large.category_name + " > " + categoryData.medium.category_name + " > " + categoryData.small.category_name + "</p>"		
    	    );
    	}
    	
    	function options(){
    		productId = data.product_id;
    		
    		if(data.dc_rate == null){
				optionPrice = data.list_price;
			} else{
				optionPrice = data.sale_price;
			}
    		
    		selectProductName = data.product_name;
    		
    		for(var i = 0; i < optionData.length; i++){

    			if(optionData[i].option_level != 0){
					$('#options').append(
						"<select class = 'optionDetail option_list" + i + " optionListId' idx='" + optionData[i].option_level + "' id='" + optionData[i].option_id + "'>"
							+ "<option value = '' disabled selected class='optionName" + i + "'>" + optionData[i].option_name + "</option>"
						+"</select>"	
					)
					
					optionName = $('.optionName'+i).text();
					firstName = $('.optionName0').text();
					secondName = $('.optionName1').text();
					productOptionId = $('.option_list'+i).attr('id');
					firstOptionLevel = $('.option_list0').attr('idx');
					secondOptionLevel = $('.option_list1').attr('idx');
					second_opionId = $('.option_list1').attr('id');
					
			} else{
				$('#options').css('display','none');
				
				if(selectData.length == 0){
					$('#selectList').css('display','none');
				}
				
				 $('.selectListProduct').append(
					"<div class = 'selectOptionList noOptionList basicOpt optionListId' style = 'margin-top: 16px;' id='" + optionData[0].option_id + "' idx='" + optionData[0].option_level + "'>"
						+"<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600;'>"
							+"<div style='text-align: left; width: 100%;' class='selectProduct'>"
								+"<p class='product_name" + i + "'></p>"
								+"<p>(재고 : <span class='stock" + i + "'></span>)</p>"
							+"</div>"
						+"</div>"
						+"<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600; margin-top: 16px;'>"
							+"<div style='display: flex;' class='optionCount' id='" + optionData[0].option_id + "'>"
								+"<input type = 'button' value = '-' onclick='minusCnt(this)' class = 'cntBtn'>"
								+"<div class='cntBtn productCnt' style='line-height: 24px;' id='result" + optionData[0].option_id + "'>1</div>"
								+"<input type = 'button' value = '+' onclick='plusCnt(this)' class = 'cntBtn'>"
							+"</div>"
							+"<div style='width: 100%; text-align: right;' class='productTotalPrice" + optionData[0].option_id + " totalPriceProduct totalPriceProduct" + i + "' id='optionPriceId" + optionData[0].option_id + "' cost=''> </div>"
						+"</div>"
					+"</div>"							
				)
			}
    			optionListId = $('.optionListId').attr('id');
    			noOption = $('.noOptionList').attr('idx');
   		}
    		
    		// 옵션이 없을때 과정 추가 -> id를 option-detail-id로 하기
    		if($('.optionListId').length < 2){
				/* 옵션이 1개일때 api */
				$.ajax({
					url : "../option-detail-list?option_count=1&option_id=" + optionListId , // 컨트롤러 위치 
					type : "GET",
					dataType : 'JSON',
					success : function(result){ 
							
						data = result.data;
						console.log(data);
						
						if(noOption == 0){
							noOptionId = data[0].option_detail_id;
							
							$('.noOptionList').attr('id', noOptionId);
							$('.optionCount').attr('id', noOptionId);
							$('.productCnt').attr('id', "result"+ noOptionId );
							$('.totalPriceProduct0').attr('class', 'productTotalPrice'+ noOptionId + ' totalPriceProduct totalPriceProduct0');
							$('.totalPriceProduct').attr('id',"optionPriceId"+ noOptionId);
						}
						
						productBox();
						optionList();
						
						return false;
					 },
					error : function(){
						alert("검색실패");
						return false;
					}
				})
		
				$('.option_list0').on('change',function(){
					addOptionBox();
					$('.option_list0 option:disabled').prop('selected', true);
				})
				
			} else if($('.optionListId').length == 2){
				if(firstOptionLevel == '1'){
					$.ajax({
						url : "../option-detail-list?option_count=2&option_id=" + optionListId , // 컨트롤러 위치 
						type : "GET",
						dataType : 'JSON',
						success : function(result){ 
								
							data = result.data;
							console.log(data);
							
							optionList();
							
							return false;
						 },
						error : function(){
							alert("검색실패");
							return false;
						}
					})
				}
				
				$('.option_list0').on('change',function(){
					var first_optionId = $('.option_list0 option:selected').attr('id');
					
					$.ajax({
						url : "../option-detail-list?option_detail_id=" + first_optionId + "&option_count=2&option_id="+ second_opionId, // 컨트롤러 위치
						type : "GET",
						dataType : 'JSON',
						success : function(result){ 
								
							data = result.data;
							console.log(data);
							
							secondOptionList();
							return false;
						 },
						error : function(){
							alert("검색실패");
							return false;
						}
					})
				})
				
				$('.option_list1').on('change',function(){
					addTwoOpitons();
					$('.option_list1 option:disabled').prop('selected', true);
				})
			}
		}
    	
    	function productBox(){
    		for(var i = 0; i < data.length; i++){
    			$('.product_name'+i).text(data[i].option_name);
				$('.totalPriceProduct'+i).text(parseInt(data[i].option_price).toLocaleString('en') + "원");
				$('.totalPriceProduct'+i).attr('cost', data[i].option_price);
				$('.stock'+i).text(data[i].option_stock.toLocaleString('en') + "개");
			}
    		AllProductPrice();
    	}
    	
    	function optionList(){
    		for(var i = 0; i < data.length; i++){
				$('.option_list0').append(
					"<option value = '" + data[i].option_name + "' id='" + data[i].option_detail_id + "' cost='" + data[i].option_price + "' stock='" + data[i].option_stock + "' class='productOptionSelect" + i +"'>" + data[i].option_name + "(재고 : " + data[i].option_stock  + ")</option>"	
				)
				var optionStock = $('.productOptionSelect'+i).attr('stock');
				
				/* 옵션의 재고가 0일때 option 비활성화 */
				if(optionStock == 0){
					$('.productOptionSelect'+i).attr('disabled', true);
				}
			}
    	}
    	
    	function secondOptionList(){
    		for(var i = 0; i < data.length; i++){
				$('.option_list1').append(
					"<option value = '" + data[i].option_name + "' id='" + data[i].option_detail_id + "' cost='" + data[i].option_price + "' stock='" + data[i].option_stock + "' class='productOptionSecond" + i +"'>" + data[i].option_name + "(재고 : " + data[i].option_stock  + ")</option>"	
				)
				var optionStock = $('.productOptionSecond'+i).attr('stock');
				secondOptionPrice = $('.productOptionSecond'+i).attr('cost');
				
				/* 옵션의 재고가 0일때 option 비활성화 */
				if(optionStock == 0){
					$('.productOptionSecond'+i).attr('disabled', true);
				}
			}
    	}
    	
    	function selectOptions(){
   			if(selectData.length != 0){
	    		for(var i = 0; i < selectData.length; i++){
	    			$('.optionSelectDetail').append(
	    				"<option value = '" + selectData[i].option_price + "' id='" + selectData[i].option_detail_id + "' cost='" + selectData[i].option_price + "' name='" + selectData[i].option_name + "'>"
	    					+ selectData[i].option_name + " ( +" + selectData[i].option_price.toLocaleString('en') + ")"
	    				+"</option>"
	    				)
    				}
	   			} else if(selectData.length == 0){
    				$('#selectList').css('display','none');
	    		}
    		}
        	
    	var duplicate_option_check = [];
    	var optionId;
    	
    	function addOptionBox(){
    		var state = $('.optionDetail option:selected').val();
    		optionId = $('.optionDetail option:selected').attr('id');
    		SelectOptionPrice = $('.optionDetail option:selected').attr('cost');
    		
			if(!duplicate_option_check.includes(optionId)){
			$('.selectListProduct').append(
				"<div class = 'selectOptionList basicOpt' style = 'margin-top: 16px;' id='" + optionId + "'>"
					+"<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600;'>"
						+"<div style='text-align: left; width: 100%;' class='selectProduct'>" + selectProductName + "</div>"
						+"<div><img class='deleteBtn' src='../image/icon/delete.png'></div>"
					+"</div>"
					+"<div style = 'height: calc(100%/3); font-size: 14px; text-align: left; width: 100%; font-weight: bold; color: #707070;'>" + optionName +" : " + state + "</div>"
					+"<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600;'>"
						+"<div style='display: flex;' class='optionCount' id='" + optionId + "'>"
							+"<input type = 'button' value = '-' onclick='minusCnt(this)' class = 'cntBtn'>"
							+"<div class='cntBtn resultBtn productCnt' style='line-height: 24px;' id='result" + optionId + "'>1</div>"
							+"<input type = 'button' value = '+' onclick='plusCnt(this)' class = 'cntBtn'>"
						+"</div>"
						+"<div style='width: 100%; text-align: right;' class='productTotalPrice" + optionId + " totalPriceProduct' id='optionPriceId" + optionId + "' cost='" + SelectOptionPrice + "'>" + parseInt(SelectOptionPrice).toLocaleString('en') + "원</div>"
					+"</div>"
				+"</div>"							
			)
				duplicate_option_check.push(optionId);
				AllProductPrice();
    		} else {
   				alert('이미 선택하신 옵션입니다.');
   			}
		}  
			
    	
    	function addTwoOpitons(){
    		var firstOptionName = $('.option_list0 option:selected').val();
			var firstOptionId = parseInt($('.option_list0 option:selected').attr('id'));
			var secondOptionName = $('.option_list1 option:selected').val();
			var secondOptionId = parseInt($('.option_list1 option:selected').attr('id'));
			var totalOptId = $('.totalOpt').attr('id');
			
			if($('.option_list0 option').is(":selected") != true){
				alert('필수 옵션을 하나 이상 선택해주세요.');
			} else{
				if(!duplicate_option_check.includes(firstOptionId+"_"+secondOptionId)){
					$('.selectListProduct').append(
						"<div class = 'selectOptionList basicOpt totalOpt' style = 'margin-top: 16px;' id='" + firstOptionId + "_" + secondOptionId +  "'>"
							+"<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600;'>"
								+"<div style='text-align: left; width: 100%;' class='selectProduct'>" + selectProductName + "</div>"
								+"<div><img class='deleteBtn' src='../image/icon/delete.png'></div>"
							+"</div>"
							+"<div style = 'height: calc(100%/3); font-size: 14px; text-align: left; width: 100%; font-weight: bold; color: #707070;'>" + firstName +" : " + firstOptionName + "</div>"
							+"<div style = 'height: calc(100%/3); font-size: 14px; text-align: left; width: 100%; font-weight: bold; color: #707070;'>" + secondName +" : " + secondOptionName + "</div>"
							+"<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600;'>"
								+"<div style='display: flex;' class='optionCount' id='" + firstOptionId + "_" + secondOptionId + "'>"
									+"<input type = 'button' value = '-' onclick='minusCnt(this)' class = 'cntBtn'>"
									+"<div class='cntBtn resultBtn productCnt' style='line-height: 24px;' id='result" + firstOptionId + "_"+ secondOptionId + "'>1</div>"
									+"<input type = 'button' value = '+' onclick='plusCnt(this)' class = 'cntBtn'>"
								+"</div>"
								+"<div style='width: 100%; text-align: right;' class='productTotalPrice" + firstOptionId + "_"+ secondOptionId + " totalPriceProduct' id='optionPriceId" + firstOptionId + ","+ secondOptionId + "' cost='" + secondOptionPrice + "'>" + parseInt(secondOptionPrice).toLocaleString('en') + "원</div>"
							+"</div>"
						+"</div>"							
					)
					duplicate_option_check.push(firstOptionId+"_"+secondOptionId);
					AllProductPrice();
				} else {
	   				alert('이미 선택하신 옵션입니다.');
	   			}
			}
    	}
    	
		$(document).on('change','.optionSelectDetail', function(){
			addSelectOptionBox();
			$('.optionSelectDetail option:disabled').prop('selected',true);
		})    	
    	
    	var duplicate_select_check = [];
    	var selectOptionId;
    	/* 선택옵션 선택시 제품 정보 박스 나오기 */
    	function addSelectOptionBox(){
    		
    		var selectState = $('.optionSelectDetail option:selected').text().split(" ")[0];
    		selectOptionId = $('.optionSelectDetail option:selected').attr('id');
    		var selectCost = $('.optionSelectDetail option:selected').attr('cost');
    		var selectName = $('.optionSelectDetail option:selected').attr('name');
			
    		if($('.basicOpt').length == 0){
    			alert("필수 옵션을 하나 이상 선택해야 합니다.");
    			$('.basicOpt').focus();
    		} else{
    			if(!duplicate_select_check.includes(selectOptionId)){
	    		$('.selectListProduct').append(
						"<div class = 'selectOptionList selectOpt' style = 'margin-top: 16px;' id='" + selectOptionId + "'>"
							+"<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600;'>"
								+"<div style='text-align: left; width: 100%;' class='selectProduct'>" + selectProductName + "</div>"
								+"<div><img class='deleteSelectBtn' src='../image/icon/delete.png'></div>"
							+"</div>"
							+"<div style = 'height: calc(100%/3); font-size: 14px; text-align: left; width: 100%; font-weight: bold; color: #707070;'>" + selectState + "</div>"
							+"<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600;'>"
								+"<div style='display: flex;' class='optionCount' id='" + selectOptionId + "'>"
									+"<input type = 'button' value = '-' onclick='minusCnt(this)' class = 'cntBtn'>"
									+"<div class='cntBtn resultBtn productCnt' style='line-height: 24px;' id='result" + selectOptionId + "'>1</div>"
									+"<input type = 'button' value = '+' onclick='plusCnt(this)' class = 'cntBtn'>"
								+"</div>"
								+"<div style='width: 100%; text-align: right;' class='productTotalPrice" + selectOptionId + " totalPriceProduct' id='optionPriceId" + selectOptionId + "' cost='" + selectCost + "'>" + parseInt(selectCost).toLocaleString('en') + "원</div>"
							+"</div>"
						+"</div>"							
					)
					
				duplicate_select_check.push(selectOptionId);
				AllProductPrice();
	    		} else{
	    			alert('이미 선택하신 옵션입니다.');
	    		}
   			}
		}
   		
    	/* 삭제버튼 누르면 상품 정보 박스 없애기 */
   		$(document).on('click','.deleteBtn',function(){
   			
   			var delete_in_list = $(this).parent().parent().parent().attr('id');
   			var index = duplicate_option_check.indexOf(delete_in_list);
   			duplicate_option_check.splice(index, 1);
   			
   			$(this).parent().parent().parent().remove();
   			AllProductPrice();
   		})
   		
   		/* 선택옵션 삭제 버튼 누르면 상품 정보 박스 없애기 */
   		$(document).on('click','.deleteSelectBtn',function(){
   			
   			var delete_in_list = $(this).parent().parent().parent().attr('id');
   			var index = duplicate_select_check.indexOf(delete_in_list);
   			duplicate_select_check.splice(index, 1);
   			
   			$(this).parent().parent().parent().remove();
   			AllProductPrice();
   		})
    	
    </script>
    
    <script>
    	/* 장바구니 팝업 */
    	/* $(document).on('click','#Bshow',function(){
    		$('.basketPop').addClass('show');
    	}) */
    	$(document).on('click','#close',function(){
    		$('.basketPop').removeClass('show');
    	})
    	
    	/* 더보기 팝업 */
    	$(document).on('click','#Ashow',function(){
    		$('.moreView').addClass('show');
    	})
    	$(document).on('click','#outclose',function(){
    		$('.moreView').removeClass('show');
    	})
   		
    	/* 더보기 상세보기 팝업 */
    	$(document).on('click','#close1',function(){
    		$('.moreViewReview').removeClass('show');
    	})
    	
    	$(document).on('click','.review_img_url',function(){
    		
    		var attrId = $(this).attr('id');
    		var reviewId = attrId.replace("review_img","");
    		var img_idx = $(this).attr('idx');
    		
    		$('#pop_like_photo_id').attr({'idx' : reviewId, 'src' : $('#is_liked'+reviewId).children().attr('src')});
    		$('#id_photo_review_r').attr({'idx' : reviewId, 'src' : $('#is_liked'+reviewId).children().attr('src')});
    		
    		$('#popBigImg').attr({'src' : $('#review_img'+reviewId).attr('src'), 'idx' : img_idx});
    		$('#pop_writer_name').text($('#review_writer_name'+reviewId).text());
    		$('#reviewDate').text($('#review_date'+reviewId).text());
    		$('#pop_lodgement_room').text($('#lodgement_room'+reviewId).text());
    		$('#pop_like_num').text($('#like_num'+reviewId).text());
    		$('#popReviewText').text($('#review_text'+reviewId).text());
    		
    		$('.moreViewReview').addClass('show');
    	})
    	
    	/* 내주변 둘러보기 지도 팝업 */
   		$(document).on('click','#Mshow',function(){
   			$('.map').addClass('show');
    	})
    	$(document).on('click','#close6',function(){
    		$('.map').removeClass('show');
    	})
	    
    	/* 선물하기 아이콘 클릭시 이동 */
    	$(document).on('click','.present',function(){
    		location.href='../seemore/givingGift?product=' + product_id;
    	})
    	
    	/* 구매하기 버튼 클릭시 이동 */
    	/* $(document).on('click','.purchase',function(){
    		location.href='modifyOrder';
    	}) */
	   
    </script>
    <script>
    	/* 공유버튼 클릭시 공유팝업 나타나기 */
    	$(document).on('click','#share',function(){
    		if($('.bollom').css('display') == 'none'){
    			$('.bollom').css('display','block');
    		} else{
    			$('.bollom').css('display','none');
    		}
    	})
    	/* url 복사 버튼 누르면 공유팝업 안보이게 하기 */
    	$(document).on('click','.urlBtn',function(){
    		$('.bollom').css('display','none');
    	})
    	
    </script>
   <script>
   		/* 상세보기, 리뷰, 문의바 클릭시 css변경 */
   		$(document).on('click','.infoBarA', function(){
 			$('.infoBarA').removeClass('infoBarCss');
 			$(this).addClass('infoBarCss');
   		}) 
   		
   		/* 상세보기, 리뷰, 문의바 스크롤시 지정위치에서 css 변경 */
 		$(window).on('scroll', e => {
			  $('.contents').each(function() {
			    if($(this).offset().top -250 < $(window).scrollTop()) {
			    	
			      var id = $(this).attr('id');
			      $('.scrollLocation').removeClass('infoBarCss')
			      $('.location_'+id).addClass('infoBarCss')
			    }
			  })
			})
   		
			/* 상세보기, 리뷰, 문의바 클릭시 지정위치로 이동 */
			function moveLocation(i) {
   				var offset = $('#'+i).offset();
   		 		$('html, body').animate({scrollTop : offset.top-249}, 0);   			
   		}
			
     </script>
      <script>
      		/* 상세보기 이미지 더보기 버튼 클릭시 숨겨놨던 페이지 나오게 하기 */
		   document.addEventListener('DOMContentLoaded', function(){ //DOM 생성 후 이벤트 리스너 등록
		    //더보기 버튼 이벤트 리스너
		    document.querySelector('.btn_open').addEventListener('click', function(e){
		        
		        let classList = document.querySelector('.detailInfoImg').classList; // 더보기 프레임의 클래스 정보 얻기
		        let contentHeight = document.querySelector('.detailInfoImg > .detailContent').offsetHeight; //컨텐츠 높이 얻기
		
		        // 2단계이면 전체보기로
		        if(classList.contains('showstep1')){
		            classList.remove('showstep1');
		        }
		    
		        //전체보기시 더보기 버튼 감추기 & 감추기 버튼 표시
		        if(!classList.contains('showstep1')){
		            e.target.classList.add('hide');
		            document.querySelector('.btn_close').classList.remove('hide');
		            
		        }
		    });
		}); 
		
		// 감추기 버튼 이벤트 리스너
		document.querySelector('.btn_close').addEventListener('click', function(e){
		    e.target.classList.add('hide');
		    document.querySelector('.btn_open').classList.remove('hide'); // 더보기 버튼 감춤
		    document.querySelector('.detailInfoImg').classList.add('showstep1'); // 초기 감춤 상태로 복귀
		});
		
		//컨텐츠 로딩 완료 후 높이 기준으로 클래스 재처리
		function detailImgHeight(){
		    let contentHeight = document.querySelector('.detailInfoImg').offsetHeight; //컨텐츠 높이 얻기
		    if(contentHeight <= 1){
		        document.querySelector('.detailInfoImg').classList.remove('showstep1'); // 초기값보다 작으면 전체 컨텐츠 표시
		        document.querySelector('.btn_open').classList.add('hide'); // 버튼 감춤
		    }
		}
		/* window.addEventListener('load', function(){
		    let contentHeight = document.querySelector('.detailInfoImg > .detailContent').offsetHeight; //컨텐츠 높이 얻기
		    console.log(contentHeight);
		    if(contentHeight <= 300){
		        document.querySelector('.detailInfoImg').classList.remove('showstep1'); // 초기값보다 작으면 전체 컨텐츠 표시
		        document.querySelector('.btn_open').classList.add('hide'); // 버튼 감춤
		    }
		}); */
    </script>
    <script>
    	$(document).on('click','.productSmallImg',function(){
    		$('.productSmallImg').removeClass('smallCss');
    		$(this).addClass('smallCss');
    	})
    	/* document.getElementById('defaultOpen').click(); */
    </script>
    <script>
    	var payIdx;
    	var productOptionPrice;
		var productTotalPrice = 0;
    	
	    function productPrice(type){
			payIdx = $(type).parent().attr('id');
	
			var price = parseInt($('.productTotalPrice'+payIdx).attr('cost'));
			var productCount = parseInt($('#result'+payIdx).text());
			
			productOptionPrice = price * productCount;
			$('.productTotalPrice'+payIdx).text(parseInt(productOptionPrice).toLocaleString('en')+"원");
		}
			
		function AllProductPrice(){
			productTotalPrice = 0;
			var productCountTotal = 0;
			//var ProductIdx= $(type).parent().parent().parent().attr('id');
			
			$('.totalPriceProduct').each(function(){
				productTotalPrice += parseInt($(this).text().replace("원","").replaceAll(",",""));
			})
			
			$('.productCnt').each(function(i){
				productCountTotal += parseInt($(this).text());
			})
			
			$('#totalProductPrice').text(productTotalPrice.toLocaleString('en'));
			$('#productCount').text(productCountTotal);

		}
    
 	 /* +버튼 눌렀을때 변화 */
	 function plusCnt(type)  {
   	 
      	  var number = $(type).prev().text();
	          number = parseInt(number) + 1;
	          $(type).prev().text(number);
          
          productPrice(type);
          AllProductPrice();
    }
	 function minusCnt(type)  {
	   	 
    	var number = $(type).next().text();
        number = parseInt(number) - 1;
        
        if (number < 1) {
       		number = 1;
        }
        /* -버튼 위에 있는 값에 number 작성 */
        $(type).next().text(number);
        
        productPrice(type);
        AllProductPrice();
    }	
    </script>
    <script>
	    function page() {	
			// ****더 중요한점 테이블 이름 적어줘야함!!
		    $('div.infoReviewTexts').each(function () {
		        var pagesu = 10;  //페이지 번호 갯수
		        var currentPage = 0;
		        var numPerPage = 5;  //목록의 수
		        var $div = $(this);
		        var pagination = $("#pagination");
	
		        //length로 원래 리스트의 전체길이구함
		        var numRows = $div.find('.reviewText').length;
	
		        //Math.ceil를 이용하여 반올림
		        var numPages = Math.ceil(numRows / numPerPage);
	
		        //리스트가 없으면 종료
		        if (numPages == 0) return;
	
		        //pager라는 클래스의 div엘리먼트 작성
		        var $pager = $('<div class="pager"></div>');
		        var nowp = currentPage;
		        var endp = nowp + 10;
	
		        //페이지를 클릭하면 다시 셋팅
		        $div.bind('repaginate', function () {
	
		        //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
		            $div.find('.reviewText').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
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
		           
		            // [이전]
		            $('<span class="pageNum back"><img src="../image/icon/arrleft.png"></span>').bind('click', { newPage: page }, function (event) {
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
		            $('<span class="pageNum next"><img src="../image/icon/arrRight.png"></span>').bind('click', { newPage: page }, function (event) {
		                if (currentPage == numPages - 1) return;
		                currentPage = currentPage + 1;
		                $div.trigger('repaginate');
		                $($(".pageNum")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
		            }).appendTo(pagination).addClass('clickable');
	
		            $($(".pageNum")[2]).addClass('active');
		            
		        });
	
		        $pager.insertAfter($div).find('span.pageNum:first').next().next().addClass('active');
		        $pager.appendTo(pagination);
		        $div.trigger('repaginate');
			    });
			}
    
	     function questionPage() {	
			// ****더 중요한점 테이블 이름 적어줘야함!!
		    $('div.askText').each(function () {
		        var pagesu2 = 10;  //페이지 번호 갯수
		        var currentPage2 = 0;
		        var numPerPage2 = 5;  //목록의 수
		        var $div2 = $(this);
		        var pagination2 = $("#pagination2");
	
		        //length로 원래 리스트의 전체길이구함
		        var numRows2 = $div2.find('.askContent').length;
	
		        //Math.ceil를 이용하여 반올림
		        var numPages2 = Math.ceil(numRows2 / numPerPage2);
	
		        //리스트가 없으면 종료
		        if (numPages2 == 0) return;
	
		        //pager라는 클래스의 div2엘리먼트 작성
		        var $pager2 = $('<div class="pager2"></div>');
		        var nowp2 = currentPage2;
		        var endp2 = nowp2 + 10;
	
		        //페이지를 클릭하면 다시 셋팅
		        $div2.bind('repaginate', function () {
	
		        //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
		            $div2.find('.askContent').hide().slice(currentPage2 * numPerPage2, (currentPage2 + 1) * numPerPage2).show();
		            $("#pagination2").html("");
		            if (numPages2 > 1) {     // 한페이지 이상이면
		                if (currentPage2 < 5 && numPages2 - currentPage2 >= 5) {   // 현재 5p 이하이면
		                    nowp2 = 0;     // 1부터 
		                    endp2 = pagesu2;    // 10까지
		                } else {
		                    nowp2 = currentPage2 - 5;  // 6넘어가면 2부터 찍고
		                    endp2 = nowp2 + pagesu2;   // 10까지
		                    pi = 1;
		                }
		                if (numPages2 < endp2) {   // 10페이지가 안되면
		                    endp2 = numPages2;   // 마지막페이지를 갯수 만큼
		                    nowp2 = numPages2 - pagesu2;  // 시작페이지를   갯수 -10
		                }
		                if (nowp2 < 1) {     // 시작이 음수 or 0 이면
		                    nowp2 = 0;     // 1페이지부터 시작
		                }
		            } else {       // 한페이지 이하이면
		                nowp2 = 0;      // 한번만 페이징 생성
		                endp2 = numPages2;
		            }
		           
		            // [이전]
		            $('<span class="pageNum2 back"><img src="../image/icon/arrleft.png"></span>').bind('click', { newPage: page }, function (event) {
		                if (currentPage2 == 0) return;
		                currentPage2 = currentPage2 - 1;
		                $div2.trigger('repaginate');
		                $($(".pageNum2")[(currentPage2 - nowp2) + 2]).addClass('active').siblings().removeClass('active');
		            }).appendTo(pagination2).addClass('clickable');
		            // [1,2,3,4,5,6,7,8]
		            for (var page = nowp2; page < endp2; page++) {
		                $('<span class="pageNum2"></span>').text((page + 1)).bind('click', { newPage: page }, function (event) {
		                	// 여기가 data인데 우리는 항상 data로 data를 정의하기에 그냥 갖다 쓰면 됨!
		                    currentPage2 = event.data['newPage'];
		                    $div2.trigger('repaginate');
		                    $($(".pageNum2")[(currentPage2 - nowp2) + 2]).addClass('active').siblings().removeClass('active');
		                }).appendTo(pagination2).addClass('clickable');
		            }
	
		            // [다음]
		            $('<span class="pageNum2 next"><img src="../image/icon/arrRight.png"></span>').bind('click', { newPage: page }, function (event) {
		                if (currentPage2 == numPages2 - 1) return;
		                currentPage2 = currentPage2 + 1;
		                $div2.trigger('repaginate');
		                $($(".pageNum2")[(currentPage2 - nowp2) + 2]).addClass('active').siblings().removeClass('active');
		            }).appendTo(pagination2).addClass('clickable');
		            
		        });
	
			        $pager2.insertAfter($div2).find('span.pageNum2:first').next().next().addClass('active');
			        $pager2.appendTo(pagination2);
			        $div2.trigger('repaginate');
			    });
			} 
    </script>
 	<script>
 	function zoomImg() {
	  var target = $('.target');
	  var zoom = target.data('zoom');
	  
	  $('.magnifier *').remove();
	  
	  $(".wrap")
	    .on('mousemove', magnify)
	    .prepend("<div class='magnifier'></div>")
	    .children('.magnifier').css({
	    "background": "url('" + target.attr("src") + "') no-repeat",
	    "background-size": target.width() * zoom + "px " + target.height() * zoom+ "px"
	  });

 		  var magnifier = $('.magnifier');

 		  function magnify(e) { 
 		    // 마우스 위치에서 .magnify의 위치를 차감해 컨테이너에 대한 마우스 좌표를 얻는다.
 		    var mouseX = e.pageX - $(this).offset().left;
 		    var mouseY = e.pageY - $(this).offset().top;

 		    // 컨테이너 밖으로 마우스가 벗어나면 돋보기를 없앤다.
 		    if (mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0) {
 		      magnifier.fadeIn(100);
 		    } else {
 		      magnifier.fadeOut(100);
 		    }

 		    //돋보기가 존재할 때
 		    if (magnifier.is(":visible")) {

 		      // 마우스 좌표 확대될 이미지 좌표를 일치시킨다.
 		      var rx = -(mouseX * zoom - magnifier.width() /2 );
 		      var ry = -(mouseY * zoom - magnifier.height() /2 );

 		      //돋보기를 마우스 위치에 따라 움직인다.
 		      //돋보기의 width, height 절반을 마우스 좌표에서 차감해 마우스와 돋보기 위치를 일치시킨다.
 		      var px = mouseX - magnifier.width() / 2;
 		      var py = mouseY - magnifier.height() / 2;

 		      //적용
 		      magnifier.css({
 		        left: px,
 		        top: py,
 		        backgroundPosition: rx + "px " + ry + "px"
 		      });
 		    }
 		  }
 		};
 	</script>
 	<script>
 		/* 공유하기 아이콘의 url input 창에  현재페이지 url 입력하기 */
 		var link = document.location.href;
 		$('input[name=urlValue]').attr('value',link);
 		
 		/* url 복사하기 */
 		function clip(){
 			var url = '';
 			var textarea = document.createElement("textarea");
	 			document.body.appendChild(textarea);
	 			url = window.document.location.href;
	 			textarea.value = url;
	 			textarea.select();
	 			document.execCommand("copy");
	 			document.body.removeChild(textarea);
 			alert("URL이 복사되었습니다.")
 		}
 	</script>
 	
 	<script>
 		/* 제품 작은 사진들 클릭한 이미지로 큰 사이즈의 이미지 변경 */
 		$(document).on('click','.productSmallImg',function(){
 			/* 클릭한 css이미지에 border 추가 */
			$(this).addClass('smallCss').siblings().removeClass('smallCss');
			var attrId = $(this).attr('id');
			
			/* 제품 큰 이미지에 클릭한 이미지 붙이기 */
			$('#big_photo').attr('src', $('#'+attrId).attr('src'));
			
			zoomImg();
 		})
 		
 		function productImgs(){
 			for(var i = 0; i < data.img_list.length; i++){
 				$('.productImgs').append(
 					"<img class='productSmallImg' id='productImg" + i + "' src='" + data.img_list[i] + "'>"	
 				)
 			}
 			/* 팝업 열자마자 나오는 이미지, border 기본값 */
			$('#big_photo').attr('src',data.img_list[0]);
			$('#productImg0').addClass('smallCss');
			
			zoomImg();
 		}
 	</script>
 	<script>
 		/* 장바구니 담기 버튼 눌렀을떄 */
 		$(document).on('click','.bucket',function(){
 			
 			if($('.basicOpt').length == 0) {
 				alert("옵션 선택 후에 버튼을 클릭해 주세요.")
 			} else if($('.basicOpt').length != 0 || noOptionLevel == 0){
 	 			
 	 			/* var optionCategory;
 	 			var selectOptionCategory;
 	 		
 	 			optionCategory = $('#result'+optionId).text();
 	 			selectOptionCategory = $('#result'+selectOptionId).text(); */
 	 			
 	 			// 옵션 id값
 	 			//{$('.selectOptionList').attr('id') : optionCategory, id : qty}
 	 			
 	 			var optionLists = {};
 	 			$('.basicOpt').each(function() {
 	 				var option_id = $(this).attr('id');
 	 				var option_cnt = parseInt($('#result'+option_id).text());
 	 				optionLists[option_id.replace("_",",")] = option_cnt;
 	 			})
 	 			
 	 			var selectOptionLists = {};
 	 			if($('.selectOpt').length != 0) {
	 	 			$('.selectOpt').each(function() {
	 	 				var option_id = $(this).attr('id');
	 	 				var option_cnt = parseInt($('#result'+option_id).text());
	 	 				selectOptionLists[option_id] = option_cnt;
	 	 			})
 	 			}
 		 			/* optionLists.push({
 						option_category : optionCategory,
 		 			}) */
 		 		
 		 			/* var selectOptionLists = [];
 		 			selectOptionLists.push({
 		 				selectOption : selectOptionCategory,
 		 			}) */

 	 			var sendData = {
 		 			"product_id" : productId,
 	 				"just_purchase" : false,
 	 				"options" : optionLists,
 	 				"select_options" : selectOptionLists
 	 			 }
 	 			 
 		 		console.log(sendData);
 		 			
 				$.ajax({
 					 contentType: "application/json; charset=utf-8",
 					 url :"../shopbaskets", // 컨트롤러 위치
 					 type : "POST",
 					 beforeSend: function (xhr) {
 			             xhr.setRequestHeader("user", user_id);
 	    			 },
 					 data : JSON.stringify(sendData),
 					//dataType : response 어떤 타입으로 받을지
 					dataType : 'JSON',
 					success : function(result){
 						console.log(result);
 						
 						
 						if(result.message == 'Success'){
 							$('.basketPop').addClass('show');
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
		
 		/* 구매하기 버튼을 눌렀을때 */
 		$(document).on('click','.purchase',function(){
 			if($('.basicOpt').length == 0) {
 				alert("옵션 선택 후에 버튼을 클릭해 주세요.");
 			} else {
 				<%-- <% session.setAttribute("name","");%> --%>
 				
 				  $.ajax({
 					url: "../WebLoginStateCheckCon.do", // 컨트롤러 위치
 					type: "post",
 					dataType: 'text',
 					success: function(result) {
 						console.log(result)

 						if (result == "Login") {
 							//로그인 안되있을때 로그인페이지로 넘어가기
 							location.href = '../login/login.jsp';
 							return false;
 						} else if (result == "Success") {
 							console.log(result);
 							
 							var optionLists = {};
 			 	 			$('.basicOpt').each(function() {
 			 	 				var option_id = $(this).attr('id');
 			 	 				var option_cnt = parseInt($('#result'+option_id).text());
 			 	 				optionLists[option_id] = option_cnt;
 			 	 			})
 			 	 			
 			 	 			var selectOptionLists = {};
 			 	 			if($('.selectOpt').length != 0) {
 				 	 			$('.selectOpt').each(function() {
 				 	 				var option_id = $(this).attr('id');
 				 	 				var option_cnt = parseInt($('#result'+option_id).text());
 				 	 				selectOptionLists[option_id] = option_cnt;
 				 	 			})
 			 	 			}

 			 	 			var sendData = {
 			 		 			product_id : productId,
 			 	 				just_purchase : true,
 			 	 				options : optionLists,
 			 	 				select_options: selectOptionLists
 			 	 			 }
 			 	 			 
 			 		 		console.log(sendData);
 			 		 			
 			 				$.ajax({
 			 					 contentType: "application/json; charset=utf-8",
 			 					 url :"../shopbaskets", // 컨트롤러 위치
 			 					 type : "POST",
 			 					 beforeSend: function (xhr) {
 			 			             xhr.setRequestHeader("user", user_id);
 			 	    			 },
 			 					 data : JSON.stringify(sendData),
 			 					//dataType : response 어떤 타입으로 받을지
 			 					dataType : 'JSON',
 			 					success : function(result){
 			 						console.log(result)
 			 						
 			 						if(result.message == 'Success'){
 			 					    	$.ajax({
 			 								url : "../PurchasePriceCon.do", // 컨트롤러 위치 
 			 								type : "POST",
 			 								data : {
 			 									shopbasket_id : null,
 			 									totalProduct : productTotalPrice,
 			 									totalDelivery : productDeliveryPrice,
 			 								},
 			 								dataType : 'text',
 			 								success : function(result){ 
 			 									console.log(result);
 			 									location.href = 'modifyOrder';
 			 									return false;
 			 								 },
 			 								error : function(){
 			 									alert("서버오류");
 			 									return false;
 			 								}
 			 							})
 			 					    	
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
 						
 						return false;
 					},
 					error: function() {
 						alert("서버 요청 실패", "연결을 다시 확인 해주세요.");
 						return false;
 					}
 				}); 
 			}
 		})
 		
		function productInfo(){
 			/* 무료배송일때 */
			if(data.delivery_price == false){
				$('.productInfo').append(
					"<div class='free'><p>무료배송</p></div>"		
				)
			}
			/* 세일제품일때 */
			if(data.bargain_price == true){
				$('.productInfo').append(
					"<div class='specialPrice'><p>특가</p></div>"		
				)
			}
			/* 바이인호텔일때 */
			if(data.is_buyinhotel == true){
				$('.productInfo').append(
					"<div class='buyIn'><p>바이인</p></div>"	
				)
			}else{
				$('.buyinAlarm').css('display','none');
			}
 		}
 		
 		function DetailImgs(){
 			for(var i = 0; i < detailData.length; i++){
 				$('.detailInfoImg').append(
 					"<img class='detailContent' src='" + detailData[i] + "'>"	
 				)
 			}
 			detailImgHeight();
 		}
 		
 		function productInfoTable(){
 			for(var i = 0; i < infoData.length; i++){
 				$('.productInfoTable').append(
 					"<tr>"
						+"<td>" + infoData[i].productNoticeList + "</td>"
						+"<td>" + infoData[i].productNotice + "</td>"
					+"</tr>"	
 				)
 			}
 		}
 		
 		function wishlist(){
 			if(data.is_wished == true){
 				$('.wishImg').append(
 					"<img id='wishBtn' src = '../image/icon/wishOk.png'>"		
 				)
 			} else if(data.is_wished == false){
 				$('.wishImg').append(
	 				"<img id='wishBtn' src = '../image/icon/stars.png'>"
 				)
 			}
 		}
 		
 		$(document).on('click','.wishImg',function(){
 			var is_true = "../image/icon/wishOk.png";
 			var is_false = "../image/icon/stars.png";
 			
 			if($('#wishBtn').attr('src') == is_true){
 				$('#wishBtn').attr('src', is_false);
 				
 				$.ajax({
 					 url : "../wishlists?product=" + product_id, // 컨트롤러 위치
 					 type : "DELETE",
 					 beforeSend: function (xhr) {
 			            xhr.setRequestHeader("user", user_id);
 				     },
 					dataType : 'JSON',
 					success : function(result){
						console.log(result);
						
					if(result.message == 'Success'){
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
 			} else if($('#wishBtn').attr('src') == is_false){
 				$('#wishBtn').attr('src', is_true);
 				
 				 var sendData = {
						 user : user_id,
						 product : product_id
					 }
				 
				 $.ajax({
					 contentType: "application/json; charset=utf-8",
					 url : "../wishlists?product=" + product_id, // 컨트롤러 위치
					 type : "POST",
					 beforeSend: function (xhr) {
 			            xhr.setRequestHeader("user", user_id);
 				     },
					 data : JSON.stringify(sendData),
					 dataType : 'JSON',
					 success : function(result){
						
						console.log(result)
						
						if(result.message == 'Success'){
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
 		
 		/* $(function(){
 			$.ajax({
				url : "https://www.buyinhotel.co.kr:5000/lodgement-info?user=" + user_id + "&lodgement=169&checkin=2022.06.07&checkout=2022.06.08", // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				success : function(result){
					
					if(result.message == 'Success'){
						data = result.data;
						reviewData = data.reviews;
						console.log(reviewData);
						
						reviews();
						moreReviewImgs();
						
						page();

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
 		}) */
		
 	</script>
 	<script>
 		function reviews(){
 			for(var i = 0; i < reviewData.length; i++){
 				if(reviewData[i].is_liked == true){
 					$('.reviewTextArea').append(
						"<div class='reviewText'>"
							+"<div class='reviewer'>"
								+"<p class='reviewerName' id='review_writer_name" + reviewData[i].review_id + "'>" + reviewData[i].review_writer_name + "님</p>"
								+"<p class='reviewDate' id='review_date" + reviewData[i].review_id + "'>" + reviewData[i].review_date + "</p>"
							+"</div>"
							+"<div class='reviewGoods'>"
								+"<p>좋아요 <span id = 'like_num" + reviewData[i].review_id + "'>" + reviewData[i].like_num + "</span><span class='likeIcon' id='is_liked" + reviewData[i].review_id + "'><img idx='" + reviewData[i].review_id + "' style='margin-left: 6px; width: 26px;' class='likeBtn' src='../image/icon/blueGood.png'></span></p>"
							+"</div>"
							+"<div class='memberReview'>"
								+"<p id = 'review_text" + reviewData[i].review_id + "'>" + reviewData[i].review_text + "</p>"
							+"</div>"
						+"</div>"		
	 				)
 				} else if(reviewData[i].is_liked == false){
	 				$('.reviewTextArea').append(
						"<div class='reviewText'>"
							+"<div class='reviewer'>"
								+"<p class='reviewerName' id='review_writer_name" + reviewData[i].review_id + "'>" + reviewData[i].review_writer_name + "님</p>"
								+"<p class='reviewDate' id='review_date" + reviewData[i].review_id + "'>" + reviewData[i].review_date + "</p>"
							+"</div>"
							+"<div class='reviewGoods'>"
								+"<p>좋아요 <span id = 'like_num" + reviewData[i].review_id + "'>" + reviewData[i].like_num + "</span><span class='likeIcon' id='is_liked" + reviewData[i].review_id + "'><img idx='" + reviewData[i].review_id + "' class='likeBtn' style='margin-left: 6px; width: 26px;' src='../image/icon/good.png'></span></p>"
							+"</div>"
							+"<div class='memberReview'>"
								+"<p id = 'review_text" + reviewData[i].review_id + "'>" + reviewData[i].review_text + "</p>"
							+"</div>"
						+"</div>"		
	 				)
 				}
 				
 				 /* if(reviewData[i].review_img_url != null){
 					$('.infoReviewImgs').append(
 		               "<img src=" + reviewData[i].review_img_url + " id='review_img" + reviewData[i].review_id + "' class='review_img_url photo_reviews' idx = '" + i +"'>"
 					)
 				} */
 			}

 			
 			/* 포토리뷰 모아보기 */
 			var photoReviewList = reviewData.filter(review => review.review_img_url != null);
 			if(photoReviewList.length == 0)  {
 				$('.more').css("display", "none");
 			} else if (photoReviewList.length < 7){
 				
 				$('.more').css("display", "none");
 				
 				for(var i = 0; i < photoReviewList.length; i++){
 					$('.infoReviewImgs').append(
 	                   "<img src=" + photoReviewList[i].review_img_url + " class = 'review_img_url review_top" + photoReviewList[i].review_id+"' id='review_img" + photoReviewList[i].review_id+"' idx = '" + i + "'>"
 					)
 				}
 			}  else {
 				for(var i = 0; i < photoReviewList.length; i++){
 					$('.infoReviewImgs').append(
 	                   "<img src=" + photoReviewList[i].review_img_url + " class = 'review_img_url review_top" + photoReviewList[i].review_id+"' id='review_img" + photoReviewList[i].review_id+"' idx = '" + i + "'>"
 					)
 					if(i == 5){
 						break;
 					}
 				}
 			}
 		}
 		
 		/* 더보기 팝업 */
 		function moreReviewImgs(){
 			var reviewImgList = reviewData.filter(review => review.review_img_url != null);
 			for(var i = 0; i < reviewImgList.length; i++){
				$('.moreViewPhotos').append(
                   "<img src=" + reviewImgList[i].review_img_url + " id='review_img" + reviewData[i].review_id + "' class='review_img_url' idx = '" + i + "'>"
				)
			}
 		}
 		
 		/* 리뷰 좋아요 클릭시 변화 */
		$(document).on('click','.likeBtn', function(){
			
			var is_like = "../image/icon/blueGood.png"; 
			var is_dislike = "../image/icon/good.png";
			 
			 // review_id 받아오기 
			 var review = $(this).attr('idx');
			
			 // 리뷰 좋아요 버튼 클릭시 좋아요 취소 
			 if($(this).attr('src') == is_like){
				 $(this).attr('src', is_dislike);
				 
				 var like_id = $(this).parent().attr('id');
				 like_id = like_id.replace("is_liked","");
				 
				 var like_num = $('#like_num'+like_id).text();
				 $('#like_num'+like_id).text(like_num*1-1);
				 
				 likeDelete(review);
			 
			 } else if($(this).attr('src') == is_dislike){
				 $(this).attr('src', is_like);
				
				 var like_id = $(this).parent().attr('id');
				 like_id = like_id.replace("is_liked","");
				 
				 var like_num = $('#like_num'+like_id).text();
				 $('#like_num'+like_id).text(like_num*1+1);
				 
				likePost(review);	 
			 }
		})
		
		//리뷰 상세보기 팝업 좋아요 클릭시 변화 
		$(document).on('click','.poplikeBtn', function(){
			
			var is_like = "../image/icon/blueGood.png"; 
			var is_dislike = "../image/icon/good.png";
			 
			 //review_id 받아오기 
			 var review = $(this).attr('idx');
			
			 //리뷰 좋아요 버튼 클릭시 좋아요 취소 
			 if($(this).attr('src') == is_like){
				 $(this).attr('src', is_dislike)
				 
				 var like_id = $(this).parent().attr('id')
				 like_id = like_id.replace("is_liked","");
				 
				 var like_num2 = $('#pop_like_num'+like_id).text();
				 $('#pop_like_num'+like_id).text(like_num2*1-1);
				 
				 likeDelete(review);
			 
			 } else if($(this).attr('src') == is_dislike){
				 $(this).attr('src', is_like)
				
				 var like_id = $(this).parent().attr('id')
				 like_id = like_id.replace("is_liked","");
				 
				 var like_num2 = $('#pop_like_num'+like_id).text();
				 $('#pop_like_num'+like_id).text(like_num2*1+1);
				 
				likePost(review);	 
			 }
		}) 
		
		/* 좋아요 버튼 누를시 db에 좋아요 갯수 -1 */
		function likeDelete(review){
			
			 $.ajax({
				 url : "../like?user=" + user_id + "&review="+ review, // 컨트롤러 위치
				 type : "DELETE",
				dataType : 'JSON',
				success : function(result){
					
					if(result.message == 'Success'){
						
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
		
		/* 좋아요 누를시 db에 +1 */
		function likePost(review){
			
			 var sendData = {
					 user : user_id,
					 review : review
				 }
				  
				 $.ajax({
					 contentType: "application/json; charset=utf-8",
					 url : "../like", // 컨트롤러 위치
					 type : "POST",
					 data : JSON.stringify(sendData),
					 dataType : 'JSON',
					 success : function(result){
						
						console.log(result)
						
						if(result.message == 'Success'){
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
 	</script>
</body>
</html>