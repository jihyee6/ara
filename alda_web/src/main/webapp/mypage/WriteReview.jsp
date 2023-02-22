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
<%String purchaseId = request.getParameter("purchase"); %>

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
			<div class='WritingReviewInfo'>
				<h5 id='reviewName'></h5>
				<p class='writingInfoOption'></p>
				<p>작성자명: <span class='writingReviewer'></span>님</p>
			</div>
			
			<div class='reviewArea'>
				<p>받아보신 상품은 어떠셨나요? 리뷰를 작성해주세요.</p>
				<textarea id='reviewTextArea' placeholder='리뷰를 작성해주세요.'></textarea>
			</div>
			<div class='writingReviewImages'>
				<!-- <img src="../image/items/infoItems.png"> -->
				
				<label class='inputFileBtn' for='inputFile'>
					<img src='../image/icon/photoregister.png'>
				</label>
				<input type='file' id='inputFile' style='display: none;' onchange='setThumbnail(event);' accept = '.jpg,.png'>

				<div id='image_container'></div>
			</div>
			<div class='reviewPoint'>
				<p>작성 완료시 적립 포인트 : <span>200P</span></p>
			</div>
			<div class='reviewdButton' style='width: 148px;'>
				<button type='button' class='writeBtn'>작성완료</button>
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
 	</script>
 	<script>
 	var user_id = '<%=id%>';
	var purchaseId = '<%=purchaseId%>';
	
 	var review_write = true;
	var img_state = false;
	var review_original_img = false;
	
	var review_id;
	var img_cnt = 0;
	
	    /* 작성완료 클릭시 이동 */
	    $(document).on('click','.writeBtn',function(){
	    	
	    	if(img_state == false) {
				
				if(review_write == true) {
					
					var formData = new FormData();
					formData.append("review_img", null);
					formData.append("writer", user_id);
					formData.append("purchase_id", '<%=purchaseId%>');
					formData.append("text", $('#reviewTextArea').val());
					
					 $.ajax({
						enctype: 'multipart/form-data',  
						url : "../reviews", // 컨트롤러 위치
						type : "POST",
						data: formData,          
			            processData: false,    
			            contentType: false,      
			            cache: false,           
			            timeout: 600000,
						dataType : 'JSON',
						beforeSend: function (xhr) {
				            xhr.setRequestHeader("user", user_id);
				        },
						success : function(result){
							
						console.log(result);
							
						if(result.message == 'Success'){
							if($('#reviewTextArea').val().length > 10){
								alert('리뷰를 작성이 완료 되었습니다. 200P가 적립 됩니다. 감사합니다.');
								location.href = 'review';
							} else{
							 	alert("리뷰는 최소 10자 이상 작성해주세요.");
							}
						} else if(result.message == 'Fail'){
							alert("잠시후에 다시 시도해주세요.");
						} else {
							alert("알 수 없는 에러입니다.");
						}
							return false;					
						},
						error : function(){
							alert("리뷰 작성에 실패하였습니다. 잠시후에 다시 시도해주세요.");
						return false;
						}
					})
				} else if(review_write == false) {
					
					var formData = new FormData();
					formData.append("review_img", null);
					formData.append("delete_image", review_original_img);
					formData.append("review_id", review_id);
					formData.append("text", $('#reviewTextArea').val());
					
					$.ajax({
						enctype: 'multipart/form-data',  
						url : "../reviews", // 컨트롤러 위치
						type : "PUT",
						data: formData,          
			            processData: false,    
			            contentType: false,      
			            cache: false,           
			            timeout: 600000,
						dataType : 'JSON',
						beforeSend: function (xhr) {
				            xhr.setRequestHeader("user", user_id);
				        },
						success : function(result){
							
							console.log(result);
							
							if(result.message == 'Success'){
								if($('#reviewTextArea').val().length > 10){
									alert('리뷰 수정이 완료 되었습니다.')
									location.href = 'review';
								} else {
									alert("리뷰는 최소 10자 이상 작성해주세요.");
								}
							} else if(result.message == 'Fail'){
								alert("잠시후에 다시 시도해주세요.");
							} else {
								alert("알 수 없는 에러입니다.");
							}
							return false;					
						},
						error : function(){
							alert("리뷰 작성에 실패하였습니다. 잠시후에 다시 시도해주세요.");
							return false;
						}
					})
				}  
					
			}
	    })
 	</script>
 	<script>
 		 $(function() {
			if(user_id == "null") {
				alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
				location.href = '../login/login';
			} else{ 
				$.ajax({
					url : "../review-basic-info?purchase=" + purchaseId, // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        }, 
					success : function(result){
						
						if(result.message == 'Success'){
							data = result.data; 
							reviewData = data;
							  	/* var reviewData = {
									    "code": "200",
									    "data": {
									        "room_name": "비즈니스 더블",
									        "lodgement_id": 78,
									        "lodgement_name": "신안동 이끌림",
									        "writer_id": "kakaoE2149996795",
									        "writer_name": "김지훈"
									    },
									    "message": "Success"
									}  */
							
							console.log(reviewData);
							
							$('#reviewName').text(reviewData.product_name);
							$('.writingInfoOption').text(reviewData.option_name);
							$('.writingReviewer').text(reviewData.writer_name);
							$('#reviewTextArea').text(reviewData.review_contents);
							
							
							 if(typeof reviewData.review_id != "undefined") {
								
								review_write = false;
								review_id = reviewData.review_id;
								
								$('.writeBtn').text("수정완료");
								$('.reviewPoint').css('display', 'none');
								
								if(reviewData.image_url != null){
									$('#image_container').append(
										"<img class = 'imgBox' src='" + reviewData.image_url + "'>"		
									)
								}
								
								 $(document).on('click', '.imgBox', function(){
									review_original_img = true;
						      		$(this).remove();
						      	}) 
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
		}) 
	
	function setThumbnail(e) {
    	
		img_state = true;
		
    	if($('.imgBox').length == 0){
		    const files = e.target.files;
		   	const filesArr = Array.prototype.slice.call(files);
	   		// 여러장의 이미지를 불러올 경우, 배열화
	  	 	filesArr.forEach(file => {
	   	    	const reader = new FileReader();
		   	    reader.onload = e => {
		   	        const image = new Image();
		   	        image.className = "img-item"; // 스타일 적용을 위해
		   	        image.src = e.target.result;
		   	        image.onload = imageEvent => {
	   	        	let canvas = document.createElement("canvas"),
	   			    max_size = 1280,
	   			    // 최대 기준을 1280으로 잡음.
	   			    width = image.width,
	   			    height = image.height;
	
	   			 	if (width > height) {
	   			    // 가로가 길 경우
	   			    if (width > max_size) {
	   			      height *= max_size / width;
	   			      width = max_size;
	   			    }
	   			    
	   			    } else {
	   			    // 세로가 길 경우
		   			    if (height > max_size) {
		   			    	width *= max_size / height;
		   			        height = max_size;
	   			    	}
	   			    }
	   			  canvas.width = width;
	   			  canvas.height = height;
	   			  canvas.getContext("2d").drawImage(image, 0, 0, width, height);
	   			  const dataUrl = canvas.toDataURL("image/jpeg");
	   			  // 미리보기 위해서 마크업 추가.
	   			  
	              var img_html = "<img src=\"" + dataUrl + "\" / class = 'imgBox'/>";
	              $("#image_container").append(img_html);
	   			  
	   			  var formData = new FormData();
	   			  
	   			  if(review_write == true) {
			   		  formData.append("review_img", dataURLToBlob(dataUrl));
			   		  formData.append("writer", user_id);
				      formData.append("purchase_id", '<%=purchaseId%>');
				      formData.append("text", $('#reviewTextArea').val());
				      
				      $(document).on('click', '.imgBox', function(){
				      		$(this).remove();
				      		img_state == false
				      		
				      		formData.delete("review_img");
				      		formData.delete("writer");
				      		formData.delete("purchase_id");
				      		formData.delete("text");
				      		
				      		for (let key of formData.keys()) {
				      			console.log(key);
				      		}
			      		
			      	  }) 
				      
	   			  } else if (review_write == false) {
	   				  formData.append("review_img", dataURLToBlob(dataUrl));
	   				  formData.append("review_id", review_id);
   		    		  formData.append("delete_image", true);
   					  formData.append("text", $('#reviewTextArea').val());
   					  
	   				  $(document).on('click', '.imgBox', function(){
				          $(this).remove();
				      	  img_state == false;
				      		
				      	  formData.delete("review_img");
				      	  formData.delete("review_id");
				      	  formData.delete("delete_image");
				      	  formData.delete("text");
				      		
				      		for (let key of formData.keys()) {
				      			console.log(key)
				      		}
			      		
			      	  }) 
	   			  }
		   		  
	   		      $('#inputFile').val("");
	   		      
	   		     $(document).on('click', ".writeBtn", function () {
	   		    	  
	   		    	if(review_write == true && formData.has("review_img") == true) {
	   		    		
	   		    		$.ajax({             
	   		          		type: "POST",          
	   		                enctype: 'multipart/form-data',  
	   		             	url : "../reviews", 
	   		                data: formData,          
	   		                processData: false,    
	   		                contentType: false,      
	   		                cache: false,           
	   		                timeout: 600000,
	   		                dataType : 'JSON',
		   		            beforeSend: function (xhr) {
		 			            xhr.setRequestHeader("user", user_id);
		 			        },
	   		                success: function (result) {
	   		                	
	   		                	console.log(result);
	   							if(result.message == 'Success'){
	   								if($('#reviewTextArea').val().length > 10){
		   								alert('리뷰를 작성이 완료 되었습니다. 200P가 적립 됩니다. 감사합니다.')
		   								location.href = 'review';
	   								} else{
	   									alert("최소 10자 이상 작성해주세요.")
	   								}
	   							} else if(result.message == 'Fail'){
	   								alert("잠시후에 다시 시도해주세요.");
	   							} else {
	   								alert("알 수 없는 에러입니다.");
	   							}
	   							return false;	
	   		                	
	   		                },          
	   		                error: function (e) {
	   		                	console.log("ERROR : ", e);     
	   		                }
	   		        	});
	   		    	} else if(review_write == false && formData.has("review_img") == true) {
	   		    		
	   		    		$.ajax({             
	   		          		type: "PUT",          
	   		                enctype: 'multipart/form-data',  
	   		             	url : "../reviews", 
	   		                data: formData,          
	   		                processData: false,    
	   		                contentType: false,      
	   		                cache: false,           
	   		                timeout: 600000,
	   		                dataType : 'JSON',
		   		            beforeSend: function (xhr) {
		 			            xhr.setRequestHeader("user", user_id);
		 			        },
	   		                success: function (result) {
	   		                	
	   		                	console.log(result);
	   							if(result.message == 'Success'){
	   								if($('#reviewTextArea').val().length > 10){
		   								alert('리뷰 수정이 완료 되었습니다.')
		   								location.href = 'review';
	   								} else{
	   									alert("최소 10자 이상 작성해주세요.");
	   								}
	   							} else if(result.message == 'Fail'){
	   								alert("잠시후에 다시 시도해주세요.");
	   							} else {
	   								alert("알 수 없는 에러입니다.");
	   							}
	   							return false;	
	   		                	
	   		                },          
	   		                error: function (e) {
	   		                	console.log("ERROR : ", e);     
	   		                }
	   		        	});
	   		    	}
	   		          
		   	      });
			   	    };
		   	    };
	   	    reader.readAsDataURL(file);
	   	  	});
	   		
    	} else {
    		alert("리뷰 이미지는 1장만 등록 하실 수 있습니다.");
    	}
	}
 	
 	const dataURLToBlob = dataURL => {
		const BASE64_MARKER = ";base64,";
		console.log("checked!")
     	// base64로 인코딩 되어있지 않을 경우
	    if (dataURL.indexOf(BASE64_MARKER) === -1) {
	    	const parts = dataURL.split(",");
	    	const contentType = parts[0].split(":")[1];
	    	const raw = parts[1];
	    	return new Blob([raw], {
	      	type: contentType
	   		});
		}
	    // base64로 인코딩 된 이진데이터일 경우
	    const parts = dataURL.split(BASE64_MARKER);
	    const contentType = parts[0].split(":")[1];
	    const raw = window.atob(parts[1]);
	    // atob()는 Base64를 디코딩하는 메서드
	    const rawLength = raw.length;
	    // 부호 없는 1byte 정수 배열을 생성 
	    const uInt8Array = new Uint8Array(rawLength); // 길이만 지정된 배열
	    let i = 0;
	    while (i < rawLength) {
	    	uInt8Array[i] = raw.charCodeAt(i);
	    	i++;
	    }
	    return new Blob([uInt8Array], {
	    	type: contentType
	    });
	};
 	</script>
</body>
</html>