<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
  <head>
    <title>ShopMax &mdash; Colorlib e-Commerce Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">

	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
    
    <link rel="stylesheet" href="css/custom.css">
    
  </head>
  <body>
  
  
  <div class="site-wrap">
    
	<!-- 상단바 시작 -->
	<header>
		<nav>
			<jsp:include page="include/top.jsp"></jsp:include>
		</nav>	
	</header>
    <!-- 상단바 끝 -->
    
    <div class="login-container">
    	<div class ="login-div">
    		<div class ="login-logo">
	    		<a href="index.jsp"><img src="images/logo_11.png" height="100" width ="300"></a>
	    	</div>
	    	<form action="${pageContext.request.contextPath }/loginOk.login" method="post">
			    <div class="login-text">
			    	<p class="login-p">아이디</p>
			    	<input type="text" placeholder="아이디입력" class="login-input" name ="user_id">
			    </div>
			    <div class="login-text">
			    	<p class="login-p">비밀번호</p>
			    	<input type="password" placeholder="비밀번호 입력" class="login-input" name ="user_pw">
			    </div>
		    	<input type="submit" value="로그인" class="login-submit">
	    	</form>
		    	<a href="join.jsp"><input type="button" value="회원가입" class="login-submit" id ="joinb"></a>
	    	<div class="login-a">
	    		<a href="find_id.jsp" class="login-a-id">아이디 찾기</a>
	    		<a href="find_pw.jsp" class="login-a-pw">비밀번호 찾기</a>
		    </div>
    	</div>
    </div>
    
	<!-- footer 시작 -->
	<footer class="site-footer custom-border-top">
    	<jsp:include page="include/footer.jsp"/>
    </footer>
    <!-- footer 끝 -->
  </div>

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>

  <script src="js/main.js"></script>
    
  </body>
</html>