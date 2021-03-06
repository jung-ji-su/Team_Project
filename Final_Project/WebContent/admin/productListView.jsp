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
  
  <%
  		String[] arr_category = {"Outwear","Tops","Bottoms","Shoes","Accessories"}; 
  %>
  <c:set var="arr_category" value="<%=arr_category %>"/>
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
            <h1 class="m-0">?????? ??????</h1>
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
          
            <!-- general form elements -->
            <div class="card card-primary">
              <!-- form start -->
              <form action ="${pageContext.request.contextPath }/productListView.admin" method ="post" name="frm">
                
                <!-- ?????? -->
         <table class ="tbl" border="1">
			<tr>
				<td class="tdcol">????????????</td>
				<td class="tdcol2">
					<select class = "" name="searchKey">
						<option value="1">?????????</option>
						<option value="2">????????????</option>
					</select>
						<input class = textbox_size type="text" name="searchValue">
				</td>
			</tr>
			<tr>
				<td class = "tdcol">????????????</td>
				<td>
					<select class = sel_1 name="category">
                        <option value="1">Outwear</option>
                        <option value="2">Tops</option>
                        <option value="3">Bottoms</option>
                        <option value="4">Shoes</option>
                        <option value="5">Accessories</option>
					</select> 
				</td>
			</tr>
			<tr>
				<td class="tdcol">???????????????</td>
				<td>
					<input type="date" name="mindate" value="2022-01-01">~ <input type="date" name="maxdate" value="2022-12-31">
				</td>
			</tr>

		</table>
               
                 <div class="btn-submit">
                  <button type="submit" class="btn btn-primary">??????</button>
                 </div>
              </form>
              
              <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      <th>????????????</th>
                      <th>????????????</th>
                      <th>?????????</th>
                      <th>?????????</th>
                      <th>???????????????</th>
                      <th>????????????</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:choose>
						<c:when test="${fn:length(resultList) eq 0}">
							<tr>
							 	<td class=td2 colspan="6">????????? ????????? ????????????.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="resultList" items="${resultList}">
								<tr>
									<td>${resultList.product_id }</td>
									<td>${arr_category[resultList.category-1]}</td>
									<td>${resultList.product_name }</td>
									<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${resultList.product_price }" /></td>
									<td>${resultList.product_date }</td>
									<td>
										<input type="button" value="??????" onclick="updateIt('${resultList.product_id }','${resultList.product_name }')">
										<input type="button" value="??????" onclick="deleteIt('${resultList.product_id }','${resultList.product_name }')">
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
                  </tbody>
                </table>
            </div>
             <!-- ?????? -->
            <!-- /.card -->


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


<script>
	function updateIt(id,name){
		if(confirm('?????? ?????? : '+id+'\n????????? : '+name+"\n?????????????????????????")){
			location.href = "${pageContext.request.contextPath }/admin/productUpdateView.jsp?product_id="+id;
		} else{
			return false;
		}
	}
	
	function deleteIt(id,name){
		if(confirm('?????? ?????? : '+id+'\n????????? : '+name+"\n?????????????????????????")){
			location.href = "${pageContext.request.contextPath }/productDelete.admin?product_id="+id;
		} else{
			return false;
		}
	}
</script>
</body>

</html>
