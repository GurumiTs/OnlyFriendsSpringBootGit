<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta charset="utf-8" />
<meta http-equiv="refresh" content="8; url=empCoupons.controller">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<title>Coupons Result</title>
<style>
#di {
	border: 2px solid black;
	border-radius: 10px;
	width: 500px;
	height:400px;
	margin: 25px auto 0 auto;
	padding: 45px 0 50px 160px;
}

#count {
	display: flex;
	width: 300px;
	height: 50px;
	color: black;
	text-align: center;
	line-height: 50px;
	margin: 0 auto;
	font-size: 20px;
	font-family: monospace;
	padding-left: 50px;
}
</style>
</head>
<body>
	<%@include file="../commonpages/dashboardtop.jsp"%>
	<div id="wrapper">
		<%@include file="../commonpages/dashboardsidebar.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<%@include file="../commonpages/dashboardheader.jsp"%>

		<main class="page-content">
			<div class="container">

				<form method="post" modelAttribute="coupons">
					<div id="di">
						<%
						request.setCharacterEncoding("UTF-8");
						%>
						<div>分類名稱:${find.category}</div>
						<br />
						<div>廠商名稱:${find.companyName}</div>
						<br />
						<div>優惠券名稱:${find.couponName}</div>
						<br />
						<div>優惠券價格:${find.couponPrice}</div>
						<br />
						<div>庫存量:${find.couponQty}</div>
						<br />
						<div>優惠起初日: ${find.couponStartDate}</div>
						<br />
						<div>優惠截止日: ${find.couponEndDate}</div>
						<br />
						<!--  <div>優惠券簡介: ${find.couponInfo}</div>
						<br />
						<div>優惠優惠券使用方式: ${find.couponUse}</div>
						<br />-->
						<!--   <br> <a href="empCoupons.controller">確認</a>-->

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
				<%@include file="../commonpages/dashboardfooter1.jsp"%>
				<%@include file="../commonpages/dashboardlogoutmodal.jsp"%>
				<%@include file="../commonpages/dashboardbottom.jsp"%>
			</div>
		</main>
		<!-- page-content" -->
	</div>
	<!-- page-wrapper -->
</div>
</body>
</html>
