<%@page import="com.compy_table.model.Compy_TableVO"%>
<%@page import="com.compy_table.model.Compy_TableService"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>業者會員管理平台</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/front-use/index_use/reset.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/front-use/index_use/header.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/front-use/index_use/footer.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/front-use/index_use/members_side.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/front-use/compy_table_use/front_CompyMembershipPlatform.css">
	
</head>
<body>
        <div class="side_div_in">
            <div class="side_div_in_bigpic">
                <img class="side_div_in_bigpic_img" src="<%=request.getContextPath() %>/compy_table/Compy_TableServlet_front?method=many_pics_display&&mail=${authority_compy.cp_contact_email}&&which_one=bigpic" alt="大頭照">
            </div>
            <ul>
                <li>
                    <a href="<%=request.getContextPath() %>/front-end/compy_table/front_CompyMembershipPlatform_info.jsp">會員資訊</a>
                </li>
                <li>
                    <a href="<%=request.getContextPath() %>/front-end/compy_table/front_CompyMembershipPlatform_info_updatePic.jsp">照片更改</a>
                </li>
                <li>
                    <a href="<%=request.getContextPath() %>/front-end/compy_table/front_CompyMembershipPlatform_info_updatePwd.jsp">密碼更改</a>
                </li>
                <c:if test="${authority_compy.authority==11}">
                	<li>
                    	<a href="<%=request.getContextPath() %>/front-end/compy_table/front_CompyMembershipPlatform_info_updateBusiness.jsp">營業登記證</a>
                	</li>
                </c:if>
                <c:if test="${authority_compy.authority==12}">
                	<li>
                    	<a href="<%=request.getContextPath() %>/front-end/compy_table/front_CompyMembershipPlatform_info_updateBusiness.jsp">營業登記證</a>
                	</li>
                </c:if>
                <c:if test="${authority_compy.authority==2 }">
                	<c:choose>
                		<c:when test="${rs_check_yn==null}">
                			<li>
                    			<a href="<%=request.getContextPath()%>/front-end/rest_table/front_CompyAddRest_info.jsp">餐廳資訊</a>
                			</li>
                			<li>
                    			<a href="<%=request.getContextPath()%>/front-end/rest_table/front_CompyAddPic.jsp">餐廳圖片</a>
                			</li>
                			<li>
                    			<a href="<%=request.getContextPath() %>/front-end/rest_table/front_CompyAddpic_Seat.jsp">餐廳環視圖</a>
                			</li>
                		</c:when>
                		<c:when test="${fn:contains(rs_check_yn, '2')}">
                			<li>
                    			<a href="<%=request.getContextPath()%>/front-end/rest_table/front_CompyAddRest_info.jsp">餐廳資訊</a>
                			</li>
                			<li>
                    			<a href="<%=request.getContextPath()%>/front-end/rest_table/front_CompyAddPic.jsp">餐廳圖片</a>
                			</li>
                			<li>
                    			<a href="<%=request.getContextPath() %>/front-end/booking_fixed/user/bk_Table_select.jsp">餐廳桌位</a>
                			</li>
                			<li>
                    			<a href="<%=request.getContextPath() %>/front-end/booking_fixed/user/bk_Table_index.jsp">座位人數</a>
                			</li>
                		</c:when>
                		<c:when test="${fn:contains(rs_check_yn, '1')}">
                			<li>
                    			<a href="<%=request.getContextPath()%>/front-end/rest_table/front_CompyAddRest_info.jsp">餐廳資訊</a>
                			</li>
                			<li>
                    			<a href="<%=request.getContextPath()%>/front-end/compy_table/front_CompyMembershipPlatform_order.jsp">訂單資訊</a>
                			</li>
                			<li>
                    			<a href="<%=request.getContextPath()%>/front-end/compy_table/front_CompyMembershipPlatform_ad.jsp">購買廣告</a>
                			</li>
                		</c:when>
                	</c:choose>
                </c:if>
            </ul>
</body>
</html>