<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.rest_table.model.Rest_TableVO"%>
<%@page import="com.rest_table.model.Rest_TableService"%>
<%@page import="java.io.OutputStream"%>
<%@page import="javax.servlet.http.Part"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%@page import="com.feedback_table.model.Feedback_TableVO"%>
<%@page import="com.feedback_table.model.Feedback_TableService"%>

<%	

	Rest_TableService rest_Tablesvc = new Rest_TableService();
	String rs_id = request.getParameter("value");
	Rest_TableVO rest_TableVO = (Rest_TableVO) rest_Tablesvc.getOneAll(rs_id);
	pageContext.setAttribute("rest_TableVO", rest_TableVO);
	String addressLine=rest_TableVO.getRs_address();
	String[] address=addressLine.split(",");
	String realyAddress=address[2];
	pageContext.setAttribute("address", realyAddress);
	Rest_TableVO rest_TablePhoto = (Rest_TableVO) rest_Tablesvc.getOneAllOnlyPic(rs_id);
	pageContext.setAttribute("rest_TablePhoto", rest_TablePhoto);
	
	

	
	
	Feedback_TableService fbtService = new Feedback_TableService();
	List<Feedback_TableVO> statList = fbtService.getRs_star(rs_id);
	pageContext.setAttribute("statList", statList);
	
%>


<!DOCTYPE html>
<html>
<head>
<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>訂味</title>
<!-- FAVICON -->
<link href="img/favicon.png" rel="shortcut icon">
<!-- PLUGINS CSS STYLE -->
<!-- <link href="plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet"> -->
<!-- Bootstrap -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/bootstrap/css/bootstrap-slider.css">
<!-- Font Awesome -->
<link
	href="<%=request.getContextPath()%>/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Owl Carousel -->
<link
	href="<%=request.getContextPath()%>/plugins/slick-carousel/slick/slick.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/plugins/slick-carousel/slick/slick-theme.css"
	rel="stylesheet">
<!-- Fancy Box -->
<link
	href="<%=request.getContextPath()%>/plugins/fancybox/jquery.fancybox.pack.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/plugins/jquery-nice-select/css/nice-select.css"
	rel="stylesheet">
<!-- CUSTOM CSS -->
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/front-use/index_use/main.css">
<%-- 	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/front-use/index_use/reset.css"> --%>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/front-use/index_use/style.css">
	<script src="<%=request.getContextPath() %>/js/jquery/jquery-3.5.1.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/jquery/jquery-ui-1.10.3.custom.min.js"></script>
<%-- 	<script src="<%=request.getContextPath() %>/js/index_use/main.js"></script> --%>


<style>

/* #DIVFOOTER { */
/* 	padding: 5px 0 5px 0; */
/* 	border: 2px orange solid; */
/* 	margin-top: 10px; */
/* 	margin-bottom: 10px; */
/* 	float: left; */
/* 	line-height: 50px;; */
/* 	width: 100%; */
/* } */


 img{
    display: block;
    min-width: 100%;
    min-height: 100%;
    object-fit:cover 
}



#SEARCH {
	border: 2px red solid;
	float: top;
	padding: 5px 0 5px 0;
	margin-bottom: 0px;
	line-height: 35px;
	width: 100%;
}

#DIV1 {
	width: 700px;
	/* 	line-height: 400px; */
	padding: 20px;
	border: 10px #ff007b26 outset;
	margin-right: 10px;
	margin-left: 40px;
	margin-top: 15px;
	margin-bottom: 30px;
	float: left;
	border-radius:30px;
}

#DIV2 {
	width: 700px;
/* 	line-height: 400px; */
	padding: 20px;
	border: 10px #ff007b26 outset;
	float: RIGHT;
	margin-right: 40px;
	margin-left: 10px;
	margin-top: 15px;
	margin-bottom: 30px;
	float: right;
	border-radius:30px;
}

/* 訂位 */
#DIV3 {
	width: 270px;
	/* 	line-height: 400px; */
	padding: 5px;
	border: 5px outset;
	margin-right: 200px;
	margin-left: 1100px;
	margin-top: 950px;
	margin-bottom: 50px;
	bgcolor:white;
	position:absolute;
}

/* 調查表 */
#DIV4 {            
	width: 890px;
/*  	line-height: 25px;  */
	padding: 10px;
 	border: 5px outset; 
	margin-right: 60px;
	margin-left: 100px;
	margin-top: 950px;
	margin-bottom: 100px;
	display: block;
   
    object-fit:cover;
	position:absolute;
}

#divpic1 {
	width: 300px;
	height: 300px; 
	padding: 10px;
	border: 2px black solid; 
	float: left;
	margin-right: 18px;
	margin-top: 70px;
	margin-left: 50px;
	margin-bottom: 25px;
}

