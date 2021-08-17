<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<title>Coupons Result</title>
<style>
#di {
	border: 2px solid black;
	border-radius: 10px;
	width: 500px;
	height: 300px;
	margin: 100px auto;
	text-align: center;
	padding: 100px;
}

#pi {
	font-size: 20px;
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
					<div id="di">
						<p id="pi">刪除失敗!!!</p>
						<a href="empCoupons.controller">返回</a>
					</div>
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
