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
			<li style='background-color: #8996A0;'><a href='point' style='color: white; text-decoration: underline'>포인트&middot;쿠폰</a></li>
			<li><a href='wishList'>위시리스트</a></li>
			<li><a href='recent'>최근본상품</a></li>
			<li><a href='review'>나의리뷰</a></li>
			<li><a href='giftBox'>선물함</a></li>
			<li><a href='PurchaseHistory'>상품구매내역</a></li>
			<li><a href='exchange'>교환&middot;반품내역</a></li>
			
		</ul>
		</div>
		<div class='wishContent'>
			<h4>포인트 &middot; 쿠폰</h4>
			<div class="tab">
				<div class="selectmenu tabnav">
					<div class="tablinks" onclick="openMenu(event,'point')" id="defaultOpen">포인트</div>
					<div class="tablinks" onclick="openMenu(event,'coupon')">쿠폰</div>  
			    </div>		
			</div>
			
			<div id='point' class='tabcontent'>
				<div class='availPoint'>
					<table>
						<tr>
							<td>사용가능 포인트</td>
							<td><span id='availablePoint'>0</span>P</td>
						</tr>
						<tr>
							<td>소멸예정 포인트</td>
							<td><span id='extinctionPoint'>0</span>P</td>
						</tr>
					</table>
				</div>	
				
				<div class='pointBreakdown'>
					<p class='pointTitle'>포인트 내역</p>
					<table class='pointTable'>
						<!-- <tr>
							<td class='point1' style='color: #FF5F5F;'>사용</td>
							<td class='point2'>
								<p class='useDate'>2021.09.28</p>
								<p class='useReason'>상품 구매 사용</p>
								<p class='useItem'>Q4 유로탑 롤팩 매트리스 2size</p>
							</td>
							<td class='point3' style='color: #FF5F5F;'><span id='changePoint'>-300</span>P</td>
						</tr> -->
					</table>
				</div>
		
			</div>
			
			<div id='coupon' class='tabcontent'>
				<div class='couponMenu'>
					<p class='pointTitle'>쿠폰 내역</p>
					<div class='couponList'>
						<!-- <div class='couponItem'>
							<p class="couponName">회원가입 감사쿠폰 10% 할인</p>
							<p class="couponPeriod">2021.09.07 ~ 2021.10.07 사용가능</p>
						</div>
						<div class='couponItem'>
							<p class="couponName">SILVER 10% 할인쿠폰 <span class='standardPrice'>*100,000원 이상 결제시 사용가능</span></p>
							<p class="couponPeriod">2021.09.07 ~ 2021.10.07 사용가능</p>
						</div> -->
					</div>
				</div>
			</div>
		</div>
		
	</main>
 	<%@include file="../footer.jsp"%>
 	<script>
 	var user_id = '<%=id%>';
 	
 	  $(function() {
	    	$('.topSubMenu').append(
	    		"<h4 class='basketMenu'>마이페이지</h4>"		
	    	);
	    	
	    	if(user_id == "null") {
				alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
				location.href = '../login/login';
			} else{
	 	    	 $.ajax({
					url : "https://www.buyinhotel.co.kr:5000/points?user=" + user_id, // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					success : function(result){
						
						if(result.message == 'Success'){
							data = result.data;
							console.log(data);	
							
							$('#availablePoint').text(data.current_point.toLocaleString('en'));
							$('#extinctionPoint').text(data.will_destroy.toLocaleString('en'));
							
							if(data.length == 0){
								$('.pointBreakdown').append(
									"<div>"
										+"<p style='text-align: center; margin-top: 124px; font-size: 24px; font-family: NanumSquare_ac;'>보유하신 포인트가 없습니다.</p>"
									+"</div>"		
								)
							} else{
								points();
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
 	    
 	    $(function() {
			$.ajax({
				url : "https://www.buyinhotel.co.kr:5000//coupons?user=" + user_id, // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				success : function(result){
					
					if(result.message == 'Success'){
						data = result.data;
						console.log(data);	
						
						coupons();
						
						if (data.length == 0) {
							$('.couponList').append(
								"<div>"
									+"<p style='text-align: center; margin-top: 124px; font-size: 24px; font-family: NanumSquare_ac;'>보유하신 쿠폰이 없습니다.</p>"
								+"</div>"		
							)
							return false;
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
		})
 	</script>
 	<script>
 		/* 포인트, 쿠폰 탭  */
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
	    
	    
	    function points(){
	    	for(var i = 0; i < data.point_usages.length; i++){
	    		$('.pointTable').append(
    				"<tr>"
						+"<td class='point1'>" + data.point_usages[i].is_usage + "</td>"
						+"<td class='point2'>"
							+"<p class='useDate'>" + data.point_usages[i].point_date.split(" ")[0] + "</p>"
							+"<p class='useReason'>" + data.point_usages[i].usage_name + "</p>"
							+"<p class='useItem'>" + data.point_usages[i].usage_contents+ "</p>"
						+"</td>"
						+"<td class='point3'><span id='changePoint" + i + "'>" + data.point_usages[i].point_value.toLocaleString('en') + "</span>P</td>"
					+"</tr>"
	    		)
	    		
	    		/* 포인트 적립/ 사용 색 변화 */
	    		if(data.point_usages[i].is_usage == 'false'){
	    			
	    			$('.point1').text("적립");
	    			$('.point1').css('color','#477696');
	    			$('.point3').css('color','#477696');
	    			$('#changePoint'+i).prepend("+");
	    		}else if(data.point_usages[i].is_usage == 'true'){
	    			
	    			$('.point1').text("사용");
	    			$('.point1').css('color','#FF5F5F');
	    			$('.point3').css('color','#FF5F5F');
	    			$('#changePoint'+i).prepend("-");
	    		}
	    	}
	    }
	    
	    function coupons(){
	    	for(var i = 0; i < data.length; i++){
	    		$('.couponList').append(
    				"<div class='couponItem'>"
						+"<p class='couponName'>" + data[i].coupon_name + "</p>"
						+"<p class='couponPeriod'>" + data[i].valid_date + " 사용가능</p>"
					+"</div>"		
	    		)
	    	}
	    }
 	</script>
 	
</body>
</html>