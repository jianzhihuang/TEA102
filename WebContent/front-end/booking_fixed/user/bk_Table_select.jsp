<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.rest_table.model.Rest_TableVO"%>
<%@ page import="com.rest_seat_coordinate.model.*"%>


<%
	Rest_Seat_Coordinate_TableVO rest_Seat_Coordinate_TableVO = (Rest_Seat_Coordinate_TableVO) request.getAttribute("rest_Seat_Coordinate_TableVO");
%>
<%   
 String rs_id = (String)session.getAttribute("rs_id");
if(rs_id==null){
	session.setAttribute("rs_id", "RS10001");
}
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/front-use/bking_table/bking.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/front-use/bking_table/css_button.css">
</head>

<body>

	<div class="drag_drop" style="display: none;" >
		<div class="tab_panel drop_panel" id="html-content-holder" style=" width: 1200px;  height:300px;" id="">
			<span>請把桌子拖曳至此</span>
			<ul class="drop_ul"></ul>
		</div>
		<div class="tab_panel drag_panel">
			<ul class="draggable_item">

				<li id="table" class="table">
					<div id="table_pic" width="100px" height="50px">
						<div id="table_num">1</div>
					</div>
				</li>
			</ul>
		</div>

	</div>
	<FORM>

	<button id="send"  style="display: none;" >設定位置</button>
	
	</FORM>
	 <a class="button"  id="callback" href="<%=request.getContextPath()%>/front-end/compy_table/front_CompyMembershipPlatform_info.jsp">返回首頁</a>
	<img id="restaurant" style="width: 200px" src="<%=request.getContextPath()%>/front-end/booking_fixed/images/cartoon_restaurant.png" alt="">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js'></script>

	<script src="<%=request.getContextPath() %>/js/front_use/bking_table/index.js"></script>
	<script>
		window.onload = function () {
			sessionStorage.clear();

			$(".drag_drop").fadeIn(1500);
			$(".drag_drop").css("display", "block");
			$("#send").fadeIn(1500);
			$("#send").css("display", "block");
		};
		$("#send").on("click", function () {
			var dataArray = [];
			let $next = $("ul.drop_ul li:first-child");
			// 			/*將元素放入陣列內*/
			for (let i = 0; i < $("ul.drop_ul").children("li").length; i++) {
				let obj = {};
				obj.xy = $next.offset()
				// 				console.log(obj.xy)
				obj.obj = $next.data();
				dataArray.push(obj);
				$next = $next.next();
			}

			console.log(dataArray);
			var jsonString = JSON.stringify(dataArray);
			console.log(jsonString);

						$.ajax({
							type : "POST",
							url : "/TEA102G1/GetJson.do",
							data : jsonString,//直接傳表單裡的資料
							
			// 				data:{
			// 				    userName:userName,
			// 				    password:password
			// 				},
							success : function() {



							},
							error : function() {
								alert("系統錯誤-loginPage.jsp-ajax");
							}
						});

		});
	</script>

	<script>
		// 		/*待做事項
		// // 		1.優化drag and drop 滑鼠相對於元素的位置，以及drop 後的xy座標
		// // 		2. 從後端using ajax接到資料
		// // 		3. 存到資料庫

		// 		/*-------------------------變數宣告-------------------------*/
		// 		/*可以被拖曳的元素們*/
		$li = $("li");
		// 		/*可以放置元素的drop區域*/
		$drop_panel = $("div.drop_panel");

		// 		/*允許可以拖曳元素到drop區域*/
		$drop_panel.on("dragover", function (event) {
			event.preventDefault();
		})

		// 		/*將元素drop到該區域後利用dataTransfer取出該id，並複製一份元素，黏貼到drop區域*/
		$drop_panel.on("drop", function (event) {
			let el = event.originalEvent.dataTransfer.getData("item");//取得元素id
			$copyEl = $(el).clone();
			let num = window.sessionStorage.getItem("num");
			if (num === null)
				num = 1;
			$copyEl.children().html(num);
			$("ul.drop_ul").append($copyEl);
			// let table_num = $("#table_num").html();


			// while(true){
			// 	table_num+num;	
			// };
			// 			/*放入後設定位置才有效果*/
			let xy = $("ul.drop_ul").children(":last-child").offset({
				left: event.pageX,
				top: event.pageY
			})
			$("ul.drop_ul").children(":last-child").data("object", el);
			let numNo = parseInt(num);
			window.sessionStorage.setItem("num", numNo + 1);
		});

		// 		/*允許元素被拖曳*/
		$li.attr("draggable", "true");

		// 		/*當元素開始拖曳時，記住被拖曳元素的ID，dataTransfer類似於map的結構，但只能存元素的ID*/
		$li.on("dragstart", function (event) {
			event.originalEvent.dataTransfer.setData("item", `#\${event.target.id}`);
		});
	</script>
	<script>

		var element = $("#html-content-holder"); // global variable
		var getCanvas; // global variable

		$("#btn-Preview-Image").on('click', function () {
			html2canvas(element, {
				onrendered: function (canvas) {
					$("#previewImage").append(canvas);
					getCanvas = canvas;
				}
			});
		});
		$("#btn-Convert-Html2Image").on('click', function () {
			var imgageData = getCanvas.toDataURL("image/png");
			// Now browser starts downloading it instead of just showing it
			var newData = imgageData.replace(/^data:image\/png/, "data:application/octet-stream");
			$("#btn-Convert-Html2Image").attr("download", "your_pic_name.png").attr("href", newData);
		});

	</script>
	
</body>

</html>