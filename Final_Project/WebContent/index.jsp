<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <div class="site-blocks-cover" data-aos="fade">
      <div class="container">
        <div class="row">
          <div class="col-md-6 ml-auto order-md-2 align-self-start">
            <div class="site-block-cover-content">
            <h2 class="sub-title">#New Collection 2022</h2>
            <h1>SCULFUNK COLLECTION</h1>
            <p><a href="${pageContext.request.contextPath }/shop.shop" class="btn btn-black rounded-0">Shop Now</a></p>
            </div>
          </div>
          <div class="col-md-6 order-1 align-self-end">
<!--             <img src="images/model_3.png" alt="Image" class="img-fluid"> -->
            <img src="images/total.png" alt="Image" class="img-fluid">
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
              <a href="${pageContext.request.contextPath }/getcategory.shop?category=1" class="product-category">OutWear <span></span></a>
              <img src="images/products/outer/Cardigan.png" alt="Image" class="img-fluid">
            </div>
          </div>
          
          <div class="col-lg-4">
          
            <div class="product-item sm-height bg-gray mb-4">
              <a href="${pageContext.request.contextPath }/getcategory.shop?category=2" class="product-category">Top<span></span></a>
              <img src="images/products/tops/Hoodie.png" alt="Image" class="img-fluid">
            </div>

            <div class="product-item sm-height bg-gray">
              <a href="${pageContext.request.contextPath }/getcategory.shop?category=3" class="product-category">Bottom <span></span></a>
              <img src="images/products/bottoms/BlackSkirt.png" alt="Image" class="img-fluid">
            </div>
            
          </div>
          
          <div class="col-lg-4">
          
            <div class="product-item sm-height bg-gray mb-4">
              <a href="${pageContext.request.contextPath }/getcategory.shop?category=4" class="product-category">Shoes<span></span></a>
              <img src="images/products/shoes/Boots.png" alt="Image" class="img-fluid">
            </div>

            <div class="product-item sm-height bg-gray">
              <a href="${pageContext.request.contextPath }/getcategory.shop?category=5" class="product-category">Accessory <span></span></a>
              <img src="images/products/accessories/Necklace.png" alt="Image" class="img-fluid">
            </div>
            
          </div>
        </div>
      </div>
    </div>


    
    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="title-section mb-5 col-12">
            <h2 class="text-uppercase">Popular Products</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 col-md-6 item-entry mb-4">
            <a href="${pageContext.request.contextPath }/shop-single.shop?product_id=102" class="product-item md-height bg-gray d-block">
              <img src="images/products/shoes/CombatBoots.png" alt="Image" class="img-fluid">
            </a>
            <h2 class="item-title"><a href="#">CombatBoots</a></h2>
            <strong class="item-price">$22.00</strong>
          </div>
          <div class="col-lg-4 col-md-6 item-entry mb-4">
            <a href="${pageContext.request.contextPath }/shop-single.shop?product_id=104" class="product-item md-height bg-gray d-block">
              <img src="images/products/shoes/RunningShoes.png" alt="Image" class="img-fluid">
            </a>
            <h2 class="item-title"><a href="#">RunningShoes</a></h2>
            <strong class="item-price"><del>$46.00</del> $28.00</strong>
          </div>

          <div class="col-lg-4 col-md-6 item-entry mb-4">
            <a href="${pageContext.request.contextPath }/shop-single.shop?product_id=119" class="product-item md-height bg-gray d-block">
              <img src="images/products/accessories/Beanie.png" alt="Image" class="img-fluid">
            </a>
            <h2 class="item-title"><a href="#">Beanie</a></h2>
            <strong class="item-price"><del>$46.00</del> $28.00</strong>

            <div class="star-rating">
              <span class="icon-star2 text-warning"></span>
              <span class="icon-star2 text-warning"></span>
              <span class="icon-star2 text-warning"></span>
              <span class="icon-star2 text-warning"></span>
              <span class="icon-star2 text-warning"></span>
            </div>

          </div>
          <div class="col-lg-4 col-md-6 item-entry mb-4">
            <a href="${pageContext.request.contextPath }/shop-single.shop?product_id=63" class="product-item md-height bg-gray d-block">
              <img src="images/products/tops/Sweater.png" alt="Image" class="img-fluid">
            </a>
            <h2 class="item-title"><a href="#">Sweater</a></h2>
            <strong class="item-price"><del>$46.00</del> $28.00</strong>
            <div class="star-rating">
              <span class="icon-star2 text-warning"></span>
              <span class="icon-star2 text-warning"></span>
              <span class="icon-star2 text-warning"></span>
              <span class="icon-star2 text-warning"></span>
              <span class="icon-star2 text-warning"></span>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 item-entry mb-4">
            <a href="${pageContext.request.contextPath }/shop-single.shop?product_id=60" class="product-item md-height bg-gray d-block">
              <img src="images/products/tops/BeigeKnit.png" alt="Image" class="img-fluid">
            </a>
            <h2 class="item-title"><a href="#">BeigeKnit</a></h2>
            <strong class="item-price"><del>$46.00</del> $28.00</strong>
          </div>
          <div class="col-lg-4 col-md-6 item-entry mb-4">
            <a href="${pageContext.request.contextPath }/shop-single.shop?product_id=62" class="product-item md-height bg-gray d-block">
              <img src="images/products/tops/StripeShirt.png" alt="Image" class="img-fluid">
            </a>
            <h2 class="item-title"><a href="#">StripeShirt</a></h2>
            <strong class="item-price">$58.00</strong>
          </div>

        </div>
      </div>
    </div>


    <div class="site-blocks-cover inner-page py-5" data-aos="fade">
      <div class="container">
        <div class="row">
          <div class="col-md-6 ml-auto order-md-2 align-self-start">
            <div class="site-block-cover-content">
            <h2 class="sub-title">#패션왕  #미남 </h2>
            <h1>2022 Outer</h1>
            <p><a href="${pageContext.request.contextPath }/getcategory.shop?category=1" class="btn btn-black rounded-0">Shop Now</a></p>
            </div>
          </div>
          <div class="col-md-6 order-1 align-self-end">
            <img src="images/we/chk2.png" alt="Image" class="img-fluid">
          </div>
        </div>
      </div>
    </div>
    
    
    <a id="back-to-top" class="btnTop" href="#">Top</a>
    
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
  <script src="js/top.js"></script>
    
  </body>
</html>