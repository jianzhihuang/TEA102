<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/front-use/bking_table/order_after.css">
    <style type="text/css">
        div {
            border: 5px solid #666;
            width: 600px;
            height: 500px;
            border-radius: 50px;
            margin:0px auto;
            text-align:center;
        }
        div h1{
            margin: 0px;
            font-size: 2cm;
        }
        div p{
            font-size: 140%;
            color: red;
        }

    </style>
</head>

<body>
    <div>

        <h1>感謝你</h1>
        <p>您所預定餐廳不需付訂金<br>
            請至於會員管理確認訂單<br>
            如欲取消請於訂位時間前一小時至會員管理取消訂位</p>
        <form action="" method="post">
            <a class="button" href="<%=request.getContextPath()%>/front-end/Guest_Table/home.jsp">返回首頁</a>
            
        </form>
    </div>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
  
</body>

</html>