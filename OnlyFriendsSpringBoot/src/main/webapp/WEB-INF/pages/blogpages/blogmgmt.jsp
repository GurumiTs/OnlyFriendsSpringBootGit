<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.img1 {
	weight: 150px;
	height: 150px;
}

.edit a:hover {
	font-size: 130%;
}

.delete a:hover {
	font-size: 130%;
}

.delete {
	cursor: pointer;
}

.insert a img:hover {
	width: 50px;
	height: 50px;
	display: block;
	}
</style>
 </head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@include file="../commonpages/dashboardsidebar.jsp"%>


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@include file="../commonpages/dashboardheader.jsp"%>

				<!-- Begin Page Content -->
				<div class="container-fluid">

<!-- ************************** your content*************************** -->		
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Blog Tables</h1>
					<!--Employee DataTale  -->
					<div class="card shadow mb-4">
						
						<div class="card-body">
							<div class="table-responsive">
							<div class="insert">
								<a href="blogInsertForm.controller"><img
									src="images/smallicon/BlogmgmtInsert.png" width="45px"
									height="45px"></a>
							</div>
							<table id="example" class="table table-striped"
								style="width: 100%">
								<thead>
									<tr>
										<th>ID</th>
										<th>Images</th>
										<th>Title</th>
										<th>UpdateDate</th>
										<th class="d-none">Text</th>
										<th>EmpAcc</th>
										<th>UserID</th>
										<th>Edit</th>
										<th>Delete</th>
									</tr>
								</thead>
									
								<tfoot>
									<tr>
										<th class="d-none">文章編號</th>
										<th class="d-none">圖片</th>
										<th class="d-none">文章標題</th>
										<th class="d-none">最後更新時間</th>
										<th class="d-none">內容</th>
										<th class="d-none">PO文者帳號</th>
										<th class="d-none">暱稱</th>
										<th class="d-none">Del</th>
										<th class="d-none">Edit</th>
									</tr>
								</tfoot>
							</table>
								
							</div>
						</div>
					</div>
					<!-- table end -->

<!-- **************************end of your content*************************** -->
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<%@include file="../commonpages/dashboardfooter.jsp"%>

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<%@include file="../commonpages/dashboardlogoutmodal.jsp"%>
	



	<!-- bottom here -->
	<%@include file="../commonpages/dashboardbottom.jsp"%>
	<script>
		$(function() {
			$(document).ready(function() {
				$('#example').DataTable();
			});
		})
		function delConfirm(Name) {
			return confirm("Delete [" + Name + "] ?");
		}
	</script>
 </body>
</html>	
	
