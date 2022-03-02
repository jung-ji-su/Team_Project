<%@page import="admin.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
	<c:when test="${empty sessionScope.session_admin }">
		<c:set var="imgpath" value="images/admin/default.png"/>
		<c:set var="name" value="로그인 해주세요"/>
	</c:when>
	<c:otherwise>
		<c:set var="imgpath" value="${sessionScope.session_admin.mg_imgpath}"/>
		<c:set var="name" value="${sessionScope.session_admin.mg_name}"/>
	</c:otherwise>
</c:choose>
<!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="${pageContext.request.contextPath }/admin/index.jsp" class="brand-link">
      <img src="${pageContext.request.contextPath }/admin/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">SCULFUNK-Admin</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="${pageContext.request.contextPath }/${imgpath}" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">${name}</a>
        </div>
      </div>

      

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          
          <li class="nav-item">
            <a href="#" class="nav-link">
              <p>
                	상품 관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${pageContext.request.contextPath }/admin/insertProduct.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>상품 등록</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath }/admin/productListView.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>상품 조회</p>
                </a>
              </li>
            </ul>
          </li>
          
          <li class="nav-item">
            <a href="#" class="nav-link">
              <p>
                	고객 관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${pageContext.request.contextPath }/admin/userListView.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>고객 조회</p>
                </a>
              </li>
            </ul>
          </li>
          
          <li class="nav-item">
            <a href="#" class="nav-link">
              <p>
                	주문 관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${pageContext.request.contextPath }/admin/orderListView.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>주문 조회</p>
                </a>
              </li>
            </ul>
          </li>
          
          
          <li class="nav-item">
            <a href="#" class="nav-link">
              <p>
                	게시글관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${pageContext.request.contextPath }/admin/postListView.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>게시글 조회</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath }/admin/noticeInsert.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>공지사항 작성</p>
                </a>
              </li>
            </ul>
          </li>
          
          <li class="nav-item">
            <a href="#" class="nav-link">
              <p>
                	관리자 메뉴
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${pageContext.request.contextPath }/admin/adminProfileUpdate.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>관리자 프로필 수정</p>
                </a>
              </li>
            </ul>
          </li>
          
          <c:if test="${sessionScope.session_admin.authority eq 'Y'}">
	          <li class="nav-item">
	            <a href="#" class="nav-link">
	              <p>
	                	최고관리자 메뉴
	                <i class="right fas fa-angle-left"></i>
	              </p>
	            </a>
	            <ul class="nav nav-treeview">
	              <li class="nav-item">
	                <a href="${pageContext.request.contextPath }/admin/adminInsert.jsp" class="nav-link">
	                  <i class="far fa-circle nav-icon"></i>
	                  <p>관리자 계정 생성</p>
	                </a>
	              </li>
	              <li class="nav-item">
	                <a href="${pageContext.request.contextPath }/adminDelete.admin" class="nav-link">
	                  <i class="far fa-circle nav-icon"></i>
	                  <p>관리자 계정 삭제</p>
	                </a>
	              </li>
	            </ul>
	          </li>
          </c:if>
          
		</ul>
      </nav>
      
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>