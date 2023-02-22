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
		margin: 40px auto;
	}
</style>
</head>
<body>
<% String oid = request.getParameter("OID"); %>
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
			<li><a href='wishList'>위시리스트</a></li>
			<li><a href='recent'>최근본상품</a></li>
			<li><a href='review'>나의리뷰</a></li>
			<li><a href='giftBox'>선물함</a></li>
			<li style='background-color: #8996A0;'><a href='PurchaseHistory' style='color: white; text-decoration: underline'>상품구매내역</a></li>
			<li><a href='exchange'>교환&middot;반품내역</a></li>
			
		</ul>
		</div>
		<div class='wishContent'>
			<h4>주문상세</h4>
			<p class='payNumber'><span id='orderDate'>-</span> | 주문번호 : <span id='orderNum'>-</span></p>
			<div class='paymentInfo'>
				<p class='paymentTitle'>결제정보</p>
				<table class='payTable'>
					<tr>
						<td>상품금액</td>
						<td><span id='productPrice'>0</span>원</td>
					</tr>
					<tr>
						<td>배송금액</td>
						<td><span id='deliveryFee'>0</span>원</td>
					</tr>
					<tr>
						<td>할인금액</td>
						<td><span id='discountPrice'>0</span>원</td>
					</tr>
					<!-- <tr>
						<td>결제수단</td>
						<td id='paymentMethod'></td>
					</tr> -->
				</table>
				<div class='totalPayPrice'>
					<p style='font-size: 18px; margin-top: 48px;'>총 결제금액</p>
					<p style='font-size: 28px;'><span id='totalPrice'>0</span>원</p>
				</div>
			</div>
			<div class='paymentInfo'>
				<p class='paymentTitle'>배송정보</p>
				<table class='deliveryTable'>
					<tr>
						<td>성명</td>
						<td id='deliveryName'></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td id='deliveryTel'></td>
					</tr>
					<tr>
						<td>주소</td>
						<td id='deliveryAddress'></td>
					</tr>
					<tr>
						<td>요청사항</td>
						<td id='requestTerm'></td>
					</tr>
				</table>
				
			</div>
			<!-- 구매한 상품 목록 -->
			<div class='payItem'>
				
			</div>
		</div>
		
	</main>
 	<%@include file="../footer.jsp"%>
 		<!-- 구매확정 팝업 -->
	 	 <div class="basketPop">
	 	 	<div class='window'>
	 	 		<div class='popup' style='height: 162px;'>
		 	 		<!-- <img style='margin: 20px auto;' src="../image/icon/basketMessage.png"> -->
				        <p class="basketMessage">구매확정이 완료되었습니다.</p>
				        <div class="basketPopBtn">
				            <button type="button" id='close'>닫기</button>
				            <button type="button" id='reviewBtn'>리뷰 작성하기</button>
				        </div>
	 	 		</div>
	 	 	</div>
	    </div>
	    
	    <!-- 교환반품 팝업 -->
       <div class='exchangeApplication'>
	        <div class="window">
	            <div class="popup" style="width: 468px; height: 600px;">
	                <div class='moreViewContent'>
	                    <img id='close3' src="../image/icon/whiteDelete.png">
	                    <div class='moreViewTitle'>
	                        <p>교환 &middot; 반품신청</p>
	                    </div>
	                   <div class='exchangeRadio'>
	                   		<label><input type='radio' name='apply' value='exchange'> 교환</label>
	                   		<label><input type='radio' name='apply' value='refund'> 반품</label>
	                   </div>
	                   <div class='exchangeReasons'>
	                   	<p>사유</p>
	                   	<div class='exchangeCheckBoxs'>
	                   		<label><input type='checkbox' name='check' class='reasonCheck'> 배송된 장소에 박스가 분실됨</label>
	                   		<label><input type='checkbox' name='check' class='reasonCheck'> 주문과 다른 주소로 배송됨</label>
	                   		<label><input type='checkbox' name='check' class='reasonCheck'> 상품의 구성품이 들어있지 않음</label>
	                   		<label><input type='checkbox' name='check' class='reasonCheck'> 상품이 설명과 다름</label>
	                   		<label><input type='checkbox' name='check' class='reasonCheck'> 주문과 다른 상품이 배송됨</label>
	                   		<label><input type='checkbox' name='check' class='reasonCheck'> 상품이 파손됨/하자있음</label>
	                   		<label><input type='checkbox' name='check' class='reasonCheck'> 단순변심</label>
	                   		<label><input type='checkbox' name='check' class='reasonCheck'> 기타 <input class='checkboxText' type='text'></label>
	                   	</div>
	                   </div>
	                	<div class='exchangePopBtn' style='width: 148px;'>
	                		<button type='button' class='exchangeBtn'>선택완료</button>
	                	</div>
	                </div>
	        </div>
	    </div>
	</div>
	
	<script>
 	  $(function() {
 	    	$('.topSubMenu').append(
 	    		"<h4 class='basketMenu'>마이페이지</h4>"		
 	    	);
 	    })
 	</script>
 	<script>
 		/* 구매확정 팝업 */
	 	$(document).on('click', '#Bshow', function(){
	 		var purchase_id = $(this).attr('idx');
	 		$('.basketPop').addClass('show');
	 		$('#reviewBtn').attr('idx',purchase_id);
	 	})
	 	$(document).on('click','#reviewBtn',function(){
	 		var purchase_id = $(this).attr('idx');
	 		location.href='WriteReview?purchase=' + purchase_id;	 	
	 	})
	 	
	 	$(document).on('click', '#close', function(){
	 		$('.basketPop').removeClass('show');
	 	})
	 	
	 	
	 	/* 교환반품 팝업 */
 	    $(document).on('click', '#Ashow', function(){
 	    	var purchase_id = $(this).attr('idx');
	 		$('.exchangeApplication').addClass('show');
	 	})
	 	
	 	$(document).on('click', '#close3', function(){
	 		$('.exchangeApplication').removeClass('show');
	 	})
	 	
	 	$(document).on('click','.exchangeBtn',function(){
	 		if($('input[name=apply]:checked').length == 1 && $('input[name=check]:checked').length == 1){
		 		$('.exchangeApplication').removeClass('show');
	 		} else{
 				if($('input[name=apply]:checked').length == 0){
 					alert('교환, 반품을 선택해주세요.');
 				} else if($('input[name=check]:checked').length == 0){
 					alert("교환, 반품 사유를 선택해주세요.");
 				}
 			}
	 	})
	 	
	 	/* 배송조회 버튼 클릭시 */
	 	$(document).on('click','.trackingBtn',function(){
	 		var purchase_id = $(this).attr('idx');
	 		
	 		location.href='tracking?purchase=' + purchase_id;
	 	})
	 	
	 	/* 교환반품신청 팝업 사유들 체크박스 1개만 선택 */
		 $(document).on('click','.reasonCheck',function(){
 			if($(this).prop('checked')){
 				$('.reasonCheck').prop('checked',false);
 				$(this).prop('checked',true);
 			}
	 	})
 	</script>
 	<script>
 	var oid = '<%=oid%>';
 	var user_id = '<%=id%>';
 	
 		$(function(){
 			$.ajax({
 				url : "../purchase-detail?OID=" + oid, // 컨트롤러 위치
 				type : "GET",
 				dataType : 'JSON',
 				beforeSend: function (xhr) {
 		            xhr.setRequestHeader("user", user_id);
 		        },
 				success : function(result){
 					data = result.data;
 					console.log(data);
 					
 					userInfo = data.user_info;
 					discountFee = data.coupon_charge + data.point_charge + data.giftcard_charge;
 					productData = data.purchase_products;
 					
 					$('#orderNum').text(oid);
 					$('#orderDate').text(data.purchase_date);
 					$('#orderNum').text(data.purchase_id);
 					$('#productPrice').text(data.product_price.toLocaleString('en'));
 					$('#deliveryFee').text(data.delivery_price.toLocaleString('en'));
 					$('#discountPrice').text(discountFee.toLocaleString('en'));
 					$('#totalPrice').text(data.payment_charge.toLocaleString('en'));
 					$('#deliveryAddress').text(data.delivery_address);
 					
 					if(data.delivery_request == ""){
						$('#requestTerm').text("-"); 						
 					} else{
	 					$('#requestTerm').text(data.delivery_request);
 					}
 					
 					
 					$('#deliveryName').text(userInfo.name);
 					$('#deliveryTel').text(userInfo.tel);
 					
 					payItems();
 					
 					return false;
 				},
 				error : function(){
 					alert("검색실패");
 					return false;
 				}
 			})
 		})
 		
 		function payItems(){
 			for(var i in productData){
 				$('.payItem').append(
					"<div class='purchaseItem'>"
						+"<div class='purchaseImg'>"
							+"<p><span class='payitemDate'>2022.01.03</span>" + productData[i].delivery_state + "</p>"
							+"<img src='" + productData[i].product_img_url + "'>"
						+"</div>"
						+"<div class='purchaseInfo'>"
							+"<p class='purchaseStore'>" + productData[i].company_name + "</p>"
							+"<p class='purchaseName'>" + productData[i].product_name + "</p>"
							+"<p class='purchaseOption'>옵션: " + productData[i].option_name + "</p>"
							+"<p class='purchasePrice'><span>" + productData[i].payment_charge.toLocaleString('en') + "</span>원</p>"
						+"</div>"
						+"<div class='purchaseBtn'>"
							+"<button type='button' id='Bshow' idx='" + productData[i].purchase_id + "'>구매확정</button>"
							+"<button type='button' id='Ashow' idx='" + productData[i].purchase_id + "'>교환 &middot; 반품신청</button>"
							+"<button type='button' class='trackingBtn' idx='" + productData[i].purchase_id + "'>배송조회</button>"
						+"</div>"
					+"</div>"	
 				)
 			}
 		}
 	</script>
</body>
</html>