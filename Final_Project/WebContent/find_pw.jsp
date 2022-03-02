<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	    <form action="${pageContext.request.contextPath }/findpw.login" method = "post">	
	    	<div class="login-text">
		    	<p class="login-p">아이디</p>
		    	<input type="text" placeholder="아이디 입력" class="login-input" name="user_id">
			</div>
	    	<div class="login-text">
		    	<p class="login-p">이메일</p>
		    	<input type="text" placeholder="이메일 입력" class="login-input" name="user_email">
			</div>
			<div class="login-text">
			    	<p class="login-p">휴대폰번호</p>
			    	<select class="phoneSelect-FP" name = "user_phonenum1">
			    		<option value="010">010</option>
			    		<option value="011">011</option>
			    		<option value="016">016</option>
			    		<option value="017">017</option>
			    		<option value="018">018</option>
			    		<option value="019">019</option>
			    	</select>
			    	-
			    	<input type="text" class="join-phoneNum-FP" name = "user_phonenum2">
			    	-
			    	<input type="text" class="join-phoneNum-FP" name = "user_phonenum3">
			    </div>
			   <input type="submit" value="비밀번호찾기" class="login-submit" id ="joinc">
		</form>
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