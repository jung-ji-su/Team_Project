<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
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
  <% String[] titles = {"OutWear","Top","Bottom","Shoes","Accessory"};%>
  <c:set var="titles" value="<%= titles %>"/>
  <c:set var="arr_cnt" value="${requestScope.arr_cnt}"/>
  <c:set var="pvo" value="${requestScope.pvo }"/>
  <c:set var="list_products" value="${requestScope.list_products }"/>
  <c:set var="product_id" value="${param.product_id }"/>
  <c:set var="view" value="${param.view }"/>
  <c:set var="list_review" value="${requestScope.list_review}"/>
  <c:set var="list_pq" value="${requestScope.list_pq}"/>
  
  <div class="site-wrap">
    
	<!-- 상단바 시작 -->
	<header>
		<nav>
			<jsp:include page="include/top.jsp"></jsp:include>
		</nav>	
	</header>
    <!-- 상단바 끝 -->
    
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
        </div>
      </div>
    </div>  

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="item-entry">
              <a href="#" class="product-item md-height bg-gray d-block">
                <img src="${pvo.product_imgpath }" alt="Image" class="img-fluid">
              </a>
              
            </div>

          </div>
          <div class="col-md-6">
            <h2 class="text-black">${pvo.product_name }</h2>
            <p>${pvo.product_detail }</p>
            <p class="mb-4">${pvo.product_detail }</p>
            <p><strong class="text-primary h4"><fmt:formatNumber type="number" maxFractionDigits="3" value="${pvo.product_price}" /></strong></p>
	            <div class="mb-5">
	              <div class="input-group mb-3" style="max-width: 120px;">
	              <div class="input-group-prepend">
	                <button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
	              </div>
	              <input type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1" id="cart_quantity">
	              <div class="input-group-append">
	                <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
	              </div>
	            </div>
	
	            </div>
	            <span><a onclick="btn_submit(1,'${pvo.product_name }','${pvo.product_id}')" class="buy-now btn btn-sm height-auto px-4 py-3 btn-primary">Buy Now</a></span>
	            <span style="margin-left: 30px"><a onclick="btn_submit(2,'${pvo.product_name }','${pvo.product_id}')" class="buy-now btn btn-sm height-auto px-4 py-3 btn-primary">Add To Cart</a></span>
	            <p></p>
			
          </div>
        </div>
        <div class="row row-review">
          <div class="col-md-6"><h3 class="review_header"><a href="${pageContext.request.contextPath }/shop-single.shop?product_id=${product_id}&view=1">리뷰</a></h3></div>
          <div class="col-md-6"><h3 class="pq_header"><a href="${pageContext.request.contextPath }/shop-single.shop?product_id=${product_id}&view=2">상품문의</a></h3></div>
          	<c:choose>
          		 <c:when test="${view eq 1 || empty view}">
          			 	<c:choose>
          			 		 <c:when test="${fn:length(list_review) eq 0 }">
						          <div class="col-md-12">
						          	<p>아직 작성된 리뷰가 없습니다.</p>
						          </div>
					       	  </c:when>
					       	  <c:otherwise>
					       	  	<c:forEach var="list_review" items="${list_review}">
						       	  	  <div class="col-md-9">
							          	<div class="review-container">
							          		<h4>${list_review.title}</h4>
							          		<p>${list_review.content}</p>    		
							          	</div>
							          </div>
							       	  <div class="col-md-3">
							       	  	<p>${list_review.user_id}</p>
							       	  	<p>${list_review.review_date}</p>
							       	  </div>
						       	 </c:forEach>
					       	  </c:otherwise>
					  	</c:choose>
			       	  
			       	  <div class="col-md-12">
			       	  	<form action="${pageContext.request.contextPath }/reviewWrite.shop?product_id=${product_id}" method="post">
				       	  	<h3 class="reviewQna_header">리뷰 작성</h3>
				       	  	<p> 제목 </p>
				       	  	<input type="text" name="title" class="col-md-12">
				       	  	<p></p>
				       	  	<p> 내용 </p>
				       	  	<textarea rows="5" name="content" class="col-md-12"></textarea>
				       	  	<div align="center">
				       	  	<p><input type="submit" class="btn btn-sm height-auto px-4 py-3 btn-primary" value="작성하기"></p>
				       	  	</div>
				       	</form>
			       	  </div>
			       	  
		       	  </c:when>
		       	  <c:otherwise>
		       	  	<c:choose>
			       	  	  <c:when test="${fn:length(list_pq) eq 0 }">
							          <div class="col-md-12">
							          	<p>아직 작성된 리뷰가 없습니다.</p>
							          </div>
						  </c:when>
						  <c:otherwise>
						  	<c:forEach var="list_pq" items="${list_pq}">
					       	  <div class="col-md-9">
					          	<div class="review-container">
					          		<h4>${list_pq.title}</h4>
					          		<p>${list_pq.content}</p>    		
					          	</div>
					          </div>
					       	  <div class="col-md-3">
					       	  	<p>${list_pq.user_id}</p>
					       	  	<p>${list_pq.question_date}</p>
					       	  </div>
					       	</c:forEach>
				       	  </c:otherwise>
				      </c:choose> 	  
				       	  <div class="col-md-12">
				       	  	<form action="${pageContext.request.contextPath }/productQWrite.shop?product_id=${product_id}" method="post">
					       	  	<h3 class="pqQna_header">문의 작성</h3>
					       	  	<p> 제목 </p>
				       	  	<input type="text" name="title" class="col-md-12">
				       	  	<p></p>
				       	  	<p> 내용 </p>
				       	  	<textarea rows="5" name="content" class="col-md-12"></textarea>
				       	  	<div align="center">
				       	  	<p><input type="submit" class="btn btn-sm height-auto px-4 py-3 btn-primary" value="작성하기"></p>
				       	  	</div>
					       	  </form>
				       	  </div>
		       	  </c:otherwise>
	       	</c:choose>
        </div>
      </div>
    </div>
