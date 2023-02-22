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
		.purchaseBtn{
			display: flex;
			flex-direction: column;
			justify-content : center;
		}
		.no{
			text-align: center;
			margin-top: 130px;
			font-family: pretendard;
			font-size: 22px;
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
			<li><a href='wishList'>위시리스트</a></li>
			<li><a href='recent'>최근본상품</a></li>
			<li><a href='review'>나의리뷰</a></li>
			<li><a href='giftBox'>선물함</a></li>
			<li style='background-color: #8996A0;'><a href='PurchaseHistory' style='color: white; text-decoration: underline'>상품구매내역</a></li>
			<li><a href='exchange'>교환&middot;반품내역</a></li>
			
		</ul>
		</div>
		<div class='wishContent'>
			<h4>상품구매내역</h4>
			<div class='productDetail'>
				
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
			            <button type="button" id='reviewBtn' onclick='location.href="WriteReview"'>리뷰 작성하기</button>
			        </div>
	 	 		</div>
	 	 	</div>
	    </div>
    
    <!-- 교환 반품신청 팝업 -->
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
	                		<button type='button' id='selectOkBtn'>선택완료</button>
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
	 		$('.basketPop').addClass('show');
	 		var purchase_id = $(this).attr('idx');
	 		$('#reviewBtn').attr('idx',purchase_id);
	 	})
	 	$(document).on('click','#reviewBtn',function(){
	 		var purchase_id = $(this).attr('idx');
	 		location.href="WriteReview?purchase=" + purchase_id;
	 	})
	 	
	 	$(document).on('click', '#close', function(){
	 		$('.basketPop').removeClass('show');
	 	})
	 	
	 	/* 교환반품 팝업 */
	    $(document).on('click', '#Ashow', function(){
	 		$('.exchangeApplication').addClass('show');
	 		var purchase_id = $(this).attr('idx');
	 	})
	 	
	 	$(document).on('click', '#close3', function(){
	 		$('.exchangeApplication').removeClass('show');
	 	})
	 	
	 	/* 주문상세 글자 클릭시 주문상세내역 페이지로 이동 */
	 	$(document).on('click','.purchaseDetail',function(){
	 		var oid = $(this).attr('id');
	 		location.href='purchaseDetail?OID=' + oid;
	 	})
	 	
	 	/* 교환반품 신청 팝업 선택완료 버튼 클릭시 */
	 	$(document).on('click','#selectOkBtn',function(){
	 		
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
	 	 
	 	/* 배송조회 버튼 클릭시 이동 */
	 	$(document).on('click','.deliveryBtn',function(){
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
    var user_id = '<%=id%>';
    
    	$(function(){
    		if(user_id == "null") {
				alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
				location.href = '../login/login';
			} else{
	    		$.ajax({
					url : "../purchase", // 컨트롤러 위치
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
							
							if(data == ""){
								$(".productDetail").append(
									"<div class='no'>"
										+"<p>구매하신 상품 내역이 없습니다.</p>"
									+"</div>"		
								)						
							} else{
								purchase();
							}
								
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
			}
    	})
    </script>
    <script>
    	function purchase(){
    		for(var i in data){
    			$('.productDetail').append(
   					"<div class='purchaseList'>"
    					+"<div class='purchaseDate'>"
    						+"<p>" + data[i].purchase_date + " <span class='purchaseDetail' id='" + data[i].OID + "'>주문상세</span></p>"
    					+"</div>"
    					+"<div class='itemList" + i + "'>"
    					
    					+"</div>"
    				+"</div>"	
    			)
    			for (var j in data[i].purchase_products){
    				$('.itemList'+i).append(
   						"<div class='purchaseItem'>"
    						+"<div class='purchaseImg'>"
    							+"<p>" + data[i].purchase_products[j].delivery_state + "</p>"
    							+"<img src='" + data[i].purchase_products[j].product_img_url + "'>"
    						+"</div>"
    						+"<div class='purchaseInfo'>"
    							+"<p class='purchaseStore'>" + data[i].purchase_products[j].company_name + "</p>"
    							+"<p class='purchaseName'>" + data[i].purchase_products[j].product_name + "</p>"
    							+"<p class='purchaseOption'>옵션: " + data[i].purchase_products[j].option_name + "</p>"
    							+"<p class='purchasePrice'>" + data[i].purchase_products[j].payment_charge.toLocaleString('en') + "원</p>"
    						+"</div>"
    						+"<div class='purchaseBtn'>"
    							+"<button type='button' id='Bshow' idx='" + data[i].purchase_products[j].purchase_id + "'>구매확정</button>"
    							+"<button type='button' id='Ashow' idx='" + data[i].purchase_products[j].purchase_id + "'>교환 &middot; 반품신청</button>"
    							+"<button type='button' class='deliveryBtn' idx='" + data[i].purchase_products[j].purchase_id + "'>배송조회</button>"
    						+"</div>"
    					+"</div>"
    				)
    			}
   			
    		}
    		
    	}
    </script>
</body>
</html>