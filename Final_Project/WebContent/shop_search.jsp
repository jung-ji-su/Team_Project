<%@page import="shop.ProductsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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


    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/shop.css">
    
  </head>
  <body>
  	<% String[] titles = {"OutWear","Top","Bottom","Shoes","Accessory"};%>
  	<c:set var="titles" value="<%= titles %>"/>
  	<c:set var="searchCnt" value="${requestScope.searchCnt }"/>
  	<c:set var="list_products" value="${requestScope.list_products}"/>
  	<c:set var="arr_cnt" value="${requestScope.arr_cnt}"/>  	
  	<c:set var="searchValue" value="${requestScope.searchValue}"/>  	
  <div class="site-wrap">
    

    <!-- 상단바 시작 -->
	<header>
		<nav>
			<jsp:include page="include/top.jsp"></jsp:include>
		</nav>	
	</header>
    <!-- 상단바 끝 -->
    
    <div class="site-blocks-cover inner-page" data-aos="fade">
      <div class="container">
        <div class="row">
          <div class="col-md-6 ml-auto order-md-2 align-self-start">
            <div class="site-block-cover-content">
            <h2 class="sub-title">#New Summer Collection 2019</h2>
            <h1>Arrivals Sales</h1>
            <p><a href="#" class="btn btn-black rounded-0">Shop Now</a></p>
            </div>
          </div>
          <div class="col-md-6 order-1 align-self-end">
            <img src="images/model_4.png" alt="Image" class="img-fluid">
          </div>
        </div>
      </div>
    </div>

    <div class="custom-border-bottom py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Shop</strong></div>
        </div>
      </div>
    </div>


    <div class="site-section">    <!--  상품 시작 -->
      <div class="container">

        <div class="row mb-5">
          <div class="col-md-9 order-1">  <!--  -->

            <div class="row align">
              <div class="col-md-12 mb-5">
                <div class="float-md-left"><h2 class="text-black h5">Shop All</h2></div>
                <div class="d-flex">
                  <div class="dropdown mr-1 ml-md-auto">
                    <button type="button" class="btn btn-white btn-sm dropdown-toggle px-4" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Latest
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                      <a class="dropdown-item" href="#">Men</a>
                      <a class="dropdown-item" href="#">Women</a>
                      <a class="dropdown-item" href="#">Children</a>
                    </div>
                  </div>
                  <div class="btn-group">
                    <button type="button" class="btn btn-white btn-sm dropdown-toggle px-4" id="dropdownMenuReference" data-toggle="dropdown">Reference</button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuReference">
                      <a class="dropdown-item" href="#">Relevance</a>
                      <a class="dropdown-item" href="#">Name, A to Z</a>
                      <a class="dropdown-item" href="#">Name, Z to A</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Price, low to high</a>
                      <a class="dropdown-item" href="#">Price, high to low</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            <h1 class="search_title"> <a href="#">"${searchValue}"으로 검색한 상품 목록</a></h1>
            <div class="row mb-5"> 
            
				<c:forEach var="list_products" items="${list_products}">
	              <div class="col-lg-6 col-md-6 item-entry mb-4">
	                <a href="${pageContext.request.contextPath }/shop-single.shop?product_id=${list_products.product_id}" class="product-item md-height bg-gray d-block">
	                  <img src="${list_products.product_imgpath }" alt="Image" class="img-fluid">
	                </a>
	                <h2 class="item-title"><a href="${pageContext.request.contextPath }/shop-single.shop?product_id=${list_products.product_id}">${list_products.product_name }</a></h2>
	                <strong class="item-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list_products.product_price}" /></strong>
	              </div>
              	</c:forEach>
              
            </div>
            
            <div class="row">
              <div class="col-md-12 text-center">
                <div class="site-block-27">
                  <ul>
                  	<c:if test="${nowPage > 1 }">
                    	<li><a href="${pageContext.request.contextPath }/shop-search.shop?searchValue=${searchValue}&page=${nowPage-1}">&lt;</a></li>
                    </c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage }">
						<c:choose>
							<c:when test="${i==nowPage }">
								<li class="active"><a>${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath }/shop-search.shop?searchValue=${searchValue}&page=${i}">${i}</a></li>
							</c:otherwise>
	                    </c:choose>
                    </c:forEach>
                    <c:if test="${nowPage<totalPage }">
                    	<li><a href="${pageContext.request.contextPath }/shop-search.shop?searchValue=${searchValue}&page=${nowPage+1}">&gt;</a></li>
                    </c:if>
                  </ul>
                </div>
              </div>
            </div>
            
            
          </div>

          <div class="col-md-3 order-2 mb-5 mb-md-0"> <!-- 좌측바 -->
            <div class="border p-4 rounded mb-4">
              <h3 class="mb-3 h6 text-uppercase text-black d-block"><a href="${pageContext.request.contextPath }/shop.shop">Categories</a></h3>
              <ul class="list-unstyled mb-0">
              	<c:forEach var="i" begin="0" end="${fn:length(arr_cnt)-1 }">
              		<li class="mb-1"><a href="${pageContext.request.contextPath }/getcategory.shop?category=${i+1}" class="d-flex"><span>${ titles[i]}</span> <span class="text-black ml-auto">${arr_cnt[i]}</span></a></li>
              	</c:forEach>
              </ul>
            </div>

            <div class="border p-4 rounded mb-4">
              <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Filter by Price</h3>
                <div id="slider-range" class="border-primary"></div>
                <input type="text" name="text" id="amount" class="form-control border-0 pl-0 bg-white" disabled="" />
              </div>

              <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Size</h3>
                <label for="s_sm" class="d-flex">
                  <input type="checkbox" id="s_sm" class="mr-2 mt-1"> <span class="text-black">Small (2,319)</span>
                </label>
                <label for="s_md" class="d-flex">
                  <input type="checkbox" id="s_md" class="mr-2 mt-1"> <span class="text-black">Medium (1,282)</span>
                </label>
                <label for="s_lg" class="d-flex">
                  <input type="checkbox" id="s_lg" class="mr-2 mt-1"> <span class="text-black">Large (1,392)</span>
                </label>
              </div>

              <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Color</h3>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-danger color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Red (2,429)</span>
                </a>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-success color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Green (2,298)</span>
                </a>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-info color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Blue (1,075)</span>
                </a>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-primary color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Purple (1,075)</span>
                </a>
              </div>

            </div>
          </div>
        </div>

      </div>
    </div> <!--  상품 끝 -->

    <div class="site-section">
      <div class="container">
        <div class="title-section mb-5">
          <h2 class="text-uppercase"><span class="d-block">Discover</span> The Collections</h2>
        </div>
        <div class="row align-items-stretch">
          <div class="col-lg-4">
            <div class="product-item sm-height full-height bg-gray">
              <a href="${pageContext.request.contextPath }/getcategory.shop?category=1" class="product-category">${titles[0] } <span>${arr_cnt[0]}</span></a>
              <img src="images/model_4.png" alt="Image" class="img-fluid">
            </div>
          </div>
          
          <div class="col-lg-4">
          
            <div class="product-item sm-height bg-gray mb-4">
              <a href="${pageContext.request.contextPath }/getcategory.shop?category=2" class="product-category">${titles[1] } <span>${arr_cnt[1]}</span></a>
              <img src="images/model_5.png" alt="Image" class="img-fluid">
            </div>

            <div class="product-item sm-height bg-gray">
              <a href="${pageContext.request.contextPath }/getcategory.shop?category=3" class="product-category">${titles[2] } <span>${arr_cnt[2]}</span></a>
              <img src="images/model_6.png" alt="Image" class="img-fluid">
            </div>
            
          </div>
          
          <div class="col-lg-4">
          
            <div class="product-item sm-height bg-gray mb-4">
              <a href="${pageContext.request.contextPath }/getcategory.shop?category=4" class="product-category">${titles[3] }<span>${arr_cnt[3]}</span></a>
              <img src="images/model_5.png" alt="Image" class="img-fluid">
            </div>

            <div class="product-item sm-height bg-gray">
              <a href="${pageContext.request.contextPath }/getcategory.shop?category=5" class="product-category">${titles[4] } <span>${arr_cnt[4]}</span></a>
              <img src="images/model_6.png" alt="Image" class="img-fluid">
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