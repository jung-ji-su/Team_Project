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

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/jquery-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.theme.default.min.css">

	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/aos.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/custom.css">
    
  </head>
  <body>
  
  
  <div class="site-wrap">
    
    
    <div class="login-container">
    	<div class ="login-div">
    		<div class ="login-logo">
    			<h1>SCULFUNK-Admin</h1>
	    	</div>
	    	<form action="${pageContext.request.contextPath }/login.admin" method="post">
			    <div class="login-text">
			    	<p class="login-p">아이디</p>
			    	<input type="text" placeholder="아이디입력" class="login-input" name ="id">
			    </div>
			    <div class="login-text">
			    	<p class="login-p">비밀번호</p>
			    	<input type="password" placeholder="비밀번호 입력" class="login-input" name ="pw">
			    </div>
		    	<input type="submit" value="로그인" class="login-submit" style="margin-bottom: 50px">
	    	</form>
    	</div>
    </div>
    
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