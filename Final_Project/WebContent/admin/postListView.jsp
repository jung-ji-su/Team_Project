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
  	String[] arr_type = {"상품문의","공지사항","리뷰","Q&A"};
  %>
  <c:set var="arr_type" value="<%=arr_type %>"/>
  <c:set var="postKey" value="${requestScope.postKey }"/>
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
            <h1 class="m-0">게시글 조회</h1>
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
              <form action="${pageContext.request.contextPath }/postListView.admin" method = "post" name="frm">
                
                <!-- 작업 -->
         <table class ="tbl" border="1">
			<tr>
					<td class=tdcol>게시판 선택</td>
	
					<td>
						<select name="postKey" class = sel_1>
							<option value="1">상품문의</option>
							<option value="2">공지사항</option>
							<option value="3">리뷰</option>
							<option value="4">Q&A</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td class=tdcol>기간</td>
	
					<td>
	                   <input type="date" value="2022-01-01" name="mindate" >~
	                   <input type="date" value="2022-12-31" name="maxdate">
					</td>
				</tr>
				<tr>
					<td class=tdcol>게시글 찾기</td>
					<td>
						<select name="searchKey" class = sel_2>
							<option value="1">제목</option>
							<option value="2">작성자</option>
							<option value="3">내용</option>
						</select>
						<input type="text" name="searchValue" placeholder="내용을 입력해주세요">
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
					 <th>분류</th>
					 <th>작성자</th>
					 <th class = td_3>제목</th>
					 <c:if test="${postKey eq '1'||postKey eq '4'}">
					 	<th>답변상태</th>
					 </c:if>
					 <th></th>
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
								<tr class="td1${resultList.id }">
									<td class=td2>${arr_type[postKey-1] }</td>
									<td class=td2>${resultList.user_id }</td>
									<td class=td2>${resultList.title }</td>
									<c:if test="${postKey eq '1'||postKey eq '4'}">
										<td class=td2>${resultList.replystate }</td>
									</c:if>
									<td class=td2>
										<input type="button" value="내용보기" onclick="viewContent('${resultList.id}')">
										<c:if test="${postKey ne '2' }">
											<input type="button" value="삭제하기" onclick="deleteIt('${resultList.id}','${postKey}')">
										</c:if>
										<c:if test="${postKey eq '1'||postKey eq '4'}">
											<input type="button" value="답변하기" onclick="viewForm('${resultList.id}')">
										</c:if>
									</td>
								</tr>
								<tr class="content-tr">
									<td colspan="6" >${resultList.contents}</td>
								</tr>
								<tr class="reply-tr">
										<td colspan="6" >
											<form action="${pageContext.request.contextPath }/insertReply.admin?postKey=${postKey}&id=${resultList.id}" method="post">
												<p>제목</p><input type="text" name="title">
												<p>내용</p><textarea name="contents" cols="50" rows="10"></textarea>
												<input type="submit" value="답변하기">
											</form>
										</td>
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

<script>
	function viewContent(id){
		$(".td1"+id).next(".content-tr").slideToggle(100);
	}
	
	function deleteIt(id,postKey){
		if(confirm('해당글을 정말로 삭제하시겠습니까?')){
			location.href = "${pageContext.request.contextPath }/postDelete.admin?postKey="+postKey+"&id="+id;
		} else{
			return false;
		}
	}
	
	function viewForm(id){
		console.log(id);
		$(".td1"+id).next(".content-tr").next().slideToggle(100);
	}
</script>
</body>
</html>
