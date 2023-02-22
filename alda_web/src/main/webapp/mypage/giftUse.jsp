<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>ARA</title>
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
			<li style='background-color: #8996A0;'><a href='giftBox' style='color: white; text-decoration: underline'>선물함</a></li>
			<li><a href='PurchaseHistory'>상품구매내역</a></li>
			<li><a href='exchange'>교환&middot;반품내역</a></li>
			
		</ul>
		</div>
		<div class='wishContent'>
			<h4>선물사용</h4>
				<div class='giftBoxSender'>
					<div class='exchageItem'>
						<div class='exchangeImg'>
							<img src='../image/items/product1.png'>
						</div>
						<div class='exchangeInfo'>
							<p class='giftSender'>FROM.<span>000</span>님</p>
							<p class='giftStore'>보니에가구</p>
							<p class='purchaseName'>프라제르 아쿠아텍스 4인용 소파</p>
							<p class='purchaseOption'>옵션: <span>스카이블루</span> | 수량: <span>1</span></p>
							<p class='giftPrice'><span>499,000</span>원</p>
						</div>
					</div>
				</div>
				<div class='senderInfo'>
					<p class='senderInfoTxt'>주문자정보</p>
					<table class='senderInfoTable'>
						<tr>
							<td>성명</td>
							<td><input class='input1 infoInput' type='text' id='orderName'></td>
						</tr>
						<tr>
							<td>연락처</td>
							<td><input class='input1 infoInput' type='tel' id='orderNum' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g,'$1');"/></td>
						</tr>	
					</table>	
				</div>
				<div class='senderInfo'>
					<p class='senderInfoTxt'>배송지정보</p>
					<table class='senderInfoTable'>
						<tr>
							<td>성명</td>
							<td><input class='input1 infoInput' type='text' id='deliveryName'></td>
						</tr>
						<tr>
							<td>연락처</td>
							<td><input class='input1 infoInput' type='tel' id='deliveryNum' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g,'$1');"/></td>
						</tr>	
						<tr>
							<td>주소</td>
							<td><input class='input1 infoInput' type='text' id='zip' readonly><button class='postCodeBtn' type='button'>우편번호 검색</button>
								<input class='input2 infoInput' id ='addr1' style='margin: 12px auto;' type='text' readonly>
							</td>
						</tr>
						<tr>
							<td>상세주소</td>
							<td><input class='input2 infoInput' type='text' id ='addr2'></td>
						</tr>
						<tr>
							<td>요청사항</td>
							<td><select class='orderDeliveryOption'>
								<option value='' selected>요청사항을 입력해주세요</option>
								<option value=''>배송 전에 미리 연락 바랍니다.</option>
								<option value=''>부재시 경비실에 맡겨 주세요.</option>
								<option value=''>부재시 전화 주시거나 문자 남겨 주세요.</option>
							</select></td>
						</tr>		
					</table>	
				</div>
				
				<div class='giftUseAgree'>
					<label><input type='checkbox' class='agreeCheck'> 개인정보 처리방침 동의(필수)</label>
					<div class='giftUseAgreeBtn' style='width: 148px; margin: 20px auto;'>
						<button type='button' class='receiveBtn'>선물받기</button>
					</div>
				</div>
			</div>
		
	</main>
 	<%@include file="../footer.jsp"%>
 	<script>
 	  $(function() {
 	    	$('.topSubMenu').append(
 	    		"<h4 class='basketMenu'>마이페이지</h4>"		
 	    	);
 	    })
 	
		$(document).on('click','.receiveBtn',function(){
			if($('.infoInput').val() == ''){
				alert('주문자 정보를 입력하세요.');
			} else if($('.agreeCheck').is(':checked') == false){
				alert('개인정보 처리방침을 동의해주세요.');
				$('.agreeCheck').focus();
			} else{
				location.href='giftComplete';
			}
		})
		
		/* 우편번호 검색하기 */
		$(document).ready(function(){ 
			$(".postCodeBtn").on("click",function(){
				new daum.Postcode({ 
				oncomplete: function(data) { 
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 
					
					// 각 주소의 노출 규칙에 따라 주소를 조합한다. 
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다. 
					var fullAddr = ''; // 최종 주소 변수 
					var extraAddr = ''; // 조합형 주소 변수 
					
					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다. 
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우 
						fullAddr = data.roadAddress; 
					} else { // 사용자가 지번 주소를 선택했을 경우(J) 
						fullAddr = data.jibunAddress; 
					} 
					
					// 사용자가 선택한 주소가 도로명 타입일때 조합한다. 
					if(data.userSelectedType === 'R'){ 
						//법정동명이 있을 경우 추가한다. 
						if(data.bname !== ''){ 
							extraAddr += data.bname; 
						} 
						// 건물명이 있을 경우 추가한다. 
						if(data.buildingName !== ''){ 
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName); 
						} 
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다. 
						fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : ''); 
					} 
					
					// 우편번호와 주소 정보를 해당 필드에 넣는다. 
					document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용 
					document.getElementById('addr1').value = fullAddr; // 커서를 상세주소 필드로 이동한다. 
					document.getElementById('addr2').focus(); 
				} 
			}).open(); 
			});
		}); 
	</script>
	
</body>
</html>