#divpic {
	width: 300px;
 	height: 300px; 
	padding: 10px;
	border: 2px black solid;
	float: left;
	margin-right: 18px;
	margin-top: 70px;
	margin-left: 60px;
	margin-bottom: 25px;
}
p.i_just_p{
	font-size:20px; 
	color:black;
	font-weight: bold;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}
</style>
</head>
<body  style="bgcolor:orange;">
<section>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light navigation">
					<a class="navbar-brand" href="<%=request.getContextPath() %>/front-end/Guest_Table/home.jsp">
						<img src="<%=request.getContextPath() %>/images/logo2.png" alt="">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
					 aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ml-auto main-nav ">
<!-- 							<LI CLASS="NAV-ITEM ACTIVE"> -->
<!-- 								<A CLASS="NAV-LINK" HREF="INDEX.HTML">首頁</A> -->
<!-- 							</LI> -->
<!-- 							<LI CLASS="NAV-ITEM DROPDOWN DROPDOWN-SLIDE"> -->
<!-- 								<A CLASS="NAV-LINK DROPDOWN-TOGGLE" DATA-TOGGLE="DROPDOWN" HREF="">訂位<SPAN><I CLASS="FA FA-ANGLE-DOWN"></I></SPAN> -->
<!-- 								</a> -->

<!-- 								Dropdown list -->
<!-- 								<div class="dropdown-menu"> -->
<!-- 									<a class="dropdown-item" href="dashboard.html">Dashboard</a> -->
<!-- 									<a class="dropdown-item" href="dashboard-my-ads.html">Dashboard My Ads</a> -->
<!-- 									<a class="dropdown-item" href="dashboard-favourite-ads.html">Dashboard Favourite Ads</a> -->
<!-- 									<a class="dropdown-item" href="dashboard-archived-ads.html">Dashboard Archived Ads</a> -->
<!-- 									<a class="dropdown-item" href="dashboard-pending-ads.html">Dashboard Pending Ads</a> -->
<!-- 								</div> -->
<!-- 							</li> -->
<!-- 							<li class="nav-item dropdown dropdown-slide"> -->
<!-- 								<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 									Pages <span><i class="fa fa-angle-down"></i></span> -->
<!--  								</a>   -->
<!-- 								Dropdown list -->
					
							</li>					
							<c:choose>
								<c:when test="${gs_email!=null }">
							
								<li><a class="nav-item dropdown dropdown-slide">歡迎，${gs_name }&nbsp&nbsp&nbsp&nbsp </a></li>
								
								<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									會員專區 <span><i class="fa fa-angle-down"></i></span>
								</a>
<!-- 								Dropdown list -->
								<div class="dropdown-menu">
									<a class="dropdown-item" href="<%=request.getContextPath() %>/front-end/Guest_Table/guest_profile1.jsp">會員資料</a>								
							</div>					
								</li>	
							<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									業者專區 <span><i class="fa fa-angle-down"></i></span>
								</a>
<!-- 								Dropdown list -->
								<div class="dropdown-menu">
									<a class="dropdown-item" href="<%=request.getContextPath() %>/front-end/compy_table/front_CompyLogin.jsp">業者登入</a>
									<a class="dropdown-item" href="<%=request.getContextPath() %>/front-end/compy_table/front_addCompyRegister.jsp">業者註冊</a>
									
								</div>
							</li>
								
								
							<li >
								<a class="nav-item dropdown dropdown-slide" href="<%=request.getContextPath()%>/Guest_table/IndexServlet">登出</a>
							</li>
								
								
							</c:when>
							
							<c:when test="${gs_email==null }">
								<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									會員專區 <span><i class="fa fa-angle-down"></i></span>
								</a>
<!-- 								Dropdown list -->
								<div class="dropdown-menu">
									<a class="dropdown-item" href="<%=request.getContextPath() %>/front-end/Guest_Table/login.jsp">會員登入</a>
									<a class="dropdown-item" href="<%=request.getContextPath() %>/front-end/Guest_Table/register1.jsp">會員註冊</a>
									
								</div>
							</li>
							
							
									
							<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									業者專區 <span><i class="fa fa-angle-down"></i></span>
								</a>
<!-- 								Dropdown list -->
								<div class="dropdown-menu">
									<a class="dropdown-item" href="<%=request.getContextPath() %>/front-end/compy_table/front_CompyLogin.jsp">業者登入</a>
									<a class="dropdown-item" href="<%=request.getContextPath() %>/front-end/compy_table/front_addCompyRegister.jsp">業者註冊</a>
								</div>
							</li>
						
							</c:when>
							
						</c:choose>	

					</div>
				</nav>
			</div>
		</div>
	</div>
