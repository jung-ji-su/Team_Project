<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/dist/css/adminlte.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/plugins/daterangepicker/daterangepicker.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/custom/custom.css">
  
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <jsp:include page="${pageContext.request.contextPath }/admin/include/navbar.jsp"/>
  <!-- Main Sidebar Container -->
  <jsp:include page="${pageContext.request.contextPath }/admin/include/sidebar.jsp"/>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">상품 등록</h1>
          </div><!-- /.col -->
          
          
        </div><!-- /.row -->
      	
      
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
      	<div class="row">
          <!-- left column -->
          <div class="col-md-12">
       <form action="${pageContext.request.contextPath }/productInsert.admin" method="post" name="frm" encType = "multipart/form-data">
            <!-- general form elements -->
            <div class="card card-primary">
                
                
         
                <!-- 작업 -->


                    <table class = table_main border = "1">

                        <tr>
                            <td class = tdcol>상품명</td>
                            
                            <td class = tdcol2>
                                    <input class = textbox type="text" name="product_name" placeholder="(예시)플러워 미니 원피스)">
                            </td>

                            
                        </tr>

                        <tr>
                            <td class = tdcol>판매가</td>

                            <td class = tdcol2>               
                                    <input class = "textbox" type="text" name="product_price">                    
                            </td>

                        </tr>


                        <tr>
                            <td class = tdcol>상품 상세설명</td>

                            <td class = tdcol2>
                                    <input class = textbox2 type="text" name="product_detail">
                            </td>
                        </tr>

                        <tr>
                            <td class = tdcol>이미지</td>

                            <td>



                                <div class = image_space2>

                                    <input type = file name="product_img">

                                </div>
                                

                            </td>
                        </tr>
						<tr>
                            <td class = tdcol>상품 분류</td>
                            
                            <td class = tdcol2>

                                <select name="category">
                                    <option>분류</option>
                                    <option value="1">Outwear</option>
                                    <option value="2">Tops</option>
                                    <option value="3">Bottoms</option>
                                    <option value="4">Shoes</option>
                                    <option value="5">Accessories</option>
                                </select>

                            </td>
                        </tr>
                        </table>
    
    
    </div>
    	<input type="submit" value="등록하기">
    </form>
    	
                <!-- 작업 -->
            <!-- /.card -->

			</div>
          </div>
          <!--/.col (left) -->
          <!-- right column -->
          <!--/.col (right) -->
        </div>
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="${pageContext.request.contextPath }/admin/include/footer.jsp"/>
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="${pageContext.request.contextPath }/admin/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="${pageContext.request.contextPath }/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath }/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="${pageContext.request.contextPath }/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath }/admin/dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath }/admin/dist/js/demo.js"></script>
</body>
</html>
