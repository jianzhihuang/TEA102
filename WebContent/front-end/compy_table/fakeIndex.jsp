<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>假首頁-用於業者註冊</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/front-use/index_use/main.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/front-use/index_use/reset.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/front-use/index_use/style.css">
	<script src="<%=request.getContextPath() %>/js/jquery/jquery-3.5.1.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/jquery/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/index_use/main.js"></script>
</head>
<body>
<div class="topBackplane">
	<jsp:include page="/front-end/public_jsp/header.jsp"></jsp:include>
</div>

	<div class="slideshow">
		<div class="slideshow-slides">
			<a href="javascript: void(0)" class="slide" id="slide-1"><img src="<%=request.getContextPath() %>/images/slide-1.jpg" alt="" width="1600"
					height="465"></a>
			<a href="javascript: void(0)" class="slide" id="slide-2"><img src="<%=request.getContextPath() %>/images/slide-2.jpg" alt="" width="1600"
					height="465"></a>
			<a href="javascript: void(0)" class="slide" id="slide-3"><img src="<%=request.getContextPath() %>/images/slide-3.jpg" alt="" width="1600"
					height="465"></a>
			<a href="javascript: void(0)" class="slide" id="slide-4"><img src="<%=request.getContextPath() %>/images/slide-4.jpg" alt="" width="1600"
					height="465"></a>
		</div>
		<div class="slideshow-nav">
			<a href="javascript: void(0)" class="prev">Prev</a>
			<a href="javascript: void(0)" class="next">Next</a>
		</div>
		<div class="slideshow-indicator"></div>
	</div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <hr>
    <br>
    <br>
    <br>
    <br>
    <h1>業者專區</h1>
    <p><a href="<%=request.getContextPath() %>/back-end/compy_table/back_selectCompy.jsp">後台-點擊我看業者後臺資料</a></p>
    <div class="footer">
    	<jsp:include page="/front-end/public_jsp/footer.jsp"></jsp:include>
    </div>
</body>
</html>