</section>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- Header Contetnt -->

				<!-- Advance Search -->
				<div class="advance-search">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-12 col-md-12 align-content-center">
								<form>
									<div class="form-row">
										<div class="form-group col-md-4">
											<input type="text" class="form-control my-2 my-lg-1"
												id="inputtext4" placeholder="餐廳名稱">
										</div>
										<div class="form-group col-md-3">
											<select class="w-100 form-control mt-lg-1 mt-md-2">
												<option>分類</option>
												<option value="1">日式</option>
												<option value="2">美式</option>
												<option value="4">中式</option>
											</select>
										</div>
										<div class="form-group col-md-3">
											<input type="text" class="form-control my-2 my-lg-1"
												id="inputLocation4" placeholder="地點">
										</div>
										<div class="form-group col-md-2 align-self-center">
											<button type="submit" class="btn btn-primary">搜尋餐廳</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="fortwodiv" style="margin-top: 30px; margin-bottom: 150px;">
		<div id="DIV1" style="height:600px;">
			<a> <%
 	String photoString = null;
 	try {

 		Base64.Encoder encoder = Base64.getEncoder();
 		photoString = encoder.encodeToString(rest_TablePhoto.getRs_view1());
 	} catch (Exception e) {
 		e.printStackTrace();
 	}
 %> <img src="data:image;base64,<%=photoString%>" width="640" height="550"></a>
		</div>

		<%-- 		<img src="<%=request.getContextPath() %>/rest_table/Rest_TableServlet_front?method=get_the_pic&id=${rs_id}&which=rs_view1"  width="550" height="400"></a></div> --%>
		<div id="DIV2" >
	<a>
	<br><center><p style="font-size:80px; font-weight:bold; color:black;">${rest_TableVO.rs_name}</p></center><br>
    <p class="i_just_p" style="line-height: 0px;">地址: ${address}</p>
    <p class="i_just_p" style="line-height: 0px;">電話: ${rest_TableVO.rs_phone}</p>
    <p class="i_just_p" style="line-height: 0px;">餐廳類型: ${rest_TableVO.rs_type}</p>
    <p class="i_just_p" style="line-height: 0px;">餐廳時間: ${rest_TableVO.rs_open_time==4?"11:00~21:00":"全時段"}</p>
    <p class="i_just_p">餐廳介紹: ${rest_TableVO.rs_intro}</p>
	</a>
	<div style="width: 100%; height: 286px;">
		<jsp:include page="/front-end/map/map.jsp"></jsp:include>
	</div>
		</div>
		<br>

		<div class=pics>

			<div id="divpic1">
				<%
					try {

						Base64.Encoder encoder = Base64.getEncoder();
						photoString = encoder.encodeToString(rest_TablePhoto.getRs_view2());
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
				<img src="data:image;base64,<%=photoString%>" width="255"
					height="280"></a>
				<%-- 		<img src="<%=request.getContextPath() %>/rest_table/Rest_TableServlet_front?method=get_the_pic&id=${infor.rs_id}&which=rs_view2"  width="255" height="280"> --%>
			</div>
			<div id="divpic">
				<%
					try {

						Base64.Encoder encoder = Base64.getEncoder();
						photoString = encoder.encodeToString(rest_TablePhoto.getRs_view3());
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
				<img src="data:image;base64,<%=photoString%>" width="255"
					height="280"></a>
				<%-- 		<img src="<%=request.getContextPath() %>/rest_table/Rest_TableServlet_front?method=get_the_pic&id=${infor.rs_id}&which=rs_view3"  width="255" height="280"> --%>
			</div>
			<div id="divpic">
				<%
					try {

						Base64.Encoder encoder = Base64.getEncoder();
						photoString = encoder.encodeToString(rest_TablePhoto.getRs_view4());
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
				<img src="data:image;base64,<%=photoString%>" width="255"
					height="280"></a>
				<%-- 		<img src="<%=request.getContextPath() %>/rest_table/Rest_TableServlet_front?method=get_the_pic&id=${infor.rs_id}&which=rs_view4"  width="255" height="280"> --%>
			</div>
			<div id="divpic1">
				<%
					try {

						Base64.Encoder encoder = Base64.getEncoder();
						photoString = encoder.encodeToString(rest_TablePhoto.getRs_view5());
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
				<img src="data:image;base64,<%=photoString%>" width="255"
					height="280"></a>
				<%-- 		<img src="<%=request.getContextPath() %>/rest_table/Rest_TableServlet_front?method=get_the_pic&id=${infor.rs_id}&which=rs_view5"  width="255" height="280"> --%>
			</div>

		</div>
	</div>


	<div>

		<div id="DIV3">
			<jsp:include page="/front-end/booking_ing/order/Seat_select_order.jsp" /> 
		</div>
	
	</div>

	<div>
		<div id="DIV4"><jsp:include
				page="/front-end/Feedback_Table/frontlistFeedback.jsp"></jsp:include></div> 
	</div>

	


</body>

</html>