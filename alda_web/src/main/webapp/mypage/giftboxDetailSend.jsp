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
		.cancelBtn{
			width: 64px;
			height: 26px;
			background-color: white;
			border: 1px solid #707070;
			font-size: 12px;
			color: #242424;
			font-family: NotoSans;
			margin-left: 10px;
		}
		.sendGiftState{
			font-size: 14px;
			font-weight: 600;
			font-fmaily: NotoSans;
		}
		.basketMessage{
		margin: 36px auto;
		font-size: 18px;
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
			<li style='background-color: #8996A0;'><a href='giftBox' style='color: white; text-decoration: underline'>선물함</a></li>
			<li><a href='PurchaseHistory'>상품구매내역</a></li>
			<li><a href='exchange'>교환&middot;반품내역</a></li>
			
		</ul>
		</div>
		<div class='wishContent'>
			<h4>선물함</h4>
				<div class='giftBoxSender'>
					<div class='exchageItem'>
						<div class='exchangeImg'>
							<img src='../image/items/product1.png'>
						</div>
						<div class='exchangeInfo'>
							<p class='giftSender'>To.<span id='sendName'>000</span>님</p>
							<p class='giftStore'>보니에가구</p>
							<p class='purchaseName'>프라제르 아쿠아텍스 4인용 소파</p>
							<p class='purchaseOption'>옵션: <span>스카이블루</span> | 수량: <span>1</span></p>
							<p class='giftPrice'><span id='giftPrice'>499,000</span>원</p>
						</div>
					</div>
				</div>
			
					<div class='paymentInfo'>
					<p class='paymentTitle'>선물정보</p>
					<table class='deliveryTable'>
						<tr>
							<td>받는분</td>
							<td id='recipient_name'>김알다</td>
						</tr>
						<tr>
							<td>연락처</td>
							<td id ='recipient_phone'>010-0000-0000</td>
						</tr>
						<tr>
							<td>유효기간</td>
							<td id='validity'>2022.12.31</td>
						</tr>
						<tr>
							<td>선물상태</td>
							<td><span class='sendGiftState'>사용전</span>
								<button type='button' class='cancelBtn'>취소하기</button>
							</td>
						</tr>
					</table>
					
				</div>
					<div class='paymentInfo'>
					<p class='paymentTitle'>구매정보</p>
					<table class='deliveryTable'>
						<tr>
							<td>구매번호</td>
							<td id='purchaseNumber'>000000000</td>
						</tr>
						<tr>
							<td>선물구매일</td>
							<td id='purchaseDate'>2022.01.01</td>
						</tr>
						<tr>
							<td>결제수단</td>
							<td id='payMethod'>신용카드</td>
						</tr>
						<tr>
							<td>총 결제금액</td>
							<td style='font-weight: bold;'><span id='payPrice'>179,000</span>원</td>
						</tr>
					</table>
					
				</div>
				
				<div class='giftNotice'>
					<div class='giftInfo' style='border-bottom: 1px solid #CCCCCC;'>
						<div class='giftNoticeTxt'><p>이용안내</p></div>
						<div class='giftNoticeImg'><img src='../image/icon/downPass.png'></div>
					</div>
					<div class='infoResult'>
						<ul style='font-size: 14px; font-family: NanumSquare_ac; line-height: 22px;'>
							<li>- 본 상품은 ARA 앱, 전용 홈페이지에서만 사용 가능합니다.</li>
							<li>- 본 상품은 유효기간이 있으니 숙지해주시기 바랍니다.</li>
						</ul>
					</div>
					<div class='giftInfo'>
						<div class='giftNoticeTxt'><p>환불/취소 정책 및 방법</p></div>
						<div class='giftNoticeImg'><img src='../image/icon/downPass.png'></div>
					</div>
					<div class='infoResult'>
						<ul style='font-size: 14px; font-family: NanumSquare_ac; line-height: 22px;'>
							<li>- 유효기간 이내 환불 요청시 결제금액의 100% 환불 가능합니다.</li>
							<li>- 유효기간 이후 환불 요청시 결제금액의 90% 환불 가능합니다.</li>
							<li>- 유효기간 이내 환불금액은 구매자에게 환불됩니다.</li>
							<li>- 유효기간 이후 환불금액은 수신자에게 환불됩니다.</li>
							<li>- 일부금액 사용 후에는 환불이 되지 않습니다.</li>
							<li>- 부분환불은 불가능합니다.</li>
						</ul>
					</div>
				</div>
			
		</div>
	</main>
 	<%@include file="../footer.jsp"%>
 	<div class="basketPop">
 	 	<div class='window'>
 	 		<div class='popup' style='height: 153px;'>
		        <p class="basketMessage">선물 취소시 선물사용이 불가능합니다.<br>취소하시겠습니까?</p>
		        <div class="basketPopBtn">
		            <button type="button" style='margin-right: 18px;' id='close'>취소</button>
		            <button type="button" id='deleteBtn'>확인</button>
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
	    
	    $('.giftInfo').click(function(){
			$(this).next().toggle();
		})
    </script>
	<script>
		$(function(){
			if($('.sendGiftState').text() == '사용전'){
				$('.sendGiftState').css('color','#3399FF');
			} else if($('.sendGiftState').text() == '사용완료'){
				$('.sendGiftState').css('color','#FF0404');
				$('.cancelBtn').css('display','none');
			}	
		})
		
			/* 삭제하기 팝업 */
		$(document).on('click','.cancelBtn',function(){
			$('.basketPop').addClass('show'); 			
		})
		$(document).on('click','#close',function(){
			$('.basketPop').removeClass('show');
		})
		$(document).on('click','#deleteBtn',function(){
			$('.basketPop').removeClass('show');
		})
	</script>
</body>
</html>