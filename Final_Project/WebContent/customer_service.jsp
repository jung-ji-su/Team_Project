<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SCUFUNK 고객센터 홈 &mdash; Colorlib e-Commerce Template</title>
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
  

</head>
<body>
<jsp:include page="include/top.jsp"></jsp:include>
<!-- 구분자 -->
 <br>
 <br>
 <br>
<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/index.jsp">메인 페이지</a></li>
    <li class="breadcrumb-item active" aria-current="page">고객센터</li>
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
        <a href="fnq.jsp" target="_self">FAQ 자주묻는 질문</a><br>
		<a href="notice.login" target="_self">Notice 공지사항</a><br>
		<a href="qna.login" target="_self">Q&A 1:1문의</a>
    </div>
  </div>
</div>

<div class="container" style="font-size:1.0em;  color: black;">
  <div class="row">
    <div class="col">
      <button type="button" onclick="location.href='fnq.jsp'">FAQ <br>자주 묻는 질문<br></button>
    </div>
    <div class="col">
		<button type="button" onclick="location.href='notice.login'"> Notice <br>공지사항<br></button>
    </div>
    <div class="col">
		<button type="button" onclick="location.href='qna.login'"> Q&A <br>문의하기<br></button>
    </div>
  </div>
</div>

<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>