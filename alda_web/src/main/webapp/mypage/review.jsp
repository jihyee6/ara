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
	.writingPoint{
		width: 100%;
		height: 94px;
		border-top: 1px solid #707070;
		border-bottom: 1px solid #707070;
		text-align: center;
		line-height: 94px;
		margin: 24px auto;
	}
	.writingPoint p{
		font-size: 20px;
		color: #242424;
		font-family: NotoSansR;
	}
	.writingPoint p span{
		color: #E75A00;
	}
	
	.myReview{
		margin: 22px auto;
	}
	
	.deleteReview{
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100vh;
		background-color: rgba(0, 0, 0, 0.3);
		z-index: 1000;
		z-index: -1;
		opacity: 0;
	}
	
	.show {
		opacity: 1;
		z-index: 1000;
		transition: all .5s;
	}
	
	.window {
		position: relative;
		width: 100%;
		height: 100%;
	}
	
	.popup {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		background-color: #ffffff;
		border-radius: 15px;
		/* 임시 지정 */
		width: 900px;
		height: 820px;
		/* 초기에 약간 아래에 배치 */
		transform: translate(-50%, -40%);
	}
	.deleteReview.show >.window> .popup {
		width: 530px;
		height: 300px;
	}
	.show .popup {
		transform: translate(-50%, -50%);
		transition: all .5s;
	}
	
	.deleteAlert{
	    text-align: center;
    }
	.deleteAlert img{
	     width: 86px;
	     height: 86px;
	     margin-top: 22px;
	 }   
	
	 .deleteText{
	 	 margin: 35px auto;
	     line-height: 33px;
	     font-size: 24px;
	     color: #707070;
	     font-family: NanumSquare_ac;
	     font-weight: bold;
	 }
	
	 .deleteButton button{
	    width: 112px;
	    height: 48px;
	    margin-right: 10px;
	    font-size: 20px;
	    font-family: NanumSquare_ac;
	    background-color: white;
	    border: 2px solid #979797;
	    color: #707070;
	    border-radius: 8px;
	    cursor: pointer;
	 }
	 
	 .pageNum.active{
		color: #070707;
		font-weight: 600;
		font-size: 18px;
	}
	
	.pageNum {
		margin: 4px;
		padding: 0px 6px 2px 6px;
		cursor: pointer;
		background: white;
		color: #A2A2A2;
		font-size: 18px;
	}

	.inner img{
		height: 16px;
	}
	
	.reviewWriteBtn{
		display: grid;
		align-items: center;
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
				<li style='background-color: #8996A0;'><a href='review' style='color: white; text-decoration: underline'>나의리뷰</a></li>
				<li><a href='giftBox'>선물함</a></li>
				<li><a href='PurchaseHistory'>상품구매내역</a></li>
				<li><a href='exchange'>교환&middot;반품내역</a></li>
			</ul>
		</div>
		<div class='wishContent'>
			<h4>나의리뷰</h4>
			<div class="tab">
				<div class="selectmenu tabnav">
					<div class="tablinks" onclick="openMenu(event,'reviewed')" id="defaultOpen">작성한 리뷰</div>
					<div class="tablinks" onclick="openMenu(event,'WritingReview')">작성 가능 리뷰</div>  
			    </div>		
			</div>
			
			<!-- 작성한 리뷰 탭 -->
			<div id='reviewed' class='tabcontent'>
			<div class='reviewCount' style='margin: 12px auto;'>
				<p>작성개수: <span id='reviewCount'>0</span>개</p>
			</div>
				<div class='myReviewList'>
					<!-- <div class='reviewLists'>
						<div class='myReview'>
							<div class='myReviewItem'>
								<h5 class='ReviewItemName'>프라제르 아쿠아텍스 4인용 소파</h5>
								<p class='reviewItemOption'>색상: <span>파인그레이</span> | 사이즈: <span>정면 -270cm*88cm, 옆-78.1cm</span></p>
								<p class='reviewWriteDate'>2021.09.01</p>
							</div>
							<div class='myReviewBtn'>
								<button type='button' style='border: 1px solid #727F8A; color: #727F8A;' class='modifyBtn'>수정하기</button>
								<button type='button'>삭제하기</button>
							</div>
						</div>
						<div class="MyReviewText">
							<p>딱딱한 느낌 좋아해서 후기 딱딱하다는건 알았지만 앉아있는 부분이 심각하게 작아요
							여잔데 누어있기 좀 불편 뒤척 거릴수 없음 생각보다 전체적인 소파사이즈가 작아요
							그래도 쿠션감은 생각했던게 맞음</p>
							<img src='../image/items/infoItems.png'>
						</div>
					</div> -->
					
				</div>
				<div class="paging">
					 <div class="pagination inner" id='pagination' style='text-align: center;'>
					 </div>
				 </div>
			</div>
			<!-- 작성가능 리뷰 탭 -->
			<div id='WritingReview' class='tabcontent'>
			<!-- 	<div class="pointAd">
					<img src='../image/items/pointAd.png'>
				</div> -->
				<div class='writingPoint'>
					<p>작성 완료시 적립 포인트 : <span>200P</span></p>
				</div>
				<div class='WritingReviewList'>
					<div class='reviewCount' style='margin: 12px auto;'>
						<p>작성 가능 개수: <span id='reviewAbleCount'>0</span>개</p>
					</div>
					<div class='WritingReviewItem'>
					<!-- <div class='myReview'>
							<div class='myReviewItem'>
								<h5 class='reviewItemName'>T402HF 오피스/학생 매쉬의자</h5>
								<p class='reviewItemOption'>옵션: <span>그레이</span> | 수량: <span>1</span></p>
								<p class='reviewWriteDate'>2021.09.01</p>
							</div>
							
							<div class='reviewWriteBtn'>
								<button type='button' style='border: 1px solid #727F8A; color: #727F8A;' class='WriteReviewBtn'>리뷰작성</button>
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</main>
 	<%@include file="../footer.jsp"%>
 	<!-- 리뷰삭제 팝업 -->
		<div class="deleteReview">
		    <div class="window">
		        <div class="popup">
		            <div class="deleteAlert">
		                <img src="../image/icon/grayIcon.png">
		                <div class="deleteText">
		                    <p>리뷰를 삭제하시겠습니까?</p>
		                </div>
		                <div class="deleteButton">
		                    <button type="button" onclick="$('.deleteReview').removeClass('show')">뒤로가기</button>
		                    <button type="button" onclick="reviewDelete()" class='reviewDeleteBtn' style="background-color: #727F8A; border: none; color: white;">삭제하기</button>
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
 	    
 	    $(document).on('click','.WriteReviewBtn',function(){
 	    	var purchaseId = $(this).attr('id');
 	    	location.href = 'WriteReview?purchase=' + purchaseId;
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
 	
	    /* 리뷰 수정하기 버튼 누르기 */
 		$(document).on('click','.modifyBtn',function(){
 			var purchaseId = $(this).attr('id');
 			location.href='WriteReview?purchase=' + purchaseId;
 		})
 		
 		/* 리뷰 삭제하기 버튼 클릭시 */
 		var review_id;
 		
 		$(document).on('click','#D_show',function(){
 			$('.deleteReview').addClass('show');
 			review_id = $(this).attr('class');
 		})
 		
 	</script>
 	<script>
 		var user_id = '<%=id%>';
	 	
	 	$(function() {
			if(user_id == "null") {
				alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
				location.href = '../login/login';
			} else{
				 $.ajax({
					url : "../reviews", // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					success : function(result){
						
						/*  var result = {
						    "code": 200,
						    "message": "Success",
						    "data": [
						        {
						            "review_id": 56,
						            "reservation_id": 263,
						            "lodgement_id": 78,
						            "lodgement_name": "신안동 이끌림",
						            "review_date": "2022.05.17",
						            "room_id": 70,
						            "room_name": "비즈니스 더블",
						            "like_num": 0,
						            "review_text": "좋아요 굿",
						            "review_img_url": "https://www.buyinhotel.co.kr:5000/static/review/56220517112904680756.jpg"
						        }
						    ]
						} */
						
						console.log(result);
						
						if(result.message == 'Success'){
							data = result.data;
							console.log(data);
							$('#reviewCount').text(data.length);
							
							if(data.length == 0) {
								//검색결과가 없을때
								$('.myReviewList').append(
									"<div>"
										+"<p>리뷰내역이 없습니다.</p>"
									+"</div>"
								);
							} else{
								reviewWrite();
								page();
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
						alert("검색실패");
						return false;
					}
				}) 
			}
			
			/* 작성가능한 리뷰목록들 */
			
			 $.ajax({
				url : "../reviewables", // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        }, 
				success : function(result){ 
					
					if(result.message == 'Success'){
						ableData = result.data;  
						
						console.log(ableData);
						$('#reviewAbleCount').text(ableData.length);
						
						if(ableData.length == 0) {
							//검색결과가 없을때
							$('.WritingReviewItem').append(
								"<div class='noData'>"
									+"<p class='noDataMessage'>리뷰내역이 없습니다.</p>"
								+"</div>"
							);
						} else{
							toWriteReview();
						}
						
						  return false;
					}else if(result.message == 'Fail'){
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
		
		/* 리뷰 삭제하기 */
		 function reviewDelete() {
			
			 $.ajax({
				 url : "../reviews?user=" + user_id + "&review=" + review_id, // 컨트롤러 위치
				// get, post
				// get은 쿼리스트링 방식
				// post 숨겨서 보내야 되므로 ajax안에 data: {}
				 type : "DELETE",
				// dataType : response 어떤 타입으로 받을지
				dataType : 'JSON',
				success : function(result){
					
					console.log(result)
					
					if(result.message == 'Success'){
						$('.deleteReview').removeClass('show');
						$('.writeReview'+review_id).remove();
						$('#reviewCount').text(data.length);
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
 	
 		function reviewWrite(){
 			for(var i = 0; i < data.length; i++){
 				if(data[i].review_img_url != null){
 					$('.myReviewList').append(
						"<div class='reviewLists writeReview" + data[i].review_id + "'>"
							+"<div class='myReview'>"
								+"<div class='myReviewItem'>"
									+"<h5 class='ReviewItemName'>" + data[i].product_name + "</h5>"
									+"<p class='reviewItemOption'>옵션 : " + data[i].option_name + "</p>"
									+"<p class='reviewWriteDate'>" + data[i].review_date + "</p>"
								+"</div>"
								+"<div class='myReviewBtn'>"
									+"<button type='button' style='border: 1px solid #727F8A; color: #727F8A;' id='" + data[i].purchase_id + "' class='modifyBtn'>수정하기</button>"
									+"<button type='button' class='" + data[i].review_id + "' id='D_show'>삭제하기</button>"
								+"</div>"
							+"</div>"
							+"<div class='MyReviewText'>"
								+"<p>" + data[i].review_text + "</p>"
								+"<img class='review_img' src='" + data[i].review_img_url + "'>"
							+"</div>"
						+"</div>"		
	 				)
 				} else if(data[i].review_img_url == null){
 					$('.myReviewList').append(
						"<div class='reviewLists writeReview" + data[i].review_id + "'>"
							+"<div class='myReview'>"
								+"<div class='myReviewItem'>"
									+"<h5 class='ReviewItemName'>" + data[i].product_name + "</h5>"
									+"<p class='reviewItemOption'>옵션 : " + data[i].option_name + "</p>"
									+"<p class='reviewWriteDate'>" + data[i].review_date + "</p>"
								+"</div>"
								+"<div class='myReviewBtn'>"
									+"<button type='button' style='border: 1px solid #727F8A; color: #727F8A;' id='" + data[i].purchase_id + "' class='modifyBtn'>수정하기</button>"
									+"<button type='button' class='" + data[i].review_id + "' id='D_show'>삭제하기</button>"
								+"</div>"
							+"</div>"
							+"<div class='MyReviewText'>"
								+"<p>" + data[i].review_text + "</p>"
							+"</div>"
						+"</div>"		
	 				)
 				}
 			}
 		}
 		
 		function toWriteReview(){
 			for(var i = 0; i < ableData.length; i++){
 				$('.WritingReviewList').append(
					"<div class='myReview'>"
						+"<div class='myReviewItem'>"
							+"<h5 class='reviewItemName'>" + ableData[i].product_name + "</h5>"
							+"<p class='reviewItemOption'>옵션: <span>" + ableData[i].option_name + "</span></p>"
							+"<p class='reviewWriteDate'>" + ableData[i].date_string + "</p>"
						+"</div>"
						+"<div class='reviewWriteBtn'>"
							+"<button type='button' style='border: 1px solid #727F8A; color: #727F8A;' id='" + ableData[i].purchase_id + "' class='WriteReviewBtn'>리뷰작성</button>"
						+"</div>"
					+"</div>"	
 				)
 			}
 		}
 	</script>
 	<script>
 	function page() {	
 		// ****더 중요한점 테이블 이름 적어줘야함!!
 	    $('.myReviewList').each(function () {
 	        var pagesu = 10;  //페이지 번호 갯수
 	        var currentPage = 0;
 	        var numPerPage = 5;  //목록의 수
 	        var $div = $(this);
 	        var pagination = $("#pagination");

 	        //length로 원래 리스트의 전체길이구함
 	        var numRows = $div.find('.reviewLists').length;

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
 	            $div.find('.reviewLists').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
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
 	            $('<span class="pageNum first">《</span>').bind('click', { newPage: page }, function (event) {
 	                currentPage = 0;
 	                $div.trigger('repaginate');
 	                $($(".pageNum")[2]).addClass('active').siblings().removeClass('active');
 	            }).appendTo(pagination).addClass('clickable');
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
 	            $('<span class="pageNum last">》</span>').bind('click', { newPage: page }, function (event) {
 	                currentPage = numPages - 1;
 	                $div.trigger('repaginate');
 	                $($(".pageNum")[endp - nowp + 1]).addClass('active').siblings().removeClass('active');
 	            }).appendTo(pagination).addClass('clickable');

 	            $($(".pageNum")[2]).addClass('active');
 	            
 	        });

 	        $pager.insertAfter($div).find('span.pageNum:first').next().next().addClass('active');
 	        $pager.appendTo(pagination);
 	        $div.trigger('repaginate');
 	    });
 	}
 	</script>
</body>
</html>