<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>
<style>
.edit {
	cursor: pointer;
	color: green;
}

.delete {
	cursor: pointer;
	color: red;
}

.edit:hover {
	color: green;
}

.delete:hover {
	color: red;
}

.img1 {
	weight: 100px;
	height: 100px;
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
								<table id="example" class="table table-striped"
									style="width: 100%">
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
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
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
											<th>Edit</th>
											<th>Delete</th>

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
		//   $(document).ready(function(){

		/* load data table */
		var table = $('#example').DataTable({
			"ajax" : {
				"url" : "product.controller",
			},
			"columns" : [ {
				"data" : "proId"
			}, {
				"data" : null,
				render : function(data, type, row) {
					return "<img src="+data.proPhoto+" class='img1'>";
				}
			}, {
				"data" : "proName"
			}, {
				"data" : "proPrice"
			}, {
				"data" : "proItem"
			}, {
				"data" : "proNum"
			}, {
				"data" : "proShipping"
			}, {
				"data" : "proDescription"
			}, {
				"data" : null,
				render : function(data, type, row) {
					return "<a href='updateentry.controller?Id="+data.proId+"'><i class='fas fa-edit'></i>";
				}
			}, {
				"data" : null,
				render : function(data, type, row) {
					return "<i class='far fa-trash-alt delete' id="+data.proId+"></i>";
				}
			} ]
		});
		/* load data table */
		
		
		/*delete*/
		$("#example tbody").on("click", ".delete", function () {
			let proId = $(this).attr("id");
			console.log($(this).closest("tr"));
			let dtr = $(this).closest("tr");
			  Swal.fire({
	                title: 'Are you sure?',
	                text: "You won't be able to revert this!",
	                icon: 'warning',
	                showCancelButton: true,
	                confirmButtonColor: '#3085d6',
	                cancelButtonColor: '#d33',
	                confirmButtonText: 'Yes, delete it!'
	              }).then((result) => {
	                if (result.isConfirmed) {
	                  $.ajax({
	                        type: "POST",
	                        url: "deleteentry.controller/"+proId,
	                        success: function(response) {  
	                        	dtr.remove();
	                             Swal.fire(
	                              'Deleted!',
	                              'Your file has been deleted.',
	                              'success'
	                            ) } ,
	                            error: function (xhr) {
	                            Swal.fire({
	                              icon: 'error',
	                              title: 'Oops...',
	                              text: 'Something went wrong!'
	                            }) },  //error close
	                     }); //ajax close          
	                } //if close 

	           }); //then close 
		});
	</script>
</body>
</html>