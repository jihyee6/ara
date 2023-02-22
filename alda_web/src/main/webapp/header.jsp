<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<% String id = (String) session.getAttribute("id"); %>
		<div class='top_header'>
			<div class='header_margin'>
				<div class='logo'>
					<a href='../index.jsp'><img src="../image/header/headerAaraLogo.png"></a>
				</div>
				  <div class="searchBox">
					<a class='glasses'><img class='searchImg' src="../image/header/glasses.png"></a>      
			      	<input type="text" class="searchTxt" placeholder="검색"><button class='searchBtn' type='button' onclick = 'searchProductText()'>검색</button>
				    <!-- <div class='searchList'>
				    	<p class='searchbar'>인기검색 </p>
				    	<ul id='scroll'>
				    			<li><span>1. </span><a class='scrollTxt'>이불세트</a></li>
				    			<li><span>2. </span><a class='scrollTxt'>이불세트</a></li>
				    			<li><span>3. </span><a class='scrollTxt'>이불세트</a></li>
				    			<li><span>4. </span><a class='scrollTxt'>이불세트</a></li>
				    			<li><span>5. </span><a class='scrollTxt'>이불세트</a></li>
				    			<li><span>6. </span><a class='scrollTxt'>이불세트</a></li>
				    			<li><span>7. </span><a class='scrollTxt'>이불세트</a></li>
				    			<li><span>8. </span><a class='scrollTxt'>이불세트</a></li>
				    			<li><span>9. </span><a class='scrollTxt'>이불세트</a></li>
				    			<li><span>10. </span><a class='scrollTxt'>이불세트</a></li>
				    		</ul>
				    	<img class='passIcon' src="../image/icon/downPass.png">
				    		<div class='searchAllList'>
					    		<ul class='searchContent' id='ticker'>
					    			<li><span>1. </span><a href=''>이불세트</a><span class='upDown'>-</span></li>
					    			<li><span>2. </span><a href=''>이불세트</a><span class='upDown'>-</span></li>
					    			<li><span>3. </span><a href=''>이불세트</a><span class='upDown'>-</span></li>
					    			<li><span>4. </span><a href=''>이불세트</a><span class='upDown'>-</span></li>
					    			<li><span>5. </span><a href=''>이불세트</a><span class='upDown'>-</span></li>
					    			<li><span>6. </span><a href=''>이불세트</a><span class='upDown'>-</span></li>
					    			<li><span>7. </span><a href=''>이불세트</a><span class='upDown'>-</span></li>
					    			<li><span>8. </span><a href=''>이불세트</a><span class='upDown'>-</span></li>
					    			<li><span>9. </span><a href=''>이불세트</a><span class='upDown'>-</span></li>
					    			<li><span>10. </span><a href=''>이불세트</a><span class='upDown'>-</span></li>
					    		</ul>
				    		<table class="searchTable">
					            <tr>
					                <td>1. <a href=''>이불세트</a></td>
					                <td>-</td>
					                <td>6. <a href=''>마스크</a></td>
					                <td>-</td>
					            </tr>
					            <tr>
					                <td>2. <a href=''>바이인호텔</a></td>
					                <td>-</td>
					                <td>7. <a href=''>냄비</a></td>
					                <td>-</td>
					            </tr>
					            <tr>
					                <td>3. <a href=''>소파</a></td>
					                <td>-</td>
					                <td>8. <a href=''>환절기용품</a></td>
					                <td>-</td>
					            </tr>
					            <tr>
					                <td>4. <a href=''>식탁</a></td>
					                <td>-</td>
					                <td>9. <a href=''>의자</a></td>
					                <td>-</td>
					            </tr>
					            <tr>
					                <td>5. <a href=''>가전제품</a></td>
					                <td>-</td>
					                <td>10. <a href=''>암막커튼</a></td>
					                <td>-</td>
					            </tr>
			        	</table>
				    	</div>
			    </div> -->
			    </div>
			   		<nav class='headNav'>
			   		<ul id='main_menu'>
			   			<li><a href='../mypage/wishList'><img src='../image/header/wish.png'><p>위시리스트</p></a></li>
			   			<li><a href='../menu/basket'><img src='../image/header/shopping.png'><p>장바구니</p></a></li>
			   			<li class='myMenu'><a><img src='../image/header/info.png'><p>마이페이지</p></a>
			   				<div class='subBollom subMy'>
			   				<ul class ='submenu'>
				   					<li><a href='../mypage/Myinfo'>내정보</a></li>
				   					<li><a href='../mypage/point'>포인트 &middot; 쿠폰</a></li>
				   					<li><a href='../mypage/wishList'>위시리스트</a></li>
				   					<li><a href='../mypage/recent'>최근 본 상품</a></li>
				   					<li><a href='../mypage/review'>나의리뷰</a></li>
				   					<li><a href='../mypage/giftBox'>선물함</a></li>
				   					<li><a href='../mypage/PurchaseHistory'>상품구매내역</a></li>
				   					<li><a href='../mypage/exchange'>교환 &middot; 반품내역</a></li>
				   					<!-- <li><a onclick='logout()'>로그아웃</a></li> -->
				   				</ul>
			   				</div>
		   				</li>
			   				
			   			<li class='seeMenu'><a><img src='../image/header/seemore.png'><p>더보기</p></a>
			   				<div class='subBollom subSee'>
				   				<ul class='submenu'>
				   					<li><a href='../seemore/notice'>공지사항</a></li>
				   					<li><a href='../seemore/giftcard'>선물하기</a></li>
				   					<li><a href='../menu/event'>이벤트</a></li>
				   					<li><a href='../seemore/benefits'>회원등급혜택</a></li>
				   					<li><a href='../seemore/faq'>FAQ</a></li>
				   					<li><a href='../seemore/terms'>이용약관</a></li>
				   				</ul>
			   				</div>
			   			</li>
			   		</ul>
			   </nav>
			</div>
		</div>
		
	   <div class='top_menu'>
	   		<div class='topMenus'>
		   		<ul>
		   			<li><a href='../index.jsp'>홈</a></li>
		   			<li class = 'headerStore'><a href='../menu/store'>스토어</a></li>
		   			<li><a class='headerSearch' href='../menu/search'>카테고리검색</a></li>
		   			<li class = 'headerBuyin'><a href='../menu/buyin'>바이인</a></li>
		   			<li class = 'headerHotdeal'><a href='../menu/hotdeal'>핫딜</a></li>
		   			<li><a href='../menu/event'>이벤트</a></li>
		   		</ul>
	   		
	   		<div class='memberInfo'>
	   			<p id='userName' style='float: left;'></p>
	   			<p id='loginBtn' style='float: right; margin-left: 0px;'></p>
	   			<!-- <p style='float: left;'>000님 | </p>
	   			<p>로그아웃</p> -->
	   			<!-- <p onclick='location.href="../login/login"'>로그인</p> -->
	   		</div>
	   		</div>
	   </div>
	</header>
	<script>
		$(document).on('click','.passIcon',function(){
			if($('.searchAllList').css('display') == 'none'){
				$('.searchAllList').css('display','block');	
			} else {
				$('.searchAllList').css('display','none');	
			}
		})
		
		/* 마이페이지 이모티콘 클릭시 */
		$(document).on('click','.myMenu',function(){
			if($('.subMy').css('display') == 'none'){
				$('.subMy').css('display','block');
				$('.subSee').css('display','none');
			} else{
				$('.subMy').css('display','none');
			}
		})
		
		/* 더보기 이모티콘 클릭시 */
		$(document).on('click','.seeMenu',function(){
			if($('.subSee').css('display') == 'none'){
				$('.subSee').css('display','block');
				$('.subMy').css('display','none');
			} else{
				$('.subSee').css('display','none');
			}
			
		})
		
		$(function() {
			
			var src = $(location).attr('href');
	    	
			if((/store/).test(src) == true) {
				$('.headerStore').addClass('selectHeader');
			} else if ((/buyin/).test(src) == true){
				$('.headerBuyin').addClass('selectHeader');
			} else if ((/hotelDetail/).test(src) == true){
				$('.headerBuyin').addClass('selectHeader');
			} else if ((/hotdeal/).test(src) == true){
				$('.headerHotdeal').addClass('selectHeader');
			} else if ((/search/).test(src) == true){
				$('.headerSearch').addClass('selectHeader');
			} 
		})
		
		  /* $(document).ready(function(){
        $('#main_menu > li').click(function(){
            $('.submenu').toggle('fast');
        });
    }); */
		
	</script>
	<script>
		function searchProductText() {
			
			var text = $('.searchTxt').val();
			if(text == "") {
				alert("검색어를 입력해 주세요.")
			} else {
				$.ajax({
					url : "products?thumb=true&text="+ text + "&large_category=" + null + "&small_category=" + null , // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					success : function(result){
						data = result.data;
						console.log(data);

						searchResult();
						
						location.href='../menu/search?text=' + text;
						return false;
					},
					error : function(){
						alert("검색실패");
						return false;
					}
				})
			}
			
			/*  $.ajax({
				url : "http://192.168.0.34:8081/alda_web/products?text="+ text + "&large=" + null + "&medium=" + null + "&small=" + null + "&place=" + null , // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				success : function(result){
					data = result.data;
					console.log(data);

					searchResult();
					
					location.href='../menu/search?text=' + text;
					return false;
				},
				error : function(){
					alert("검색실패");
					return false;
				}
			}) */
		}
		
		/* 검색결과 */
			/* function searchResult(){
				for(var i = 0; i < data.length; i++){
					$('.searchItemsArea').append(
						"<div class='searhResultItem'>"
							+"<div class='searchResultImg'>"
								+"<img class='roomItemImg' src='" + data[i].product_img_url + "'>"
							+"</div>"
							+"<p class='roomItemStore'>보니애가구</p>"
							+"<p class='roomItemName'>" + data[i].product_name + "</p>"
							+"<p class='searchDiscount'>" + data[i].dc_rate + "%<span>" + data[i].sale_price.toLocaleString('en') + "</span></p>"
							+"<p class='searchReviewCount'>리뷰 " + data[i].review_num + "</p>"
							+"<div class='productInfo' id='productInfo" + i + "'>"
								
							+"</div>"
						+"</div>"		
					)
					if(data[i].delivery_price == true){
						$('#productInfo'+i).append(
							"<div class='free'><p>무료배송</p></div>"
						)
					}
					
					if(data[i].bargain_price == true){
						$('#productInfo'+i).append(
							"<div class='specialPrice'><p>특가</p></div>"
						)
					}
					
					if(data[i].is_buyinhotel == true){
						$('#productInfo'+i).append(
							"<div class='buyIn'><p>바이인</p></div>"
						)
					}
				}
			} */
			/* 검색어 스크롤링 */
		  /* function textScroll(scroll_el_id) {
				
	        this.objElement = document.getElementById(scroll_el_id);
	        this.objElement.style.position = 'relative';
	        this.objElement.style.overflow = 'hidden';

	        this.objLi = this.objElement.getElementsByTagName('li');
	        this.height = this.objElement.offsetHeight; // li 엘리먼트가 움직이는 높이(외부에서 변경가능)
	        this.num = this.objLi.length; // li 엘리먼트의 총 갯수
	        this.totalHeight = this.height*this.num; // 총 높이
	        this.scrollspeed = 2; // 스크롤되는 px
	        this.objTop = new Array(); // 각 li의 top 위치를 저장
	        this.timer = null;
		    
		    for(var i=0; i<this.num; i++){
		        this.objLi[i].style.position = 'absolute';
		        this.objTop[i] = this.height*i;
		        this.objLi[i].style.top = this.objTop[i]+"px";
		    }
		}

		textScroll.prototype.move = function(){
		    for(var i=0; i<this.num; i++) {
		        this.objTop[i] = this.objTop[i] - this.scrollspeed;
		        this.objLi[i].style.top = this.objTop[i]+"px";
		    }
		    if(this.objTop[0]%this.height == 0){
		        this.jump();
		    }else{
		        clearTimeout(this.timer);
		        this.timer = setTimeout(this.name+".move()",50);
		    }
		}

		textScroll.prototype.jump = function(){
		    for(var i=0; i<this.num; i++){
		        if(this.objTop[i] == this.height*(-2)){
		            this.objTop[i] = this.objTop[i] + this.totalHeight;
		            this.objLi[i].style.top = this.objTop[i]+"px";
		        }
		    }
		    clearTimeout(this.timer);
		    this.timer = setTimeout(this.name+".move()",3000);
		}

		textScroll.prototype.start = function() {
		    this.timer = setTimeout(this.name+".move()",3000);
		}
		
		  var real_search_keyword = new textScroll('scroll'); // 스크롤링 하고자하는 ul 엘리먼트의 id값을 인자로 넣습니다
		    real_search_keyword.name = "real_search_keyword"; // 인스턴스 네임을 등록합니다
		    real_search_keyword.start(); */ // 스크롤링 시작
	</script>
	
	<script>
	///////////////로그인 전, 후 헤더 탑 변화//////////////////////
	$(function() {
		/* $.ajax({
			url: "../WebLoginStateCheckCon.do", // 컨트롤러 위치
			type: "post",
			dataType: 'text',
			success: function(result) {
				console.log(result)

				if (result == "") {
					$('#userName').text("");
					$('#loginBtn').text("로그인");
					$('#loginBtn').attr('onClick', "location.href='../login/login'");
					
					return false;
				} else {
					$('#userName').text(result + "님 | ");
					$('#loginBtn').text("로그아웃");
					$('#loginBtn').attr('onClick', "logout()");
					
					return false;
				}
				
				return false;
			},
			error: function() {
				alert("서버 요청 실패", "연결을 다시 확인 해주세요.");
				return false;
			}
		}); */
		
		var user_id = '<%=id%>';
		
		if(user_id == "null") {
			$('#userName').text("회원가입 | ");
			$('#userName').css('cursor','pointer');
			
			$('#loginBtn').text("로그인");
			$('#loginBtn').attr('onClick', "location.href='../login/login'");
		} else {
			$.ajax({
				url : "https://www.buyinhotel.co.kr:5000/basic-myinfo?user=" + user_id, // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				success : function(result){
					
					if(result.message == 'Success'){
						user_info = result.data;
						console.log(user_info);	
						
						$('#userName').text(user_info.user_name + "님 | ");
						$('#loginBtn').text("로그아웃");
						$('#loginBtn').attr('onClick', "logout()");
						
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
	
	$(document).on('click','#userName',function(){
		if($(this).text() == "회원가입 | "){
			JoinType(null,'app');
		}
	})
	
	function JoinType(token, join_type) {
		$.ajax({
			url: "../JoinTypeCon.do", // 컨트롤러 위치
			type: "post",
			dataType: 'text',
			data: {

				token: token,
				join_type: join_type,
				origin_page : document.referrer

			},
			success: function(result) {
				console.log(result)
				if (result == "joinToken") {
					alert("아이디 오류");

					return false;
				} else if (result == "joinType") {
					alert("타입 오류");

					return false;
				} else if (result == "join") {
					location.href = '../login/join';
					
					return false;
				}
				
				return false;
			},
			error: function() {
				swal("서버 요청 실패", "연결을 다시 확인 해주세요.", "error");
				return false;
			}
		});
	}
	
	function logout() {
		$.ajax({
			url: "../WebLogoutCon.do", // 컨트롤러 위치
			type: "post",
			dataType: 'text',
			success: function(result) {
				console.log(result)

				location.reload();
				
				return false;
			},
			error: function() {
				alert("서버 요청 실패", "연결을 다시 확인 해주세요.");
				return false;
			}
		});
	}
	
	</script>

