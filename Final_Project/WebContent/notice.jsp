<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SCUFUNK Q&A page &mdash; Colorlib e-Commerce Template</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">


    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
    
    <link rel="stylesheet" href="css/custom2.css">
  

<c:set var="noticeList" value="${requestScope.noticeList}"/>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<jsp:include page="include/top.jsp"></jsp:include>

 <br>
 <br>
 <br>
<!-- 구분자 -->
<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="customer_service.html">고객센터</a></li>
    <li class="breadcrumb-item active" aria-current="page">1:1문의하기</li>
  </ol>
</nav>
 
<!-- 상단 부분 시작-->
<div class="container" style="font-size:1.0em;  color: black;">
  <div class="row">
    <div class="col">
      TEL. 000-000 <br>OPEN : 09:00 ~ 18:00<br>LUNCH : 12:00 ~ 13:00<br>토요일, 일요일 OFF 
    </div>
    <div class="col">
		국민은행 699202-01-240933<br>예금주 : 김민혁<br>주소 : 서울 강남구 테헤란로 146 3-4층
    </div>
    <div class="col">
		<a href="customer_service.jsp" target="_self">고객센터 홈</a><br>
        <a href="fnq.jsp" target="_self">FAQ 자주묻는 질문</a><br>
		<a href="notice.login" target="_self">Notice 공지사항</a><br>
    </div>
  </div>
</div>

<!-- 상단 부분  끝-->

<hr align="left" width=100%>
<!-- 상단 텍스트 부분 시작-->
<h4 class="hfont">공지사항</h4>
<hr align="left" width=100%>
<!-- 상단 텍스트 부분 끝-->

<table border=1 style="width :100%; text-align: center;">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>
	<c:choose>
		<c:when test="${fn:length(noticeList) eq 0}">
			<tr>
				<td colspan="3">작성된 공지사항이 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="noticeList" items="${ noticeList}">
				<tr class="td${noticeList.notice_id}">
					<td>${noticeList.notice_id}</td>
					<td>${noticeList.title}</td>
					<td>${noticeList.manager_id}</td>
					<td>${noticeList.regdate}</td>
					<td><input type="button" value="내용보기" onclick="viewContents('${noticeList.notice_id}')"></td>
				</tr>
				<tr class="contents-tr" style="display: none;">
					<td colspan="3">${noticeList.content}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>

<jsp:include page="include/footer.jsp"></jsp:include>

<script src="js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<script>
	function viewContents(id){
		$(".td"+id).next(".contents-tr").slideToggle(100);
	}
</script>
</body>
</html>