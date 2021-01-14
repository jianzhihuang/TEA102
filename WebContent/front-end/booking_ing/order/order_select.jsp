<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.booking_fixed_table.model.*"%>
<%@ page import="com.booking_ing_table.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%-- <%session.setAttribute("rs_id", "RS10001");  %> --%>


 <%String rs_id = (String)session.getAttribute("rs_id"); %> 
<!-- 到時候合併需要處理-->
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
<meta charset="utf-8">
<title></title>
<!-- Bootstrap CSS -->	
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/front-use/bking_table/bk_select_table.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/front-use/bking_table/css-loading-animations.css">
</head>
<body>
		<div class="wrapper">
			<div class="inner">
				<span>尋</span> 
				<span>找</span> 
				<span>中</span>

			</div>
		</div>
	<div class="container" id="header_container" style="display: none;">
		<div class="row">
			<br>
			<h1 class="display-4">選擇你想要訂位的桌號</h1>
			<h4 style="color: red;">注意:(1)選項顯示為您人數可坐的桌號
				(2)如選項內無您所想要桌號表示該時段該桌號已被訂位或您人數不符</h4>

		</div>
	</div>
	
	<div class="drag_drop" id="drop" style="display: none;">
		<div class="tab_panel drop_panel" id="html-content-holder" style="margin-right:0px; margin-left:160px;">

			<ul class="drop_ul"></ul>
		</div>
	</div>
	
	<div class="container" id="body_container" style="display: none;">
		<div class="row">

			<div class="col-9">
				<form
					action="<%=request.getContextPath()%>/booking_ing_table/booking_Ing_Seat_OrderServlet.do"
					method="POST">
					
					<select size="1" name="rs_seat_sieral" class="form-control" id="control-label"
						style="width: 400px; height: 40px">
						<c:forEach var="booking_Ing_Table_OrderList"
							items="${booking_Ing_Table_OrderList}"><br>
							<option value="${booking_Ing_Table_OrderList.rs_seat_sieral}">桌號:${booking_Ing_Table_OrderList.rs_table_number}號
						</c:forEach>
					</select>
					<button type="submit" class="btn btn-danger btn-lg"
						style="margin-top: 40px;">訂位送出</button>
					<input type="hidden" name="action" value="add_order"> <input
						type="hidden" name="gs_email" value="${gs_email}"> <input
						type="hidden" name="rs_id" value="${rs_id}">
					<input type="hidden" name="gs_select_date" value="${booking_Ing_Table_OrderVO.gs_select_date}">
					<input type="hidden" name="gs_select_time" id="gs_select_time" value="${booking_Ing_Table_OrderVO.gs_select_time}">
					<input type="hidden" name="rs_table_seat" value="${booking_Ing_Table_OrderVO.rs_table_seat}">
				</form>
			</div>
			<div class="col">
				<form
					action="<%=request.getContextPath()%>/booking_ing_table/booking_Ing_Seat_OrderServlet.do"
					method="POST">
					<button type="submit"  class="btn btn-outline-dark btn-lg"
						style="margin-top: 80px;">時間重選</button>
					<input type="hidden" name="action" value="callback">
				</form>
			</div>

			<div class="col-0.5">
				<form
					action="<%=request.getContextPath()%>/booking_ing_table/booking_Ing_Seat_OrderServlet.do"
					method="POST">
					<button type="submit" class="btn btn-outline-dark btn-lg"
						style="margin-top: 80px;">取消</button>
					<input type="hidden" name="action" value="go_home">
				</form>
			</div>
		</div>
	</div>
	<img id="restaurant" style="width: 200px" src="<%=request.getContextPath()%>/front-end/booking_fixed/images/cartoon_restaurant.png" alt="">
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
		integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
	<!-- //  Option 2: jQuery, Popper.js, and Bootstrap JS -->
	<!-- Latest compiled and minified JavaScript -->
	<script src="<%=request.getContextPath()%>/js/front_use/bking_table/order_select_table.js"></script>

</body>
</html>