z
    <div class="site-section block-3 site-blocks-2">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-7 site-section-heading text-center pt-4">
            <h2>같은 카테고리 다른 인기 상품</h2>
          </div>
        </div>
        
        <div class="row">
          <div class="col-md-12 block-3">
            <div class="nonloop-block-3 owl-carousel">
            <c:forEach var="list_products" items="${list_products}">
	            <div class="item">
	                <div class="item-entry">
	                  <a href="${pageContext.request.contextPath }/shop-single.shop?product_id=${list_products.product_id}" class="product-item md-height bg-gray d-block">
	                    <img src="${list_products.product_imgpath }" alt="Image" class="img-fluid">
	                  </a>
	                  <h2 class="item-title"><a href="${pageContext.request.contextPath }/shop-single.shop?product_id=${list_products.product_id}">${list_products.product_name}</a></h2>
	                  <strong class="item-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list_products.product_price}" /></strong>
	                </div>
	              </div>
            </c:forEach>
              
            </div>
          </div>
        </div>
      
      </div>
    </div>
    
    <div class="site-section">
      <div class="container">
        <div class="title-section mb-5">
          <h2 class="text-uppercase"><span class="d-block">Discover</span> The Collections</h2>
        </div>
        <div class="row align-items-stretch">
          <div class="col-lg-4">
            <div class="product-item sm-height full-height bg-gray">
              <a href="${pageContext.request.contextPath }/getcategory.shop?category=1" class="product-category">${titles[0] } <span>${arr_cnt[0]}</span></a>
              <img src="images/products/outer/Cardigan.png" alt="Image" class="img-fluid">
            </div>
          </div>
          
          <div class="col-lg-4">
          
            <div class="product-item sm-height bg-gray mb-4">
              <a href="${pageContext.request.contextPath }/getcategory.shop?category=2" class="product-category">${titles[1] } <span>${arr_cnt[1]}</span></a>
              <img src="images/products/tops/Hoodie.png" alt="Image" class="img-fluid">
            </div>

            <div class="product-item sm-height bg-gray">
              <a href="${pageContext.request.contextPath }/getcategory.shop?category=3" class="product-category">${titles[2] } <span>${arr_cnt[2]}</span></a>
              <img src="images/products/bottoms/BlackSkirt.png" alt="Image" class="img-fluid">
            </div>
            
          </div>
          
          <div class="col-lg-4">
          
            <div class="product-item sm-height bg-gray mb-4">
              <a href="${pageContext.request.contextPath }/getcategory.shop?category=4" class="product-category">${titles[3] }<span>${arr_cnt[3]}</span></a>
              <img src="images/products/shoes/Boots.png" alt="Image" class="img-fluid">
            </div>

            <div class="product-item sm-height bg-gray">
              <a href="${pageContext.request.contextPath }/getcategory.shop?category=5" class="product-category">${titles[4] } <span>${arr_cnt[4]}</span></a>
              <img src="images/products/accessories/Necklace.png" alt="Image" class="img-fluid">
            </div>
            
          </div>
        </div>
      </div>
    </div>
    
	<!-- footer 시작 -->
	<footer class="site-footer custom-border-top">
    	<jsp:include page="include/footer.jsp"/>
    </footer>
    <!-- footer 끝 -->
  </div>
  <script>
  	function btn_submit(type,name,id){
  		let quantity = document.getElementById("cart_quantity").value;
  		if(type==1){
  			orderConfirm(name,quantity,id);
  		} else {
  			cartConfirm(name,quantity,id);
  		}
  	}
  	
  	function orderConfirm(name,quantity,id){
  		if(confirm("상품 : "+name+"\n수량  :"+ quantity + "\n결제하시겠습니까?")){
  			location.href="buy.shop?product_id="+id+"&cart_quantity="+quantity;
  		} else{
  			return false;
  		}
  	}
  	
  	function cartConfirm(name,quantity,id){
  		if(confirm("상품 : "+name+"\n수량  :"+ quantity + "\n장바구니에 담으시겠습니까?")){
  			location.href="addCart.shop?product_id="+id+"&cart_quantity="+quantity;
  		} else{
  			return false;
  		}
  	}
  </script>
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