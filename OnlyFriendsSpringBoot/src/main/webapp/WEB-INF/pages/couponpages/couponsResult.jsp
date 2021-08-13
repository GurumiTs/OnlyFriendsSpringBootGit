<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta charset="utf-8" />
<meta http-equiv="refresh" content="8; url=Coupons.controller">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<title>Coupons Result</title>
<style>
#di {
	border: 2px solid black;
	border-radius: 10px;
	width: 500px;
	margin-left: auto;
	margin-right: auto;
	padding-left: 160px;
}

#count {
	display: flex;
	width: 300px;
	height: 50px;
	color: black;
	text-align: center;
	line-height: 50px;
	margin: 0px auto;
	font-size: 20px;
	font-family: monospace;
	margin-left: auto;
	margin-right: auto;
	padding-left: 50px;
}
</style>
</head>
<body>
	<%@include file="../commonpages/dashboardheader1.jsp"%>
	<div class="page-wrapper chiller-theme toggled">
		
		<%@include file="../commonpages/dashboardsidebar1.jsp"%>
		<main class="page-content">
			<div class="container">

				<form method="post" modelAttribute="coupons">
					<div id="di">
						<%
						request.setCharacterEncoding("UTF-8");
						%>
						<div>分類名稱:${find.caName}</div>
						<br />
						<div>廠商名稱:${find.coName}</div>
						<br />
						<div>優惠券名稱:${find.pName}</div>
						<br />
						<div>商品價格:${find.price}</div>
						<br />
						<div>剩餘數量:${find.pQty}</div>
						<br />
						<div>優惠起初日: ${find.startDate}</div>
						<br />
						<div>優惠截止日: ${find.endDate}</div>
						<br />
						<!--   <br> <a href="Coupons.controller">確認</a>-->

					</div>
				</form>
				<div id="count">
					<span>倒數<span id="ant"></span>秒自動跳轉回首頁
					</span>
				</div>
				<script>
					window.onload = function() {
						var odiv = document.getElementById("ant");
						var count = 8;
						odiv.innerHTML = count;
						var timer = null;
						timer = setInterval(function() {
							if (count > 0) {
								count = count - 1;
								odiv.innerHTML = count;
							} else {
								clearInterval(timer);
							}
						}, 1000);
					}
				</script>
				<hr />
				<%@include file="../commonpages/dashboardfooter1.jsp"%>
			</div>
		</main>
		<!-- page-content" -->
	</div>
	<!-- page-wrapper -->

</body>
</html>
