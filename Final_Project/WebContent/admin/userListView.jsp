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
            <h1 class="m-0">고객 조회</h1>
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
              <form action ="${pageContext.request.contextPath }/userListView.admin" method ="post" name="frm">
                
                <!-- 작업 -->
         <table class ="tbl" border="1">
			
			<tr>
				<td class=tdcol>검색어</td>

				<td>
					<select name ="searchKey">
						<option value="1">이름</option>
						<option value="2">아이디</option>
						<option value="3">이메일</option>
						<option value="4">전화번호</option>
					</select>

						<input type="text" name="searchValue" placeholder="내용을 입력해주세요">
				</td>
			</tr>
			<tr>
				<td class=tdcol>가입일/기념일</td>
	
				<td>
					<select>
						<option>가입일</option>
					</select>
					
					<input type="date" name="mindate" value="2022-01-01">~ <input type="date" name="maxdate" value="2022-12-31">
					
				</td>
			</tr>
		</table>
               
                 <div class="btn-submit">
                  <button type="submit" class="btn btn-primary">검색</button>
                 </div>
              </form>
              
              <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                        <th><input type="checkbox"></th>
						<th>이름</th>
						<th>아이디</th>
						<th>등록일</th>
						<th>휴대전화</th>
						<th>주소</th>
						<th>이메일</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:choose>
						<c:when test="${fn:length(resultList) eq 0}">
							<tr>
							 	<td class=td2 colspan="7">조회된 결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="resultList" items="${resultList}">
								<tr>
									<td class=td2><input type="checkbox" class="check"></td>
									<td class=td2>${resultList.user_name }</td>
									<td class=td2>${resultList.user_id }</td>
									<td class=td2>${resultList.user_joindate }</td>
									<td class=td2>${resultList.user_phonenum }</td>
									<td class=td2>${resultList.user_addr }</td>
									<td class=td2>${resultList.user_email }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
                  </tbody>
                </table>
            </div>
             <!-- 작업 -->
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
</body>
</html>
