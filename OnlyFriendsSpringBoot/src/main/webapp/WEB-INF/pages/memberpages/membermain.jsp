<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- top side common link-->
<%@include file="../membercommonpages/membermaintop.jsp"%>
<!-- top side common link-->
<style>


</style>
</head>
<body class="sb-nav-fixed">

	<!-- top bar-->
	<%@include file="../membercommonpages/membermaintopbar.jsp"%>
	<!-- top bar-->
	<div id="layoutSidenav">
		<!-- side bar-->
		<%@include file="../membercommonpages/membermainsidebar.jsp"%>
		<!-- side bar-->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">各自的頁面名稱</h1>
					<br />
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 此區塊標題上方i可更改
						</div>
						<div class="card-body">
							<!--各自內容-->
						</div>
					</div>
				</div>
			</main>
			<!-- footer-->
			<%@include file="../membercommonpages/membermainfooter.jsp"%>
			<!-- footer-->
		</div>
	</div>

	<!-- bottom side common script-->
	<%@include file="../membercommonpages/membermainbottom.jsp"%>
	<!-- bottom side common script-->
<script>


</script>	
</body>
</html>
