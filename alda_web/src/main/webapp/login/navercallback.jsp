<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("OMVNqw15Yd0gOdxctK21", "http://localhost:8080/alda_web/login/navercallback.jsp");
  // 접근 토큰 값 출력
/*   alert(naver_id_login.oauthParams.access_token); */
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	  opener.setNaverAccessToken(naver_id_login.getAccessToken())
	  opener.SocialLogin('naver', naver_id_login.getProfileData('id'));
	  
	  window.close();
  }
</script>
</body>
</html>