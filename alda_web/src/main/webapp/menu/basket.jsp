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
	.optionSelect{
		width: 460px;
		height: 36px;
		background-color: #F1F1F1;
		font-size: 14px;
		color: #707070;
		font-family: NotoSans;
		font-weight: bold;
		margin-bottom: 8px;
		border: none;
	}
	.optionTotalBox{
		display: grid;
		grid-template-columns: 50% 50%;
		border: 1px solid #727F8A;
		border-radius: 4px;
		width: 100%;
		height: 52px;
		align-content: space-around;
		font-size: 19px;
		font-family: NotoSans;
		color: #242424;
		margin: 16px auto;
	}
	.optionTotalBox div{
		width: 100%;
	}
	
	.optionOkBtn{
		width: 222px;
		height: 50px;
		font-size: 19px;
		font-weight: bold;
		font-family: NotoSans;
		background-color: white;
		color: #727F8A;
		border: 1px solid #727F8A;
		border-radius: 4px;
	}
.optionCount input {
	margin: 0px;
	background-color: white;
	width: 26px;
	height: 26px;
	border: 1px solid #707070;
	float: left;
}
.result {
	float: left;
	width: 28px;
	border: 1px solid #707070;
	height: 24px;
	line-height: 24px;
	background-color: white;
	text-align: center;
}
	.optionCount{
		margin-top: 8px;
	}
	.basketProductName{
		line-height: 24px;
		width: 100%;
		padding-left: 16px;
	}
	.optionPlus{
		display: grid;
		grid-template-columns: 50% 50%;
	}
	.cntBtn{
		height: 26px;
	}
	.selectListProduct{
		max-height: 430px;
		overflow: auto;
	}
	.productDeleteBtn button{
		width: 96px;
		height: 34px;
		background-color: white;
		border: 1px solid #727F8A;
		border-radius: 4px;
		font-size: 16px;
		margin: 0px 10px;
		font-family: NotoSans;
	}
</style>

