<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h4 class="hfont">1:1 Q&A</h4>
<div>
<p style="font-size:0.8em; color:red;">제품 사용, 오염, 전용 박스 손상, 라벨 제거, 사은품 및 부속 사용/분실 시, 교환/환불이 불가능 합니다.<br>
교환을 원하시는 상품(사이즈)의 재고가 부족 시, 교환이 불가합니다.<br></p>
<p style="font-size:0.8em;" >
제품 사용, 오염, 전용 박스 손상, 라벨 제거, 사은품 및 부속 사용/분실 시, 교환/환불이 불가능 합니다.<br>
교환을 원하시는 상품(사이즈)의 재고가 부족 시, 교환이 불가합니다.<br>
고객님의 주문내역을 선택, 질문이 필요한 상품을 선택하시면 1:1상담이 가능합니다.<br>
주문취소/교환/환불은 마이페이지>주문내역에서 신청하실 수 있습니다.<br>
1:1문의 처리 내역은 마이페이지>1:1문의를 통해 확인하실 수 있습니다.<br>
상품 정보(사이즈, 실측, 예상 배송일 등) 관련 문의는 해당 상품 문의에 남기셔야 빠른 답변이 가능합니다.</p>
</div>
<hr align="left" width=100%>
<!-- 상단 텍스트 부분 끝-->

<!-- 문의 작성 -->

<form action="${pageContext.request.contextPath }/qnaOk.login" class="row g-3" style="font-size:1.0em;  color: black;" method="post">
  <div class="col-sm-10">
    <label for="inputHeadline" class="form-label">제목</label>
    <input type="text" class="form-control" name="title">
  </div>
  <div class="col-sm-10">
    <label for="inputText" class="form-label">문의내용</label>
    <input type="text" class="form-control" name="contents">
  </div>

  <div class="col-sm10">
    <button type="submit" class="btn btn-primary">저장하기</button>
  </div>
</form>




<!-- 버튼 -->
<!-- <div class="container"> -->
<!-- 	<div class="btn-group" role="group" aria-label="..."> -->
<!-- <button type="button" class="btn btn-default">취소하기</button> -->
<!-- <button type="submit" class="btn btn-default" onclick="alert('저장되었습니다.')">저장하기</button> -->
<!-- </div> -->
<!-- </div> -->

<hr align="left" width=100%>

<jsp:include page="include/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

</body>
</html>