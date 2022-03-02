<%@page import="mypage.MyProduct_qVO"%>
<%@page import="mypage.MyCartVO"%>
<%@page import="mypage.MyOrderVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <title>ShopMax &mdash; Colorlib e-Commerce Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="/fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
	


	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/custom.css">
    <link rel="stylesheet" href="css/mypage.css">
    
  </head>
  <body>
  	<% 
  		UserVO uvo = (UserVO)session.getAttribute("session_user");
  	%>
  	<c:set var="list_order" value="${requestScope.list_order }"/>
  	<c:set var="list_cart" value="${requestScope.list_cart }"/>
  	<c:set var="list_product_q" value="${requestScope.list_product_q }"/>
  		
  <div class="site-wrap">
    
	<!-- 상단바 시작 -->
	<header>
		<nav>
			<jsp:include page="include/top.jsp"></jsp:include>
		</nav>	
	</header>
    <!-- 상단바 끝 -->
    
    
     <div class="mypage-container">
    	<div class ="mypage-div">
    		<div class="mypage-title-top"><h1>회원정보</h1></div>
    		<table class = "mypage-info-tb" border=1>
				<tr>
					<td>
						<img src="images/User.jpg" width=130 height=130>
					</td>
					<td>
						<p>${sessionScope.session_user.user_name }</p>
						<p>프로필수정</p>
					</td>
					<td class="mypage-info-td">
						<img src="images/dollar.png" width=70 height=70>
						<p>적립금</p>
						<p>1,502원</p>
					</td>
					<td class="mypage-info-td">
						<img src="images/point.png" width=70 height=70>
						<p>포인트</p>
						<p>139p</p>
					</td>
					<td class="mypage-info-td">
						<img src="images/coupon.png" width=70 height=70>
						<p>쿠폰</p>
						<p>3개</p>
					</td>
					<td class="mypage-info-td">
						<img src="images/heart.png" width=70 height=70>
						<p>후기작성</p>
					</td>
				</tr>    		
    		</table>
    		
    		<div class="mypage-title"><h1>주문내역조회</h1></div>
    			<table class="mypage-tb">
    				<tr>
    					<th>상품정보</th>
    					<th>주문수량</th>
    					<th>주문일자</th>
    					<th>주문번호</th>
    					<th>주문금액</th>
    				</tr>
    				
    				<c:forEach var="list_order" items="${list_order }">
    					<tr>
							<td><a href="${pageContext.request.contextPath }/shop-single.shop?product_id=${list_order.product_id}">${list_order.product_name }</a></td>    					
							<td>${list_order.od_quantity }</td>    					
							<td>${list_order.order_date }</td>    					
							<td>${list_order.order_id }</td>    					
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list_order.totalPrice}" /></td> <!-- 화폐형식으로변경 -->   					
    					</tr>
    				</c:forEach>
    				
    			</table>
    			
    		<div class="mypage-title"><h1>장바구니</h1></div>
    		<form action="${pageContext.request.contextPath }/cartToOrder.mypage" name="frm">
    			<table class="mypage-tb">
    				<tr>
    					<th>상품정보</th>
    					<th>상품금액</th>
    					<th>수량</th>
    					<th>총금액</th>
    					<th>선택</th>
    				</tr>
    			
    				<c:forEach var="list_cart" items="${list_cart }">
    					<tr>
							<td><a href="${pageContext.request.contextPath }/shop-single.shop?product_id=${list_cart.product_id}">${list_cart.product_name}</a></td>    					
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list_cart.product_price}" /></td>    					
							<td>${list_cart.cart_quantity}</td>    					
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list_cart.totalprice}" /></td>    					
							<td><input type="checkbox" name="cart_id" value="${list_cart.cart_id}"></td>
    					</tr>
    				</c:forEach>
    			</table>
    				
    				<input type="button" class="btn1-mypage" value="선택한 상품 주문하기" onclick="sendit()">
    		</form>
    			
    		<div class="mypage-title"><h1>상품문의</h1></div>
    			<table class="mypage-tb">
    				<tr>
    					<th>상품정보</th>
    					<th>제목</th>
    					<th>작성일</th>
    					<th>처리상태</th>
    					<th>답변보기</th>
    				</tr>
    				<c:forEach var="list_product_q" items="${list_product_q }">
    					<tr class="td${list_product_q.question_id}">
							<td>${list_product_q.product_name}</td>    					
							<td>${list_product_q.question_title}</td>    					
							<td>${list_product_q.question_date}</td>    					
							<td>${list_product_q.replystate}</td>
							<c:choose>
								<c:when test="${list_product_q.replystate eq '완료됨' }">  
									<td><input type="button" class="btn btn-sm height-auto px-4 py-3 btn-primary" value="답변보기 "onclick="viewContents('${list_product_q.question_id}')"></td>
								</c:when>  
								<c:otherwise>
									<td></td>
								</c:otherwise>
							</c:choose>
    					</tr>
    					<tr class="contents-tr">
    						<td colspan="5">
    							<p>답변한 관리자 :  ${list_product_q.manager_id}</p>
    							<p>제목 :  ${list_product_q.title}</p>
    							<p>내용 :  ${list_product_q.contents}</p>
    						</td>
    					</tr>
    				</c:forEach>
    			</table>
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
    <script>
    	function sendit(){
    		if(confirm("선택한 상품을 주문하시겠습니까?")){
    			document.frm.submit();
    		} else{
    			return false;
    		}
    	}
    	
    	function viewContents(id){
    		$(".td"+id).next(".contents-tr").slideToggle(100);
    	}
    </script>
  </body>
</html>