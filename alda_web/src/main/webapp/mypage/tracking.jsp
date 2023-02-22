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
			<h4>배송조회</h4>
			<div class='courier'>
				<div class='courierImg'>
					<div style='border: 2px solid #D8DCE0; border-radius: 50%; width: 100px; height: 100px; text-align: center;'>
						<img src='../image/icon/courier.png' id='courierImg'> 
					</div>	
				</div>
				<div class='courierInfo'>
					<table>
						<tr>
							<td>택배사</td>
							<td id='courier'>00택배</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td id='courierTel'>0000-0000</td>
						</tr>
						<tr>
							<td>송장번호</td>
							<td id='InvoiceNumber'>0000000000</td>
						</tr>
					</table>
				</div>
			</div>
			<div class='paymentInfo'>
				<p class='paymentTitle'>배송정보</p>
				<table class='deliveryTable'>
					<tr>
						<td>성명</td>
						<td id='deliveryName'>김알다</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td id='deliveryTel'>010-0000-0000</td>
					</tr>
					<tr>
						<td>주소</td>
						<td id='deliveryAddress'>광주 동구 금남로 226-11, 3층</td>
					</tr>
					<tr>
						<td>요청사항</td>
						<td id='requestTerm'>문앞에 나둬주세요</td>
					</tr>
				</table>
				
			</div>
			<div class='payItem'>
					<div class='purchaseItem'>
						<div class='purchaseImg'>
							<p><span class='payitemDate'>2022.01.03</span>배송완료</p>
							<img src='../image/items/product1.png'>
						</div>
						<div class='purchaseInfo'>
							<p class='purchaseStore'>보니에가구</p>
							<p class='purchaseName'>프라제르 아쿠아텍스 4인용 소파</p>
							<p class='purchaseOption'>옵션: <span>스카이블루</span> | 수량: <span>1</span></p>
							<p class='purchasePrice'><span>499,000</span>원</p>
						</div>
						<div class='purchaseBtn'>
							<button type='button' id='Bshow'>구매확정</button>
							<button type='button' id='Ashow'>교환 &middot; 반품신청</button>
						</div>
					</div>
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
					            <button type="button" onclick='location.href="WriteReview"'>리뷰 작성하기</button>
					        </div>
		 	 		</div>
		 	 	</div>
   			 </div>
   			 
   			 <!-- 교환반품신청 팝업 -->
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
 		$('.basketPop').addClass('show');
 	})
 	
 	$(document).on('click', '#close', function(){
 		$('.basketPop').removeClass('show');
 	})
 	
 	/* 교환반품 팝업 */
    $(document).on('click', '#Ashow', function(){
 		$('.exchangeApplication').addClass('show');
 	})
 	
 	$(document).on('click', '#close3', function(){
 		$('.exchangeApplication').removeClass('show');
 	})
 	
 	/* 교환반품신청 팝업 선택완료 버튼 클릭시 */
     $(document).on('click','.exchangeBtn',function(){
    	 
	   	 if($('input[name=apply]:checked').length == 1 && $('input[name=check]:checked').length == 1){
		 		$('.exchangeApplication').removeClass('show');
 			}else{
 				if($('input[name=apply]:checked').length == 0){
 					alert('교환, 반품을 선택해주세요.');
 				} else if($('input[name=check]:checked').length == 0){
 					alert("교환, 반품 사유를 선택해주세요.");
 				}
 			}
	   	 
     })
     
     /* 교환반품신청 팝업 사유들 체크박스 1개만 선택 */
		 $(document).on('click','.reasonCheck',function(){
 			if($(this).prop('checked')){
 				$('.reasonCheck').prop('checked',false);
 				$(this).prop('checked',true);
 			}
	 	})
   	</script>
</body>
</html>