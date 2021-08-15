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

#delete {
	color: red;
	resize: 64px;
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
					<h1 class="h3 mb-2 text-gray-800">Product Tables</h1>
					<!--Employee DataTale  -->
					<div class="card shadow mb-4">
						
						<div class="card-body">
							<div class="table-responsive">
							<a href="insertProdcut.controller"><img
					src="images/smallicon/add-file.png" width="45px" height="45px"></a>
				<table id="example" class="table table-striped" style="width: 100%">
					<thead>
						<tr>
							<th>Id</th>
							<th>Photo</th>
							<th>Name</th>
							<th>Price</th>
							<th>Item</th>
							<th>Num</th>
							<th>Shipping</th>
							<th>Description</th>

							<th>Del</th>
							<th>Edit</th>
						</tr>
					</thead>
<!-- 					<tbody> -->
<%-- 					<c:if test='${not empty proList }'> --%>
<%-- 						<c:forEach items="${proList}" var="product"> --%>
<!-- 							<tr> -->
<%-- 								<td>${product.proId }</td> --%>
<%-- 								<td><img src="${product.proPhoto}" width="64px" height="64px"></td> --%>
<%-- 								<td>${product.proName }</td> --%>
<%-- 								<td>${product.proPrice }</td> --%>
<%-- 								<td>${product.proItem }</td> --%>
<%-- 								<td>${product.proNum}</td> --%>
<%-- 								<td>${product.proShipping}</td> --%>
<%-- 								<td>${product.proDescription}</td> --%>
<!-- 								<script> -->
<!-- // 									function delConfirm(Name) { -->
<!-- // 										return confirm("Delete [" + Name -->
<!-- // 												+ "] ?"); -->
<!-- // 									} -->
<!-- 								</script> -->

<%-- 								<td class="delete"><a href="deleteentry.controller?delId=${product.proId }" --%>
<%-- 									onclick="return delConfirm('${product.proName}');"><img --%>
<!-- 										src="images/smallicon/trash.png" width="32px" height="32px"></a></td> -->
<!-- 								<td class="edit"><a -->
<%-- 									href="updateentry.controller?editId=${product.proId }"><img --%>
<!-- 										src="images/smallicon/edit.png" width="32px" height="32px"></a></td> -->
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
<%-- 						</c:if> --%>
<!-- 					</tbody> -->
					<tfoot>
						<tr>
							<th>Id</th>
							<th>Photo</th>
							<th>Name</th>
							<th>Price</th>
							<th>Item</th>
							<th>Num</th>
							<th>Shipping</th>
							<th>Description</th>

							<th>Del</th>
							<th>Edit</th>
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
		/* load data table */
		var table = $('#example').DataTable({
		    "ajax": {
		    	"url": "productPage.controller",
		    },
		    "columns": [
		        { "data": "empEmail" },
		        { "data":"empAccount"},
		        { "data": "empName" }, 
		        { "data":"deptNum"},		  
		        {
		            "data": null,
		            render:function(data, type, row)
		            {
		              return "<i id="+data.empEmail+" class='fas fa-user-edit edit' data-bs-toggle='modal' data-bs-target='#exampleModal'></i> <span>|</span> <i class='far fa-trash-alt delete' id="+data.empEmail+"></i>";
		            },
		            "targets": -1
		        }
		    ]
		});		
	</script>
 </body>
</html>	
	
