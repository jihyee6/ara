<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>ARA</title>
</head>
<body>

<script>
	$(function(){
		$.ajax({
			url : "../payments", // 컨트롤러 위치
			type : "PUT",
			data: JSON.stringify(payemntData), 
			dataType : 'JSON',
			beforeSend: function (xhr) {
		        xhr.setRequestHeader("user", user_id);
		    },
		    
			success : function(result){
				
				console.log(result);
				
				if(result.message == 'Success'){
					var oid = result.OID;
					
				} else if(result.message == 'Fail'){
					alert("잠시후에 다시 시도해주세요.");
				} else {
					alert("알 수 없는 에러입니다.");
				}
				return false;					
			},
			error : function(){
				alert("세션 등록 에러");
				return false;
			}
		})
	})
</script>
</body>
</html>