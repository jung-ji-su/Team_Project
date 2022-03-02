<%@page import="user.UserVO"%>
<%@page import="util.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO uvo = (UserVO)session.getAttribute("session_user");
	String login_str = uvo!=null?"로그아웃":"로그인";
%>

  
	<!-- 상단바 시작 -->
    <div class="site-navbar bg-white py-2" style ="position:fixed; width:100%;">

      <div class="search-wrap">
        <div class="container">
          <a href="#" class="search-close js-search-close"><span class="icon-close2"></span></a>
          <form action="${pageContext.request.contextPath }/shop-search.shop" method="post">
            <input type="text" class="form-control" placeholder="Search keyword and hit enter..." name="searchValue">
          </form>  
        </div>
      </div>

      <div class="container">
        <div class="d-flex align-items-center justify-content-between">
          <div class="logo">
             <!-- <div class="site-logo">  로고 -->
             <div>
             <a href="index.jsp">
              <img alt="Image" src="images/logo_11.png" height="60" width ="180">
	         </a> 
            </div>
          </div>
          <div class="main-nav d-none d-lg-block">
            <nav class="site-navigation text-right text-md-center" role="navigation">
              <ul class="site-menu js-clone-nav d-none d-lg-block">
                <li class="has-children active">
                  <a href="${pageContext.request.contextPath }/shop.shop">상품</a>
                  <ul class="dropdown">
	                   <li><a href="${pageContext.request.contextPath }/getcategory.shop?category=1">OutWear</a></li> 
	                   <li><a href="${pageContext.request.contextPath }/getcategory.shop?category=2">Top</a></li> 
	                   <li><a href="${pageContext.request.contextPath }/getcategory.shop?category=3">Bottom</a></li> 
	                   <li><a href="${pageContext.request.contextPath }/getcategory.shop?category=4">Shoes</a></li> 
	                   <li><a href="${pageContext.request.contextPath }/getcategory.shop?category=5">Accessory</a></li> 
                  </ul>
                  	 <li><a href="${pageContext.request.contextPath }/login.login"><%= login_str%></a></li>
                  	 <li><a href="${pageContext.request.contextPath }/logincheck.mypage">마이페이지</a></li>
                  	 <li><a href="${pageContext.request.contextPath }/customer_service.jsp">고객센터</a></li>
              </ul>
            </nav>
          </div>
          <div class="icons">
            <a href="#" class="icons-btn d-inline-block js-search-open"><span class="icon-search"></span></a>
            <a href="#" class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span class="icon-menu"></span></a>
          </div>
        </div>
      </div>
    </div>
    <!-- 상단바 끝 -->

