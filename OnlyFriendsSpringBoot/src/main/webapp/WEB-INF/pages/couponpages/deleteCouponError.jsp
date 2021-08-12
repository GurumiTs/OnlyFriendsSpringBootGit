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
	margin-left: auto;
	margin-right: auto;
	padding-top: 120px;
	padding-left: 200px;
}
#pi{margin-left: 5px;font-size: 20px;}
#ai{margin-left: 35px;}

</style>
</head>
<body>
	<%@include file="../commonpages/dashboardheader1.jsp"%>
	<div class="page-wrapper chiller-theme toggled">
		
		<%@include file="../commonpages/dashboardsidebar1.jsp"%>
		<main class="page-content">
			<div class="container">
				<div id="di">
					<p id="pi">刪除失敗!!!</p>
					<a id="ai" href="Coupons.controller">返回</a>
				</div>
				
				<hr />
				<%@include file="../commonpages/dashboardfooter1.jsp"%>
			</div>
		</main>
		<!-- page-content" -->
	</div>
	<!-- page-wrapper -->

</body>
</html>
