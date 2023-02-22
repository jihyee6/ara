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
	.tabCss{
		color: #727F8A; 
		border-bottom: 1px solid #727F8A; 
		font-weight: bold;
	}
	.faqtabNav{
		width: 61%;
		margin: 0px;
	}
	.faqTitle li:last-child{
		border-right: none;
	}

</style>

</head>
<body>
<%@include file="../header_noTop.jsp"%>
   <!-- <div class='topSubs'>
	   		<div class='topMenus'>
	   			<div class=topSubMenu>
			   		<h4 class='basketMenu'>더보기</h4>
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
			<li><a href='notice'>공지사항</a></li>
			<li><a href='giftcard'>선물하기</a></li>
			<li><a href='../menu/event'>이벤트</a></li>
			<li><a href='benefits'>회원등급혜택</a></li>
			<li style='background-color: #8996A0;'><a href='faq' style='color: white; text-decoration: underline'>FAQ</a></li>
			<li><a href='terms'>이용약관</a></li>
		</ul>
		</div>
		<div class='seemoreContent'>
			<h4>FAQ</h4>
				<div class='faqTitle tab'>
					<div class='tabnav faqtabNav'>
					<ul>
						<li><a class='tablinks faqtab' onclick="openMenu(event,'all')" id="defaultOpen">전체</a></li>
						<li><a class='tablinks faqtab' onclick="openMenu(event,'order')">주문 &middot; 결제</a></li>
						<li><a class='tablinks faqtab' onclick="openMenu(event,'exchange')">교환 &middot; 환불</a></li>
						<li><a class='tablinks faqtab' onclick="openMenu(event,'receipt')">영수증</a></li>
						<li><a class='tablinks faqtab' onclick="openMenu(event,'writeReview')">리뷰작성</a></li>
					</ul>
					</div>
				</div>
				
				<!-- 전체보기 탭 -->
				<div class='faqQuestionList tabcontent' id='all'>
					<div class='faqQuestion'>
						<div class='QuestionContent'>
							<p>[주문 &middot; 결제] 주문내역을 확인하고 싶어요.</p>
						</div>
						<div class='QuestionArr'>
							<img src='../image/icon/articleDown.png'>
						</div>
					</div>
					<div class='faqAnswer'>
						<p class='AnswerMark'>A.</p>
						<p class='Answer'>주문이 완료되면 알림톡으로 주문내역을 알려드립니다.<br>
						또한, [마이페이지>상품구매내역]에서 주문내역을 확인하실 수 있습니다.</p>
					</div>
					<div class='faqQuestion'>
						<div class='QuestionContent'>
							<p>[주문 &middot; 결제] 주문내역을 확인하고 싶어요.</p>
						</div>
						<div class='QuestionArr'>
							<img src='../image/icon/articleDown.png'>
						</div>
					</div>
					<div class='faqAnswer'>
						<p class='AnswerMark'>A.</p>
						<p class='Answer'>주문이 완료되면 알림톡으로 주문내역을 알려드립니다.<br>
						또한, [마이페이지>상품구매내역]에서 주문내역을 확인하실 수 있습니다.</p>
					</div>
					<div class='faqQuestion'>
						<div class='QuestionContent'>
							<p>[주문 &middot; 결제] 주문내역을 확인하고 싶어요.</p>
						</div>
						<div class='QuestionArr'>
							<img src='../image/icon/articleDown.png'>
						</div>
					</div>
					<div class='faqAnswer'>
						<p class='AnswerMark'>A.</p>
						<p class='Answer'>주문이 완료되면 알림톡으로 주문내역을 알려드립니다.<br>
						또한, [마이페이지>상품구매내역]에서 주문내역을 확인하실 수 있습니다.</p>
					</div>
					<div class='faqQuestion'>
						<div class='QuestionContent'>
							<p>[교환 &middot; 환불] 주문을 취소하고 싶어요.</p>
						</div>
						<div class='QuestionArr'>
							<img src='../image/icon/articleDown.png'>
						</div>
					</div>
						<div class='faqAnswer'>
						<p class='AnswerMark'>A.</p>
						<p class='Answer'>주문이 완료되면 알림톡으로 주문내역을 알려드립니다.<br>
						또한, [마이페이지>상품구매내역]에서 주문내역을 확인하실 수 있습니다.</p>
					</div>
				</div>			
				
				<!-- 주문,결제 탭 -->
				<div id='order' class='tabcontent'>
					<div class='faqQuestion'>
						<div class='QuestionContent'>
							<p>[주문 &middot; 결제] 주문내역을 확인하고 싶어요.</p>
						</div>
						<div class='QuestionArr'>
							<img src='../image/icon/articleDown.png'>
						</div>
					</div>
					<div class='faqAnswer'>
						<p class='AnswerMark'>A.</p>
						<p class='Answer'>주문이 완료되면 알림톡으로 주문내역을 알려드립니다.<br>
						또한, [마이페이지>상품구매내역]에서 주문내역을 확인하실 수 있습니다.</p>
					</div>
				</div>
				
				<!-- 교환환불탭 -->
				<div id='exchange' class='tabcontent'>
					<div class='faqQuestion'>
						<div class='QuestionContent'>
							<p>[주문 &middot; 결제] 주문내역을 확인하고 싶어요.</p>
						</div>
						<div class='QuestionArr'>
							<img src='../image/icon/articleDown.png'>
						</div>
					</div>
					<div class='faqAnswer'>
						<p class='AnswerMark'>A.</p>
						<p class='Answer'>주문이 완료되면 알림톡으로 주문내역을 알려드립니다.<br>
						또한, [마이페이지>상품구매내역]에서 주문내역을 확인하실 수 있습니다.</p>
					</div>
				</div>
				
				<!-- 영수증 탭 -->
				<div id='receipt' class='tabcontent'>
					<div class='faqQuestion'>
						<div class='QuestionContent'>
							<p>[주문 &middot; 결제] 주문내역을 확인하고 싶어요.</p>
						</div>
						<div class='QuestionArr'>
							<img src='../image/icon/articleDown.png'>
						</div>
					</div>
					<div class='faqAnswer'>
						<p class='AnswerMark'>A.</p>
						<p class='Answer'>주문이 완료되면 알림톡으로 주문내역을 알려드립니다.<br>
						또한, [마이페이지>상품구매내역]에서 주문내역을 확인하실 수 있습니다.</p>
					</div>
				</div>
				
				<!-- 리뷰작성 탭 -->
				<div id='writeReview' class='tabcontent'>
					<div class='faqQuestion'>
							<div class='QuestionContent'>
								<p>[주문 &middot; 결제] 주문내역을 확인하고 싶어요.</p>
							</div>
							<div class='QuestionArr'>
								<img src='../image/icon/articleDown.png'>
							</div>
						</div>
						<div class='faqAnswer'>
							<p class='AnswerMark'>A.</p>
							<p class='Answer'>주문이 완료되면 알림톡으로 주문내역을 알려드립니다.<br>
							또한, [마이페이지>상품구매내역]에서 주문내역을 확인하실 수 있습니다.</p>
						</div>
				</div>	

		</div>
		
	</main>
 	<%@include file="../footer.jsp"%>
 	
	<script>
	/*  $(document).on('click','.faqQuestion', function(){
			if($('.faqAnswer').css('display') == 'none'){
				$(this).next().css('display', 'block');
			}else{
				$(this).next().css('display','none');
			}
		}) */
		
		/* 더보기 탑 메뉴 */
		$(function() {
		    	$('.topSubMenu').append(
		    		"<h4 class='basketMenu'>더보기</h4>"		
		    	);
	    })
		
	    /* 공지사항 클릭시 답변 나오기 */
		$('.faqQuestion').click(function(){
			$(this).next().toggle();
		})

		
		$(document).on('click','.tablinks',function(){
			$('.tablinks').removeClass('tabCss');
			$(this).addClass('tabCss');
		})
		
	</script>
	 	<script>
	 	function openMenu(evt, tabMenu) {
			var i, tabcontent, tablinks;
				  tabcontent = document.getElementsByClassName("tabcontent");
				  for (i = 0; i < tabcontent.length; i++) {
				   		 tabcontent[i].style.display = "none";
					}			
				  tablinks = document.getElementsByClassName("tablinks");
					  for (i = 0; i < tablinks.length; i++) {
						    tablinks[i].className = tablinks[i].className.replace(" active", "");
						  }
						  document.getElementById(tabMenu).style.display = "block";
						  evt.currentTarget.className += " active";
						}
	    document.getElementById("defaultOpen").click();
 	</script>
</body>
</html>