</head>
<body>
<%@include file="../header_noTop.jsp"%>
   <!-- <div class='topSubs'>
	   		<div class='topMenus'>
	   			<div class=topSubMenu>
			   		<h4 class='basketMenu'>장바구니 <span><span style='color: #242424;'>장바구니</span> > 주문결제 > 결제완료</span></h4>
	   			</div>
		   		<div class='memberInfo2'>
	   			<p style='float: left;'>000님 | </p>
	   			<p>로그아웃</p>
	   		</div>
	   </div>
   </div> -->
	
	
	<main class='content'>
		<div class='totalPrice'>
			<div class='priceNav'>
				<div class='PriceSideTable'>
					<table>
						<tr>
							<td>총 상품금액</td>
							<td id='productPriceTotal'>0원</td>
						</tr>
						<!-- <tr>
							<td>총 할인금액</td>
							<td id='totalDiscount'>0원</td>
						</tr> -->
						<tr>
							<td>총 배송비</td>
							<td id='totalDelivery'>0원</td>
						</tr>
						<tr>
							<td>총 금액</td>
							<td id='allTotalPrice'>0원</td>
						</tr>
					</table>
				</div>
				<div class='priceSideBtn'>
					<button type='button' class='basketPayBtn'>결제하기</button>
				</div>
			</div>
		</div>
		<div class='basketInfo'>
			<div class='allSelect'>
				<label><input type='checkbox' id='allCheck'> 전체선택  </label><span id='selectDelete'>선택삭제</span>
			</div>
			<div class='basketItems'>
				<!-- 장바구니 목록 1 -->
				 <!-- <div class='basketProduct'>
					<div class='basketStoreName'>
						<p>구르미애 배송</p>
					</div>
					<div class='basketInformation'>
						장바구니 체크박스
						<div><input type='checkbox' name='oneCheck'></div>
						장바구니 제품 정보
						<div class='basketProductInfo'>
							<div class='basketInfoTitle'>
								<div class='basketImg'>
									<img src='../image/items/basket1.png'>
								</div>
								<div class='basketProductName' style='line-height: 24px;'>
									<h4>[베이직톤] 클린코든 고밀도 순면 차렵이불 옥수수솜 6colors</h4>
									<p>무료배송 | 일반택배</p>
								</div>
								<div>
									<img class='basketDelete' src='../image/icon/delete.png'>
								</div>
							</div>
							
							제품 옵션 정보
							<div class='basketOption'>
								<p>색상 : <span>퓨어화이트</span><span style='float: right;'><img class='optionDelte' src="../image/icon/delete.png"></span></p>
								<p>사이즈 : <span>슈퍼싱글(SS) 이불단품(150X205cm)</span></p>
								<select class='basketSelect'>
									<option value = '1' disabled selected>1</option>
									<option value = '2'>2</option>
									<option value = '3'>3</option>
									<option value = '4'>4</option>
								</select>
								
								<div class='optionCount'>
									<input type='button' value='-' name ='minus' onclick = 'minusCnt(this)'>
									<div class='result' id ='result'>0</div>
									<input type='button' value='+' name ='plus' onclick = 'plusCnt(this)'>
								</div>
								
								<p style='float: right; font-size: 18px;'>62,900원</p>
							</div>
							<div class='optionPlus'>
								<div class='optionPlutBtn'>
									<button type='button' class='addOption'>옵션추가</button>
								</div>
								<p class='totalProductPrice'>62,900원</p>
							</div>
							
						</div>
					</div>
					<div class='shippingFee'>배송비 무료</div>
				</div> -->
				<!-- 장바구니 목록 하나 끝 -->
			
			</div>
		</div>
	</main>
 	<%@include file="../footer.jsp"%>
 	
 	<div class='basketOptionPop'>
 		<div class='window'>
 	 		<div class='popup' style='width: 500px; text-align: center;'>
 	 		 	<img id='close4' style='left: 483px;' src="../image/icon/whiteDelete.png">
					<div class='basketPopArea' style='margin: 15px;'>
						<!-- 제품 옵션 선택 -->
						<div id = 'optionList' style = 'margin-top: 16px;'>
							<div id='options'>
							
							</div>
							<!-- <select class = 'optionDetail'>
								<option value = '' disabled selected style='font-weight: bold;'>컬러 선택</option>
								<option value = ''>스카이블루 (남은수량: 100개)</option>
								<option value = ''>블랙 (남은수량: 100개)</option>
								<option value = ''>화이트 (남은수량: 100개)</option>
							</select> -->
						<!-- 제품 옵션 사이즈 선택 -->
						<div id='selectList'>
							
						</div>
							<!-- <select class = 'optionDetail'>
								<option value = '' disabled selected style='font-weight: bold;'>사이즈 선택</option>
								<option value = ''>정면:-270cm*88cm, 옆-78.1cm</option>
							</select> -->
						</div>
						<!-- 선택한 옵션 목록 보여주기 -->
						<div class='selectListProduct'>
						
						</div>
						
						<!-- <div class = 'selectOptionList' style = 'margin: 16px auto;'>
							<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600;'>
								<div style='text-align: left; width: 100%;'>프라제르 아쿠아텍스 4인용 소파(스툴증정) 2colors</div>
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
						<!-- 선택한 옵션 총 갯수 -->
						<div class='optionTotalBox'>
							<div style='text-align: left; margin-left: 12px;'>
								<h4>상품 <span id='productCount'>0</span>개</h4>					
							</div>
							<div style='text-align: right;'>
								<h4 style='margin-right: 12px;'><span id='totalProductPrice'>0</span>원</h4>
							</div>
						</div>
						
						<!-- 옵션 확인 버튼 -->
						<div>
							<button type='button' class='optionOkBtn optionCancelBtn' style='margin-right: 20px;'>취소</button>
							<button type='button' class='optionOkBtn' id='addOptOk' style='background-color: #8996A0; color: white;'>확인</button>
						</div>
					</div>
 	 			</div>
 	 		</div>
 		</div>
 		
		<div class='deletePop'>
		<div class='window'>
 	 		<div class='popup' style='width: 300px; text-align: center;'>
 	 		 	<img id='close8' style='left: 286px;' src="../image/icon/whiteDelete.png">
					<div class='basketPopArea' style='margin: 15px;'>
						<h4 style='margin: 24px auto; font-size: 18px; font-family: NotoSans;'>이 상품을 삭제하시겠습니까?</h4>
						<div class='productDeleteBtn'>
							<button type='button' class='delCancelBtn'>취소</button>
							<button type='button' id='productDelBtn' style='background-color: #727F8A; color: white;'>확인</button>
						</div>
					</div>
 	 			</div>
 	 		</div>
 		</div>
 		
 	<script>
    /////////////////////////////////////////////////////////
    $(function() {
    	$('.topSubMenu').append(
    		"<h4 class='basketMenu'>장바구니 <span><span style='color: #242424;'>장바구니</span> > 주문결제 > 결제완료</span></h4>"		
    	);
    })
    
    </script>
 	
 	
	<script>
		/* 체크박스 전체 체크 클릭시 전체 체크박스 체크, 체크박스 전체 체크시 전체체크 체크박스 체크 */
		/* $(document).ready(function() {
			 전체체크 클릭시 
			$("#allCheck").click(function() {
				if($("#allCheck").is(":checked")) $("input[name=oneCheck]").prop("checked", true);
				else $("input[name=oneCheck]").prop("checked", false);
				SideTotalProduct();
			});
			 체크박스 하나 클릭시 
			$("input[name=oneCheck]").on('click', function() {
				var total = $("input[name=oneCheck]").length;
				var checked = $("input[name=oneCheck]:checked").length;
				
				console.log(total);
				console.log(checked);
				
				if(total != checked) $("#allCheck").prop("checked", false);
				else $("#allCheck").prop("checked", true); 
			});
		}); */
		
		$(document).on('click', "#allCheck", function() {
			if($("#allCheck").is(":checked")) $("input[name=oneCheck]").prop("checked", true);
			else $("input[name=oneCheck]").prop("checked", false);
			
			SideTotalProduct();
			SideDeliveryPrice();
			SideAllTotal();
		});
		
		/* 체크박스 하나 클릭시 */
		$(document).on('click', "input[name=oneCheck]", function() {
			var total = $("input[name=oneCheck]").length;
			var checked = $("input[name=oneCheck]:checked").length;
			
			if(total != checked) $("#allCheck").prop("checked", false);
			else $("#allCheck").prop("checked", true); 
			
			SideTotalProduct();
			SideDeliveryPrice();
			SideAllTotal();
		});
		
		var shopbaketsId;
		/* 장바구니 옵션추가 버튼 클릭시 */
		$(document).on('click','.addOption' ,function(){
			$('#options *').remove();
			
			var attrId = $(this).attr('id');
			shopbaketsId = $(this).attr('idx');
			
			selectProductName = $('.basketName'+attrId).text();
			
			$('.basketOptionPop').addClass('show');
			
			// parentInfo();
			
			 $.ajax({
				url : "../product-options?product=" + attrId, // 컨트롤러 위치 
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
	            	xhr.setRequestHeader("user", user_id);
    			},
				async: false,
				success : function(result){ 
						
					data = result.data;
					console.log(data);
					
					
					optionData = data.options;
					selectData = data.boolean_options;
					
					options();
					selectOptions();
					
					return false;
				 },
				error : function(){
					alert("검색실패");
					return false;
				}
			})
			
		})
		/* 옵션추가 팝업 취소 버튼 클릭 */
		$(document).on('click','#close4',function(){
			$('.basketOptionPop').removeClass('show');
		})
		$(document).on('click','.optionCancelBtn',function(){
			$('.basketOptionPop').removeClass('show');
		})
		
		/* 결제하기 버튼 눌렀을때 */
		$(document).on('click','.basketPayBtn',function(){
			var shopbasket = "(";
			
			var shopbasketsCnt = $('.oneCheck:checked').length;
			
			if(shopbasketsCnt == 0){
				alert("선택한 상품이 없습니다.");
			} else{
				$('.oneCheck:checked').each(function(i){
					if(i == shopbasketsCnt -1){
						shopbasket += $(this).attr('id');
						shopbasket += ")";
					} else {
						shopbasket += $(this).attr('id') + ",";
					}
				})
			location.href = 'modifyOrder?shopbaskets='+shopbasket;
			
			//var totalProduct = $('#productPriceTotal').text().replace("원","").replaceAll(",","/);
			//var totalDelivery = $('#totalDelivery').text().replace("원","").replaceAll(",","");
			
			$.ajax({
				url : "../PurchasePriceCon.do", // 컨트롤러 위치 
				type : "POST",
				data : {
					shopbasket_id : shopbasket,
					totalProduct : sideTotal,
					totalDelivery : deliveryTotal
				},
				dataType : 'text',
				 beforeSend: function (xhr) {
			          xhr.setRequestHeader("user", user_id);
			     },
				success : function(result){ 
						
					location.href = 'modifyOrder';
					return false;
				 },
				error : function(){
					alert("서버오류");
					return false;
				}
			})
			
			
			} 
		})
		
		var option_id_lists = [];
		var selectOpiton_id_lists = [];
		var duplicate_option_check = [];
		
		function parentInfo(i,j){
			var returnObject = basketData[i].products[j].options;
			var selectObject = basketData[i].products[j].select_options;
			var basket_product = basketData[i].products[j].product_price;
			var basket_name = basketData[i].products[j].product_name;
			var optionIds;
			var selectOptionIds;
			
			productId = basketData[i].products[j].product_id;
			option_id_lists = [];
			selectOpiton_id_lists = [];
			
			$('.selectListProduct *').remove();
			
			for(var i = 0; i < returnObject.length; i++){
				optionIds = returnObject[i].option_id.replace(",","_");
				
				var optionCount = returnObject[i].option_count;
				var basket_price = returnObject[i].option_price;
				var productPrice = basket_product + basket_price;
				
				if(returnObject[i].option_name == null){
					
					 $('.selectListProduct').append(
						"<div class = 'selectOptionList noOptionList optionListId basicOpt' style = 'margin-top: 16px;' id='" + returnObject[i].option_id + "'>"
							+"<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600;'>"
								+"<div style='text-align: left; width: 100%;' class='selectProduct'>"
									+"<p class='product_name'>" + basket_name + "</p>"
								+"</div>"
							+"</div>"
							+"<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600; margin-top: 16px;'>"
								+"<div style='display: flex;' class='optionCount' id='" + returnObject[i].option_id + "'>"
									+"<input type = 'button' value = '-' onclick='minusBtn(this)' class = 'cntBtn'>"
									+"<div class='cntBtn productCnt' style='line-height: 24px;' id='popResult" + returnObject[i].option_id + "'>" + optionCount + "</div>"
									+"<input type = 'button' value = '+' onclick='plusBtn(this)' class = 'cntBtn'>"
								+"</div>"
								+"<div style='width: 100%; text-align: right;' class='productTotalPrice" + returnObject[i].option_id + " totalPriceProduct' id='optionPriceId" + returnObject[i].option_id + "' cost='" + productPrice + "'>" + (productPrice * optionCount).toLocaleString('en') + "원</div>"
							+"</div>"
						+"</div>"							
					)
					
					if(optionCount == 1) {
						$('#' + returnObject[i].option_id).children().first().attr('disabled', true);
					}

				} else{
					var option_names = returnObject[i].option_name.replace("\n", "<br>");
						$('.selectListProduct').append(
							"<div class = 'selectOptionList basicOpt' style = 'margin-top: 16px;' id='" + returnObject[i].option_id.replace(",","_") + "'>"
								+"<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600;'>"
									+"<div style='text-align: left; width: 100%;' class='selectProduct'>" + basket_name + "</div>"
									+"<div><img class='deleteBtn' src='../image/icon/delete.png'></div>"
								+"</div>"
								+"<div style = 'height: calc(100%/3); font-size: 14px; text-align: left; width: 100%; font-weight: bold; color: #707070;'>" + option_names + "</div>"
								+"<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600;'>"
									+"<div style='display: flex;' class='optionCount' id='" + returnObject[i].option_id.replace(",","_") + "'>"
										+"<input type = 'button' value = '-' onclick='minusBtn(this)' class = 'cntBtn'>"
										+"<div class='cntBtn resultBtn productCnt' style='line-height: 24px;' id='popResult" + returnObject[i].option_id.replace(",","_") + "'>" + optionCount + "</div>"
										+"<input type = 'button' value = '+' onclick='plusBtn(this)' class = 'cntBtn'>"
									+"</div>"
									+"<div style='width: 100%; text-align: right;' class='productTotalPrice" + returnObject[i].option_id.replace(",","_") + " totalPriceProduct' id='optionPriceId" + returnObject[i].option_id.replace(",","_") + "' cost='" + productPrice + "'>" + (productPrice * optionCount).toLocaleString('en') + "원</div>"
								+"</div>"
							+"</div>"							
						)
						option_id_lists.push(optionIds);
						duplicate_option_check = option_id_lists;
						
						if(optionCount == 1) {
							$('#popResult' + returnObject[i].option_id.replace(",","_")).prev().attr('disabled', true);
						}
						
					}
				} 
				
			/* 선택옵션 팝업창에 append */
			for(var i = 0; i < selectObject.length; i++){
				selectOptionIds = selectObject[i].option_id;
					
				$('.selectListProduct').append(
					"<div class = 'selectOptionList selectOpt' style = 'margin-top: 16px;' id='" + selectObject[i].option_id + "'>"
						+"<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600;'>"
							+"<div style='text-align: left; width: 100%;' class='selectProduct'>" + basket_name + "</div>"
							+"<div><img class='deleteSelectBtn' src='../image/icon/delete.png'></div>"
						+"</div>"
						+"<div style = 'height: calc(100%/3); font-size: 14px; text-align: left; width: 100%; font-weight: bold; color: #707070;'>" + selectObject[i].option_name + "</div>"
						+"<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600;'>"
							+"<div style='display: flex;' class='optionCount' id='" + selectObject[i].option_id + "'>"
								+"<input type = 'button' value = '-' onclick='minusBtn(this)' class = 'cntBtn'>"
								+"<div class='cntBtn resultBtn productCnt' style='line-height: 24px;' id='popResult" + selectObject[i].option_id + "'>" + selectObject[i].option_count + "</div>"
								+"<input type = 'button' value = '+' onclick='plusBtn(this)' class = 'cntBtn'>"
							+"</div>"
							+"<div style='width: 100%; text-align: right;' class='productTotalPrice" + selectObject[i].option_id + " totalPriceProduct' id='optionPriceId" + selectObject[i].option_id + "' cost='" + selectObject[i].option_price + "'>" + selectObject[i].option_price.toLocaleString('en') + "원</div>"
						+"</div>"
					+"</div>"							
					)
					selectOpiton_id_lists.push(selectOptionIds);
					duplicate_select_check = selectOpiton_id_lists; 
				}
			}
		
	</script>
	
	<script>
	var firstName;
	var secondName;
	var productOptionId;
	var optionListId;
	var SelectOptionPrice;
	var selectProductName;
	var optionName;
	var productId;
	var firstOptionLevel;
	var secondOptionLevel;
	var second_opionId;
	var secondOptionPrice;
	
	function options(){
		
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
			if(selectData.length == 0){
				$('#selectList *').remove();
			}
			
			 /* $('.selectListProduct').append(
				"<div class = 'selectOptionList noOptionList optionListId' style = 'margin-top: 16px;' id='" + optionData[0].option_id + "' idx='" + optionData[0].option_level + "'>"
					+"<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600;'>"
						+"<div style='text-align: left; width: 100%;' class='selectProduct'>"
							+"<p class='product_name" + i + "'></p>"
							+"<p>(재고 : <span class='stock" + i + "'></span>)</p>"
						+"</div>"
					+"</div>"
					+"<div style = 'display: flex; justify-content: space-between; height: calc(100%/3); font-size: 16px; font-weight: 600; margin-top: 16px;'>"
						+"<div style='display: flex;' class='optionCount' id='" + optionData[0].option_id + "'>"
							+"<input type = 'button' value = '-' onclick='minusBtn(this)' class = 'cntBtn'>"
							+"<div class='cntBtn productCnt' style='line-height: 24px;' id='popResult" + optionData[0].option_id + "'>1</div>"
							+"<input type = 'button' value = '+' onclick='plusBtn(this)' class = 'cntBtn'>"
						+"</div>"
						+"<div style='width: 100%; text-align: right;' class='productTotalPrice" + optionData[0].option_id + " totalPriceProduct totalPriceProduct" + i + "' id='optionPriceId" + optionData[0].option_id + "' cost=''> </div>"
					+"</div>"
				+"</div>"							
			) */
		}
			optionListId = $('.optionListId').attr('id');
		}
		
		
		if($('.optionListId').length < 2){
			/* 옵션이 1개일때 api */
			$.ajax({
				url : "../option-detail-list?option_count=1&option_id=" + optionListId , // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				 beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        },
				success : function(result){ 
						
					data = result.data;
					
					//productBox();
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
			})
			
		} else if($('.optionListId').length == 2){
			if(firstOptionLevel == '1'){
				$.ajax({
					url : "../option-detail-list?option_count=2&option_id=" + optionListId , // 컨트롤러 위치 
					type : "GET",
					dataType : 'JSON',
					 beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
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
					 beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
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
			})
		}
	}
	
	/* 옵션 없을때 제품 박스에 데이터 넣기 */
	function productBox(){
		for(var i = 0; i < data.length; i++){
			$('.product_name'+i).text(data[i].option_name);
			$('.totalPriceProduct'+i).text(data[i].option_price.toLocaleString('en') + "원");
			$('.totalPriceProduct'+i).attr('cost', data[i].option_price);
			$('.stock'+i).text(data[i].option_stock.toLocaleString('en') + "개");
		}
		
		AllProductPrice();
	}

	/* 첫번째 옵션 append */
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
		
		AllProductPrice();
	}
	
	/* 두본째 옵션 append */
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
		
		AllProductPrice();
	}
	
	/* 선택옵션 option append */
	function selectOptions(){
		
		$('#selectList *').remove();
		
		if(selectData.length != 0){
			
			$('#selectList').append(
				"<select class = 'optionDetail optionSelectDetail' onchange = 'addSelectOptionBox()'>"
					+"<option selected disabled>추가 상품 선택</option>"
				+"</select>" 
			)
			
    		for(var i = 0; i < selectData.length; i++){
    			$('.optionSelectDetail').append(
    				"<option value = '" + selectData[i].option_price + "' id='" + selectData[i].option_detail_id + "' cost='" + selectData[i].option_price + "' name='" + selectData[i].option_name + "'>"
    					+ selectData[i].option_name + " ( +" + selectData[i].option_price.toLocaleString('en') + ")"
    				+"</option>"
    			)
			}
   		}
	}
    	
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
						+"<input type = 'button' value = '-' onclick='minusBtn(this)' class = 'cntBtn'>"
						+"<div class='cntBtn resultBtn productCnt' style='line-height: 24px;' id='popResult" + optionId + "'>1</div>"
						+"<input type = 'button' value = '+' onclick='plusBtn(this)' class = 'cntBtn'>"
					+"</div>"
					+"<div style='width: 100%; text-align: right;' class='productTotalPrice" + optionId + " totalPriceProduct' id='optionPriceId" + optionId + "' cost='" + SelectOptionPrice + "'>" + SelectOptionPrice.toLocaleString('en') + "원</div>"
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
								+"<input type = 'button' value = '-' onclick='minusBtn(this)' class = 'cntBtn'>"
								+"<div class='cntBtn resultBtn productCnt' style='line-height: 24px;' id='popResult" + firstOptionId + "_"+ secondOptionId + "'>1</div>"
								+"<input type = 'button' value = '+' onclick='plusBtn(this)' class = 'cntBtn'>"
							+"</div>"
							+"<div style='width: 100%; text-align: right;' class='productTotalPrice" + firstOptionId + "_"+ secondOptionId + " totalPriceProduct' id='optionPriceId" + firstOptionId + ","+ secondOptionId + "' cost='" + secondOptionPrice + "'>" + secondOptionPrice.toLocaleString('en') + "원</div>"
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
	
	var duplicate_select_check = [];
	var selectOptionId;
	/* 선택옵션 선택시 제품 정보 박스 나오기 */
	function addSelectOptionBox(){
		
		var selectState = $('.optionSelectDetail option:selected').text().split(" ")[0];
		selectOptionId = parseInt($('.optionSelectDetail option:selected').attr('id'));
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
							+"<input type = 'button' value = '-' onclick='minusBtn(this)' class = 'cntBtn'>"
							+"<div class='cntBtn resultBtn productCnt' style='line-height: 24px;' id='popResult" + selectOptionId + "'>1</div>"
							+"<input type = 'button' value = '+' onclick='plusBtn(this)' class = 'cntBtn'>"
						+"</div>"
						+"<div style='width: 100%; text-align: right;' class='productTotalPrice" + selectOptionId + " totalPriceProduct' id='optionPriceId" + selectOptionId + "' cost='" + selectCost + "'>" + selectCost.toLocaleString('en') + "원</div>"
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
		
		/* 선택옵션박스 삭제버튼 누르면 상품 정보 박스 없애기 */
		$(document).on('click','.deleteSelectBtn',function(){
			
			var delete_in_list = $(this).parent().parent().parent().attr('id');
			var index = duplicate_select_check.indexOf(delete_in_list);
			duplicate_select_check.splice(index, 1);
			
			$(this).parent().parent().parent().remove();
			AllProductPrice();
		})
		
		var payIdx;
    	var productOptionPrice;
    	
	    function productPrice(type){
			payIdx = $(type).parent().attr('id');
	
			var price = parseInt($('.productTotalPrice'+payIdx).attr('cost'));
			var productCount = parseInt($('#popResult'+payIdx).text());
			
			productOptionPrice = price * productCount;
			$('.productTotalPrice'+payIdx).text(productOptionPrice.toLocaleString('en')+"원");
		}

		function AllProductPrice(){
			var productTotalPrice = 0;
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
	 function plusBtn(type)  {
   	 
      	  var number = $(type).prev().text();
	      number = parseInt(number) + 1;
	      $(type).prev().text(number);
          
	      $(type).prev().prev().attr('disabled',false);
	          
          productPrice(type);
          AllProductPrice();
     }
 	 
	 function minusBtn(type)  {
	   	 
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
  	  var user_id = '<%=id%>';
    
    	$(function(){
    		if(user_id == "null") {
				alert("장바구니는 로그인 후 이용 하실 수 있습니다.");
				location.href = '../login/login';
			} else{
    			readBasket();
			}
    	})
    	
    	function readBasket() {
    		$.ajax({
    			url : "../shopbaskets", // 컨트롤러 위치
    			type : "GET",
    			dataType : 'JSON',
    			async: false,
    			beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
    			},
    			success : function(result){
    				data = result.data;
    				console.log(data);
    				
    				basketData = data.shopbaskets;
    				
    				if(basketData.length == 0){
    					//location.href='noBasket';
    					
    					$('.basketItems *').remove();
    					
    					$('.basketItems').append(
 							"<div style='text-align: center;'>" 
	    						+"<h4 style='font-size: 28px; margin: 86px auto; font-family: NotoSans;'>장바구니에 담은 상품이 없습니다.</h4>"
	    						+"<button type='button' class='nobasketBtn' style='width: 196px; height: 56px; font-size: 18px; border: none; border-radius: 4px; font-family: NotoSans; background-color: #8996A0; color: white;'>상품 담으러 가기</button>"
   							+"</div>"
    					)
    				} else{
	    				BasketItems();
    				}
    				//SideTotalProduct();
    				$(document).on('click','.nobasketBtn',function(){
    					location.href='../index.jsp';
    				})
    				return false;
    			},
    			error : function(){
    				alert("검색실패");
    				return false;
    			}
    		})
    	}
    	
    </script>
    <script>
  	var product_price = [];
  	var shopbasket_id = [];
  	var shopbasekt_cnt = 0;
  	var options_id;
  	var product_id;
  	var deliveryOptionCount;
  	var deliveryType;
  	var deliveryPrices;
  	var deiveryMoney;
	var productShopId;
  	
  	function BasketItems(){
  		
  		$('.basketItems *').remove();
  		
		for(var i = 0; i < basketData.length; i++){
			$('.basketItems').append(
				"<div class='basketProduct companyList" + basketData[i].company_id + "' id='" + basketData[i].company_id + "'>"
					+"<div class='basketStoreName'>"
						+"<p id='" + basketData[i].company_id + "'>" + basketData[i].company_name + " 배송</p>"
					+"</div>"
				+"<div class='basket" + i + " shopBasketList" + basketData[i].company_id + "'>"
						
				+"</div>"
				+"</div>"
			+"</div>"
		+"</div>"
		)

		for(var j = 0; j < basketData[i].products.length; j++){
			productShopId = basketData[i].products[j].shopbasket_id;
		
		$('.basket'+i).append(
			"<div class='basketInformation shopbasketBox" + basketData[i].products[j].shopbasket_id + "'>"
				+"<div><input type='checkbox' name='oneCheck' class='oneCheck' id='" + basketData[i].products[j].shopbasket_id + "'></div>"
				+"<div class='basketProductInfo'>"
					+"<div class='productInfo" + i + j + "'>"
					
					+"</div>"
					+"<div class='basketOptionLists" + i + j + " OptionsList" + basketData[i].products[j].shopbasket_id + "' idx = '" + basketData[i].products[j].shopbasket_id + "'>"

					+"</div>"
					+"<div class='basketSelectOptionLists" + i + j + "' idx = '" + basketData[i].products[j].shopbasket_id + "'>"
					
					+"</div>"
					+"<div class='optionPlus'>"
						+"<div class='optionPlutBtn'>"
							+"<button type='button' class='addOption' id='" + basketData[i].products[j].product_id + "' idx = '" + basketData[i].products[j].shopbasket_id + "' onclick = 'parentInfo(" + i  + "," + j + ")'>옵션추가</button>"
						+"</div>"
							+"<p id='totalProductPrice" + i + j + "' class='TotalOptionPrice shopbasketTotalPrice" + basketData[i].products[j].shopbasket_id + "'>0원</p>"
				+"</div>"
			+"<div class='shippingFee'><span id='shopFee" + i + j +"' class='ShopDelivery shopDeliveryFee" + basketData[i].products[j].shopbasket_id + "'></span></div>"
		)
		
		shopbasket_id.push(basketData[i].products[j].shopbasket_id);
		product_id = basketData[i].products[j].product_id;
		deliveryType = basketData[i].products[j].delivery_type;
		deliveryPrices = basketData[i].products[j].delivery_price;
		deiveryMoney = basketData[i].products[j].delivery_money;
		
			$('.productInfo'+i+j).append(
				"<div class='basketInfoTitle'>"
					+"<div class='basketImg'>"
						+"<img src='" + basketData[i].products[j].product_img_url + "' onclick = 'location.href = \"productInfo?product=" + product_id + "\"'>"
					+"</div>"
					+"<div class='basketProductName' style='line-height: 24px;'>"
						+"<h4 onclick = 'location.href = \"productInfo?product=" + product_id + "\"' class='basketName" + product_id + "'>" + basketData[i].products[j].product_name + "</h4>"
						+"<p id='deliveryFee" + i + j + "'></p>"
						+"<p style='display: none;'>" + basketData[i].products[j].delivery_price + "</p>"
						+"<p id='productPrices" + i + "_" +  j + "'>" + basketData[i].products[j].product_price.toLocaleString('en') + "원</p>"
						+"<p style='display: none;'>" + deliveryType + "</p>"
					+"</div>"
					+"<div>"
						+"<img class='basketDelete' src='../image/icon/delete.png' id='" + basketData[i].products[j].shopbasket_id + "' idx='" + basketData[i].company_id + "'>"
					+"</div>"		
				+"</div>"
			)
			
			product_price.push({"id" : i+"_"+j, "price" : basketData[i].products[j].product_price});
			
			if(basketData[i].products[j].delivery_price == true){
				$('#deliveryFee'+i+j).text("배송비 " + basketData[i].products[j].delivery_money.toLocaleString('en') + "원");
			} else if(basketData[i].products[j].delivery_price == false){
				$('#deliveryFee'+i+j).text('무료배송');
			}
				
			for(var k = 0; k < basketData[i].products[j].options.length; k++){
				
				var option_count = basketData[i].products[j].options[k].option_count;
				deliveryOptionCount = basketData[i].products[j].options[k].option_count;
				var option_price = basketData[i].products[j].options[k].option_price;
				var option_names = basketData[i].products[j].options[k].option_name;
				options_id = basketData[i].products[j].options[k].option_id;
				if(option_names != null) {
					option_names = option_names.replace("\n", "<br>");
				}
				
				$('.basketOptionLists'+i+j).append(
					"<div class='basketOption'>"
						+"<div style='display: grid; grid-template-columns: 50% 50%;'>"
 							+"<div style='width: 100%; text-align: left;'><p class='optionsName"+ i + j + k + " basketOptionsName" + product_id + "'>" + option_names + "</p></div>"
 							+"<div class='optionDelete' style='width: 100%; text-align: right;'><img class='optionDelte" + basketData[i].products[j].shopbasket_id + " optionid" + basketData[i].products[j].options[k].option_id + "' id='optionDel' src='../image/icon/delete.png'></div>" 
						+"</div>"
						+"<div class='optionLists"+ i+ j+ k+"' style='height: 30px;'>"
 							+"<div class='optionCount option_id" + options_id + " optionShopId" + basketData[i].products[j].shopbasket_id + "' id ='optionCount" + i + j + k +"'>"
								+"<input type='button' class = 'basic optionMinus' id = 'minus" + i + "_" + j + "' value='-' name ='minus' onclick = 'minusCnt(this)'>"
								+"<div class='result optionResult" + product_id + " optionResultCount" + productShopId + "' id ='result" + i + j + k+ "'>" + option_count + "</div>"
								+"<input type='button' class = 'basic optionsPlus' id = 'plus" + i + "_" + j + "' value='+' name ='plus' onclick = 'plusCnt(this)'>"
								+"<p style='display: none;'>" + deliveryType + "</p>"
							+"</div>"
								+"<p style='display: none' id='optionPrices" + i + j + k + "' cost='" + option_price + "'></p>"
								+"<p style='float: right; font-size: 18px;' id='optionTotalPrice" + i + j + k +"' class = 'shopbasketOptionPrice" + shopbasket_id[shopbasekt_cnt] + " basketPrice" + product_id + "'>" + ((basketData[i].products[j].product_price + option_price)*option_count).toLocaleString('en') + "원</p>"
							+"</div>"
						+"</div>"
				)
				
				if(option_names == null) {
					$('.optionsName'+i+j+k).text(basketData[i].products[j].product_name);
				}
				
				if(option_count == 1) {
					$('#minus' + i + "_" + j).attr('disabled', true);	
				}
				
				deliveryPrice(deliveryType, productShopId, deiveryMoney, deliveryOptionCount, deliveryPrices);
				
				}
				
		/* 선택옵션 가지고 오기 */
		if(basketData[i].products[j].select_options.length != 0){
			for(var n = 0; n < basketData[i].products[j].select_options.length; n++){
				
				var selectOptionCount = basketData[i].products[j].select_options[n].option_count;
				var selectOptionPrice = basketData[i].products[j].select_options[n].option_price;
				
				$('.basketSelectOptionLists'+i+j).append(
					"<div class='basketOption'>"
   						+"<div style='display: grid; grid-template-columns: 50% 50%;'>" 
   						+"<div style='width: 100%;'><p>" + basketData[i].products[j].select_options[n].option_name + "</p></div>"
	   					+"<div class='optionDelete' style='width: 100%; text-align: right;'><img class='optionDelte" + basketData[i].products[j].shopbasket_id + " selectOptionId = " + basketData[i].products[j].select_options[n].option_id  + "' id='selectOptionDel' src='../image/icon/delete.png'></div>"
   						+"</div>"
   						+"<div class='optionLists"+ i+ j+ n+"' style='height: 30px;'>"
	   						+"<div class='optionCount selectShopId" + basketData[i].products[j].shopbasket_id + " selectOptionId" + basketData[i].products[j].select_options[n].option_id + "' id ='optionCount" + i + j + n +"'>"
								+"<input type='button' class = 'select selectMinus' id = 'selectMinus" + i + "_" + j + "' value='-' name ='minus' onclick = 'minusCnt(this)'>"
								+"<div class='result' id ='SelectResult" + i + j + n+ "'>" + selectOptionCount + "</div>"
								+"<input type='button' class = 'select selectPlus' id = 'selectPlus" + i + "_" + j + "' value='+' name ='plus' onclick = 'plusCnt(this)'>"
							+"</div>"
							+"<p style='display: none' id='SelectOptionPrices" + i + j + n + "' cost='" + selectOptionPrice + "'></p>"
							+"<p style='float: right; font-size: 18px;' id='SelectBasketOption" + i + j + n +"' class = 'SelectBasketOption" + shopbasket_id[shopbasekt_cnt] + "'>" + (selectOptionCount*selectOptionPrice).toLocaleString('en') + "원</p>"
   						+"</div>"
					+"</div>"
					)
				
					if(selectOptionCount == 1) {
						$('#selectMinus' + i + "_" + j).attr('disabled', true);	
					}
				}
			}
				
		if(basketData[i].products[j].delivery_type == true){
			var productCount = basketData[i].products.length;
			var productFee = basketData[i].products[j].delivery_price;
			var DeliveryFee = productCount * productFee;
	 				
 				$('#shopFee'+i).text(DeliveryFee);
	 				
			} else if(basketData[i].products[j].delivery_type == false){
			
				$('#shopFee'+i).text(productFee);
				}
		
				TotalProductPrice(shopbasket_id[shopbasekt_cnt]);
				shopbasekt_cnt++;
				}
			}
		}
  	
  	function deliveryPrice(deliveryType, productShopId, deiveryMoney, deliveryOptionCount, deliveryPrices){
  		//상품별 배송비 계산
		if(deliveryType == true){
			$('.shopDeliveryFee'+productShopId).text("배송비 " + (deiveryMoney * deliveryOptionCount).toLocaleString('en') + "원");
		} else if(deliveryType == false){
			if(deliveryPrices == false){
					$('.shopDeliveryFee'+productShopId).text('무료배송');
			}else{
				$('.shopDeliveryFee'+productShopId).text("배송비 " + deiveryMoney.toLocaleString('en') +"원");
			}
		}
  	}
  	
  	
  	 function popSelect(i,j){
		var returnObject = basketData[i].products[j].options;
		var selectObject = basketData[i].products[j].select_options;
		var product_shop_id = basketData[i].products[j].shopbasket_id;
			
			
  		for(var k = 0; k < returnObject.length; k++){
			var option_count = returnObject[k].option_count;
			var option_price = returnObject[k].option_price;
			var option_names = returnObject[k].option_name;
			options_id = returnObject[k].option_id;
			var product_price = basketData[i].products[j].product_price;
			
			$('.basketOptionLists'+i+j).append(
				"<div class='basketOption'>"
					+"<div style='display: grid; grid-template-columns: 50% 50%;'>"
						+"<div style='width: 100%; text-align: left;'><p class='optionsName"+ i + j + k + " basketOptionsName" + product_id + "'>" + option_names + "</p></div>"
						+"<div class='optionDelete' style='width: 100%; text-align: right;'><img class='optionDelte" + product_shop_id + " optionid" + returnObject[k].option_id + "' id='optionDel' src='../image/icon/delete.png'></div>" 
					+"</div>"
					+"<div class='optionLists"+ i+ j+ k+"' style='height: 30px;'>"
						+"<div class='optionCount option_id" + options_id + " optionShopId" + product_shop_id + "' id ='optionCount" + i + j + k +"'>"
						+"<input type='button' class = 'basic optionMinus' id = 'minus" + i + "_" + j + "' value='-' name ='minus' onclick = 'minusCnt(this)'>"
						+"<div class='result optionResult" + product_id + "' id ='result" + i + j + k+ "'>" + option_count + "</div>"
						+"<input type='button' class = 'basic optionsPlus' id = 'plus" + i + "_" + j + "' value='+' name ='plus' onclick = 'plusCnt(this)'>"
					+"</div>"
						+"<p style='display: none' id='optionPrices" + i + j + k + "' cost='" + option_price + "'></p>"
						+"<p style='float: right; font-size: 18px;' id='optionTotalPrice" + i + j + k +"' class = 'shopbasketOptionPrice" + shopbasket_id[shopbasekt_cnt] + " basketPrice" + product_id + "'>" + ((product_price + option_price)*option_count).toLocaleString('en') + "원</p>"
					+"</div>"
				+"</div>"
			)
			
			if(option_names == null) {
				$('.optionsName'+i+j+k).text(basketData[i].products[j].product_name);
			}
			
			if(option_count == 1) {
				$('#minus' + i + "_" + j).attr('disabled', true);	
			}
			
			//상품별 배송비 계산 
			if(basketData[i].products[j].delivery_type == true){
				$('#shopFee'+i+j).text("배송비 " + (basketData[i].products[j].delivery_money * option_count).toLocaleString('en') + "원");
			}else if(basketData[i].products[j].delivery_type == false){
				if(basketData[i].products[j].delivery_price == false){
					$('#shopFee'+i+j).text('무료배송');
				}else{
					$('#shopFee'+i+j).text("배송비 " + basketData[i].products[j].delivery_money.toLocaleString('en') +"원");
				}
			}
		}
			
		//선택옵션 가지고 오기 
		if(selectObject.length != 0){
			for(var n = 0; n < selectObject.length; n++){
				var selectOptionCount = selectObject[n].option_count;
				var selectOptionPrice = selectObject[n].option_price;
				
				$('.basketSelectOptionLists'+i+j).append(
					"<div class='basketOption'>"
						+"<div style='display: grid; grid-template-columns: 50% 50%;'>" 
						+"<div style='width: 100%;'><p>" + selectObject[n].option_name + "</p></div>"
   					+"<div class='optionDelete' style='width: 100%; text-align: right;'><img class='optionDelte" + product_shop_id + " selectOptionId = " + selectObject[n].option_id  + "' id='selectOptionDel' src='../image/icon/delete.png'></div>"
						+"</div>"
						+"<div class='optionLists"+ i+ j+ n+"' style='height: 30px;'>"
   						+"<div class='optionCount selectShopId" + product_shop_id + " selectOptionId" + selectObject[n].option_id + "' id ='optionCount" + i + j + n +"'>"
							+"<input type='button' class = 'select selectMinus' id = 'selectMinus" + i + "_" + j + "' value='-' name ='minus' onclick = 'minusCnt(this)'>"
							+"<div class='result' id ='SelectResult" + i + j + n+ "'>" + selectOptionCount + "</div>"
							+"<input type='button' class = 'select selectPlus' id = 'selectPlus" + i + "_" + j + "' value='+' name ='plus' onclick = 'plusCnt(this)'>"
						+"</div>"
							+"<p style='display: none' id='SelectOptionPrices" + i + j + n + "' cost='" + selectOptionPrice + "'></p>"
							+"<p style='float: right; font-size: 18px;' id='SelectBasketOption" + i + j + n +"' class = 'SelectBasketOption" + shopbasket_id[shopbasekt_cnt] + "'>" + (selectOptionCount*selectOptionPrice).toLocaleString('en') + "원</p>"
						+"</div>"
				+"</div>"
				)
				
				if(selectOptionCount == 1) {
					$('#selectMinus' + i + "_" + j).attr('disabled', true);	
				}
				
			}
		}
  	} 
  	
    </script>
    <script>
    var ProductOptionPrice;
    var SelectOptionPrice;
	  	 /* 상품 옵션들의 각각의 가격 구하기 */	
    function productOptions(type, attrId) {
  		 
  		 var basketProductPrice;
  		 
  		 for (var i in product_price) {
  			 if(product_price[i].id == attrId) {
  		 		basketProductPrice = product_price[i].price; 
  			 }
  		 }
	   	 var payIdx = $(type).parent().attr('id');
	   	 payIdx = payIdx.replace("optionCount", "");
	   	 
	   	 var price = parseInt($('#optionPrices'+payIdx).attr('cost'));
	   	 var optionCount = parseInt($('#result'+payIdx).text());
	   	 
	   	 ProductOptionPrice = (price + basketProductPrice)*optionCount;
	   	 
	   	 $('#optionTotalPrice'+payIdx).text((ProductOptionPrice).toLocaleString('en') + "원");
    }
  	 
  	 /* 선택옵션들의 각각의 가격 구하기 */
  	 function SelectOptions(type, selectId){
  		 
  		 var payIdx = $(type).parent().attr('id');
	   	 payIdx = payIdx.replace("optionCount", "");
	   	 
  		var selectPrice = parseInt($('#SelectOptionPrices'+payIdx).attr('cost'));
	   	var SelectOptionCount = parseInt($('#SelectResult'+payIdx).text());
	   	
	   	SelectOptionPrice = selectPrice*SelectOptionCount;
	   
	    $('#SelectBasketOption'+payIdx).text((SelectOptionPrice).toLocaleString('en') + "원");
  	 }
  	 
  	 
  	 function TotalProductPrice(shopbasket_id){
  		 
  		 var total_price = 0;
  		 var product_total_price = 0;
  		 var select_total_price = 0;
  		 var deliveryFee = 0;
  		 
  		 $('.shopbasketOptionPrice'+shopbasket_id).each(function(){
  			product_total_price += parseInt($(this).text().replace("원", "").replaceAll(",", ""));
    	 })
    	 
    	  $('.SelectBasketOption'+shopbasket_id).each(function(){
  			select_total_price += parseInt($(this).text().replace("원", "").replaceAll(",", ""));
    	 })
    	 
    	 /* $('#productPrices').each(function(i){
    		 productPrice += parseInt($(this).text().replace("원", "").replaceAll(",", ""));
    	 }) */
    	 
    	 //total_price = optionTotal + productPrice;
    	 
    	 $('.shopbasketTotalPrice'+shopbasket_id).text((product_total_price + select_total_price).toLocaleString('en') + "원");
  		 
  	 }
  	 
	/* 사이드 네비에 체크된 총 상품금액 넣기 */
	 var sideTotal = 0;
  	 function SideTotalProduct(){
  		 sideTotal = 0;
  		 
  		 $('.TotalOptionPrice').each(function(i){
  			 var shopBasketId = $(this).attr('class').split(" ")[1].replace("shopbasketTotalPrice","");
  			 if($('#'+shopBasketId).is(':checked') == true) {
	  			 sideTotal += parseInt($(this).text().replace("원","").replaceAll(",",""));
  			 }
  		 })
				  	
  		 $('#productPriceTotal').text(sideTotal.toLocaleString('en') + "원");
  		
  		return sideTotal;
  	 }
  	 
  	 /* 사이드 네비에 총 배송비 넣기 */
  	 var deliveryTotal = 0;
  	 function SideDeliveryPrice(){
  		 deliveryTotal = 0;
  		 
  		 $('.ShopDelivery').each(function(i){
  			deliveryId = $(this).attr('class').split(" ")[1].replace("shopDeliveryFee","");
  			
  			if($('#'+deliveryId).is(':checked') == true && $(this).text() != "무료배송") {
  				deliveryTotal += parseInt($(this).text().replace("배송비","").replace("원","").replaceAll(",",""));
  			 }
  		 })
  		 $('#totalDelivery').text(deliveryTotal.toLocaleString('en') + "원");
  	 }
  	 
  	 /* 사이드 네비에 총 금액 넣기 */
  	 function SideAllTotal(){
		var sideAllPrice;
		
  		var productPrice = parseInt($('#productPriceTotal').text().replace("원","").replaceAll(",",""));
		var DeliveryPrice = parseInt($('#totalDelivery').text().replace("원","").replaceAll(",",""));
		//var discountPrice = parseInt($('#totalDiscount').text().replace("원","").replaceAll(",",""));
		
		sideAllPrice = productPrice + DeliveryPrice;
		
		$('#allTotalPrice').text(sideAllPrice.toLocaleString('en') + "원");
		
  	 }
  	  	 
  	 /* +버튼 눌렀을때 변화 */
	 function plusCnt(type)  {
   	 	var number = $(type).prev().text();
	   	number = parseInt(number) + 1;
	    
	   	var state = $(type).attr('class').split(" ")[0];
	    $(type).prev().text(number);
	    
	   	if(state == 'basic'){
		   	var attrId = $(type).attr("id").replace('plus', "");
	        	productOptions(type, attrId);
	        	
				var delivery_type = $('#deliveryFee'+attrId.replace("_","")).next().next().next().text();
				
				if(delivery_type == "true") {
		        	var delivery_prices = $('#deliveryFee'+attrId.replace("_","")).next().text();
					var product_shop_id = $(type).parents().parents().parents().parents().attr('idx');
					
					var string_fee = $('#deliveryFee'+attrId.replace("_","")).text();
					var regex = /[^0-9]/g;				
					var delevery_money = string_fee.replace(regex, "");	
					
			   		deliveryPrice(Boolean(delivery_type), product_shop_id, delevery_money, number, Boolean(delivery_prices));
				}
	        	
	   	} else if (state == 'select') {
		   	var selectId = $(type).attr("id").replace('selectPlus',"");	
	        	SelectOptions(type, selectId);
	   	}
	   
    	$(type).prev().prev().attr('disabled',false);
	   	
	    var shopbasket_id = $(type).parent().parent().parent().parent().attr("idx");
	   	    
        TotalProductPrice(shopbasket_id);
        SideTotalProduct();
        SideDeliveryPrice();
        SideAllTotal();
   	}
 	 
	 function minusCnt(type)  {
	   	var number = $(type).next().text();
   		
   		number = parseInt(number) - 1;
   		
       if (number < 1) {
    	   number = 1;
       }
       
       $(type).next().text(number);
       
   	   var state = $(type).attr('class').split(" ")[0];
	    if(state == 'basic'){
	   		var attrId = $(type).attr("id").replace('minus', "");
	   		productOptions(type, attrId);
	   		
			var delivery_type = $('#deliveryFee'+attrId.replace("_","")).next().next().next().text();
			
			if(delivery_type == "true") {
				
				var delivery_prices = $('#deliveryFee'+attrId.replace("_","")).next().text();
				var product_shop_id = $(type).parents().parents().parents().parents().attr('idx');
				
				var string_fee = $('#deliveryFee'+attrId.replace("_","")).text();
				var regex = /[^0-9]/g;				
				var delevery_money = string_fee.replace(regex, "");	
				
		   		deliveryPrice(Boolean(delivery_type), product_shop_id, delevery_money, number, Boolean(delivery_prices));
			}
	   		
	   	} else if (state == 'select') {
		   	var selectId = $(type).attr("id").replace('selectMinus',"");	
	        SelectOptions(type, selectId);
	   	}
   	   
       /* -버튼 위에 있는 값에 number 작성 */
       
       var shopbasket_id = $(type).parent().parent().parent().parent().attr("idx");
       
	       TotalProductPrice(shopbasket_id);
	       SideTotalProduct();
	       SideDeliveryPrice();
	       SideAllTotal();
	       
       }	
		
	</script>
	<script>
		var shopBasketId;
		var checkId;
		
		/* 선택삭제 클릭했을때 */
		$(document).on('click','#selectDelete',function(){
			var shopId = "";
			
			var checked_shopbasket = $('input[name="oneCheck"]:checked').length;
			
			$('input[name="oneCheck"]:checked').each(function(i) {
				checkId = $(this).attr('id');
				shopId += checkId;
				
				if(checked_shopbasket != (i+1)) {
					shopId += ",";
				}
				
			})
				deleteProduct(shopId);
			
			/* if($('input[name="oneCheck"]').is(':checked') == true){
				checkId = $('input[name="oneCheck"]:checked').attr('id');
				shopId += checkId;
				
				shopId += ",";
					console.log(checkId);
					
				deleteProduct();
			} */
		})
		
		var deletebasketId;
		var shopbasketLists;
		/* 상품에 있는 삭제 이미지 클릭했을때 */
		$(document).on('click','.basketDelete',function(){
			$('.deletePop').addClass('show');
			deletebasketId = $(this).attr('id');
			deleteCompanyId = $(this).attr('idx');
			shopbasketLists = $('.shopBasketList'+deleteCompanyId).children().length;
		})
		/* 장바구니 상품 삭제 */
		$(document).on('click','#productDelBtn',function(){
			var shopId = "";
			shopId += deletebasketId;
			
			if($('.OptionsList'+shopOptionId).children().length == 1){
				$.ajax({
					url : "../shopbaskets/option?shopbasket_id=" + shopOptionId + "&type=options&option_id=" + optionsId, // 컨트롤러 위치
					type : "DELETE",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
	    			},
					success : function(result){
						
						console.log(result);
						
						if(result.message == 'Success'){
							TotalProductPrice(shopbasket_id);
							readBasket();
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
			} else{
				if(shopbasketLists == 1){
					$('.companyList'+deleteCompanyId).remove();
				}else{
					$('.shopbasketBox'+deletebasketId).remove();
				}
				deleteProduct(shopId);
			}
			
			$('.deletePop').removeClass('show');
		})
		
		$(document).on('click','#close8',function(){
			$('.deletePop').removeClass('show');
		})
		$(document).on('click','.delCancelBtn',function(){
			$('.deletePop').removeClass('show');
		})
		
		var shopOptionId;
		var optionsId;
		/* 상품 옵션 삭제 */
		$(document).on('click','#optionDel',function(){
			shopOptionId = $(this).attr('class').split(" ")[0].replace("optionDelte","");
			optionsId = $(this).attr('class').split(" ")[1].replace("optionid","");
			
			if($('.OptionsList'+shopOptionId).children().length == 1){
				
				$('.deletePop').addClass('show');				
			
			} else{
				
				$.ajax({
					url : "../shopbaskets/option?shopbasket_id=" + shopOptionId + "&type=options&option_id=" + optionsId, // 컨트롤러 위치 
					type : "DELETE",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
	    			},
					success : function(result){
						
						console.log(result);
						
						if(result.message == 'Success'){
							TotalProductPrice(shopbasket_id);
							readBasket();
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
				
				$(this).parent().parent().parent().remove();
			}
			
		})
		
		$(document).on('click','#selectOptionDel',function(){
			var selectShopId;
			var selectOptionId;
			
			selectShopId = $(this).attr('class').split(" ")[0].replace("optionDelte","");
			selectOptionId = $(this).attr('class').split(" ")[1].replace("selectOptionId","");
			
			 $.ajax({
				url : "../shopbaskets/option?shopbasket_id=" + selectShopId + "&type=select_option&option_id=" + selectOptionId, // 컨트롤러 위치
				 type : "DELETE",
				// dataType : response 어떤 타입으로 받을지
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
    			},
				success : function(result){
					
					console.log(result);
					
					if(result.message == 'Success'){
						
						$(this).parent().parent().parent().remove();
						
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
			
	function deleteProduct(shopId){
		
		 $.ajax({
			url : "../shopbaskets?shopbasket_id=" + shopId, // 컨트롤러 위치 
			 type : "DELETE",
			// dataType : response 어떤 타입으로 받을지
			dataType : 'JSON',
			beforeSend: function (xhr) {
	            xhr.setRequestHeader("user", user_id);
   			},
			success : function(result){
				
				console.log(result);
				
				if(result.message == 'Success'){
					location.reload();
					
					//readBasket();
					//$('#allCheck').prop("checked",false);
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
	
	/* 장바구니 옵션 변경  */
	$(document).on('click','.optionMinus',function(){
		option_id = $(this).parent().attr('class').split(" ")[1].replace("option_id","");
		optionType = "options";
		optionShopId = $(this).parent().attr('class').split(" ")[2].replace("optionShopId","");
		optionSign = false;
		
		var optCnt = $(this).next().text();
		if(optCnt == 1) {
			$(this).attr('disabled', true)
		}
		
		optionChange();
	})
	
	$(document).on('click','.optionsPlus',function(){
		option_id = $(this).parent().attr('class').split(" ")[1].replace("option_id","");
		optionType = "options";
		optionShopId = $(this).parent().attr('class').split(" ")[2].replace("optionShopId","");
		optionSign = true;
		
		optionChange();
	})
	
	$(document).on('click','.selectMinus',function(){
		option_id = $(this).parent().attr('class').split(" ")[2].replace("selectOptionId","");
		optionType = "select_option";
		optionShopId = $(this).parent().attr('class').split(" ")[1].replace("selectShopId","");
		optionSign = false;
		
		var optCnt = $(this).next().text();
		if(optCnt == 1) {
			$(this).attr('disabled', true)
		} 
		optionChange();
		
	})
	
	$(document).on('click','.selectPlus',function(){
		option_id = $(this).parent().attr('class').split(" ")[2].replace("selectOptionId","");
		optionType = "select_option";
		optionShopId = $(this).parent().attr('class').split(" ")[1].replace("selectShopId","");
		optionSign = true;
		
		optionChange();
	})
	
	var option_id;
	var optionType;
	var optionShopId;
	var optionSign;
	
	/* 장바구니 옵션 변경 ajax */
	function optionChange(){
		
		var sendData = {
				type : optionType,
				option_id : option_id,
				shopbasket_id : optionShopId,
				sign : optionSign,
			}

		console.log(sendData);
		 $.ajax({
			 contentType: "application/json; charset=utf-8",
			 url : "../shopbaskets/option", // 컨트롤러 위치
			 type : "PUT",
			 beforeSend: function (xhr) {
	            xhr.setRequestHeader("user", user_id);
	        }, 
			 data : JSON.stringify(sendData),
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
		
	}
			
		/* 옵션추가 팝업에서 옵션 추가 확인버튼 클릭시 post */
		$(document).on('click','#addOptOk',function(){
			
			var optionLists = {};
 			$('.basicOpt').each(function() {
 				var option_id = $(this).attr('id');
 				var option_cnt = parseInt($('#popResult'+option_id).text());
 				optionLists[option_id.replace("_",",")] = option_cnt;
 			})
	 			
 			var selectOptionLists = {};
 			if($('.selectOpt').length != 0) {
 	 			$('.selectOpt').each(function() {
 	 				var option_id = $(this).attr('id');
 	 				var option_cnt = parseInt($('#popResult'+option_id).text());
 	 				selectOptionLists[option_id] = option_cnt;
 	 			})
 			}
			
			var sendData = {
				"product_id" : productId,
	 			"options" : optionLists,
	 			"select_options" : selectOptionLists
			}

			console.log(sendData);
			
			$.ajax({
				 contentType: "application/json; charset=utf-8",
				 url : "../shopbaskets", // 컨트롤러 위치
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
						$('.basketOptionPop').removeClass('show');
						readBasket();
						
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
			//popSelect(i,j);
			//BasketItems();
		})
			
	</script>
</body>
</html>