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
	    	<form action="${pageContext.request.contextPath }/join.login" method="post" name="frm">
			    <div class="login-text">
			    	<p class="login-p">이름</p>
			    	<input type="text" placeholder="이름 입력" class="login-input" id ="name" onchange="checkName()" name = "user_name">
			    	<div class="msg-pwcheck" id ="msg_name"></div>
			    </div>
			    <div class="login-text">
			    	<p class="login-p">아이디</p>
			    	<input type="text" placeholder="아이디 입력" class="login-input" id="id" onchange="checkId()" name = "user_id">
			    	<div class="msg-pwcheck" id ="msg_id"></div>
			    </div>
			    <div class="login-text">
			    	<p class="login-p">비밀번호</p>
			    	<input type="password" placeholder="비밀번호 입력" class="login-input" id ="pw1" onchange="checkPw()" name = "user_pw">
			    	<div class="msg-pwcheck" id ="msg_pw1"></div>
			    	<input type="password" placeholder="비밀번호 확인" class="login-input" id ="pw2" onchange="checkPwIsSame()">
			    	<div class="msg-pwcheck" id ="msg_pw2"></div>
			    </div>
			    <div class="login-text">
			    	<p class="login-p">이메일</p>
			    	<input type="text" placeholder="이메일 입력" class="login-input" id="email" onchange="checkEmail()" name = "user_email">
			    	<div class="msg-pwcheck" id="msg_email"></div>
			    </div>
			    <div class="login-text">
			    	<p class="login-p">전화번호</p>
			    	<select class="phoneSelect" name = "user_phonenum1">
			    		<option value="010">010</option>
			    		<option value="011">011</option>
			    		<option value="016">016</option>
			    		<option value="017">017</option>
			    		<option value="018">018</option>
			    		<option value="019">019</option>
			    	</select>
			    	-
			    	<input type="text" class="join-phoneNum" name = "user_phonenum2" id="phone2">
			    	-
			    	<input type="text" class="join-phoneNum" name = "user_phonenum3" id="phone3">
			    	<input type="button" value="인증요청" class="login-submit" id ="phonecheck" onclick="checkPhone()">
			    </div>
			    <div class="login-text">
			    	<input type="text" placeholder="인증번호 입력" class="login-input" name ="smskey">
			    </div>
			    
	    	</form>
		    	<input type="button" value="회원가입완료" class="login-submit" id ="joinc" onclick="sendit()">
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
  <script src="js/check.js"></script>
    
  </body>
</html>