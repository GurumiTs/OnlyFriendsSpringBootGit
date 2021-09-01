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

.img1 {
	weight: 150px;
	height: 150px;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
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

body {
	font-size: 1.2rem
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
					<h1 class="h3 mb-2 text-gray-800">會員活動管理</h1>
					<!--Employee DataTale  -->
					<div class="card shadow mb-4">

						<div class="card-body">
							<div class="table-responsive">
								<table id="example" class="table table-striped"
									style="width: 100%">
									<thead>
										<tr>
											<th>Cover</th>
											<th>ID</th>
											<th>Member</th>
											<th>name</th>
											<th>Type</th>
											<th>Time</th>
											<th>Deadline</th>
											<th>County</th>
											<th>District</th>
											<th>Place</th>
											<th>detai</th>
											<th>Condition</th>
											<th>Man</th>
											<th>Woman</th>
											<th>Total</th>
											<th>see</th>
											<th>Approve</th>
											<th>Delete</th>
										</tr>
									</thead>

									<tfoot>
										<tr>
											<th>封面</th>
											<th>編號</th>
											<th>會員ID</th>
											<th>名稱</th>
											<th>類型</th>
											<th>時間</th>
											<th>截止時間</th>
											<th>縣市</th>
											<th>區域</th>
											<th>地點</th>
											<th>活動內容</th>
											<th>參加條件</th>
											<th>男生人數</th>
											<th>女生人數</th>
											<th>總人數</th>
											<th>遊覽人數</th>
											<th>權限</th>
											<th>刪除</th>
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
		$(document).ready(function() {
			$('#example').DataTable();
		});
		
		var table = $('#example').DataTable({
			"ajax":{
				"url":"Alluseractivity",
			},
			"columns":[
				 { 
		        	"data": null,
		            render:function(data, type, row)
		            {
		              return "<img src="+data.cover+" class='img1'>";
		            },		  
		        },
				{"data":"number"},
				{"data":"memberAccount"},
				{"data":"activityname"},
				{"data":"type"},
				{"data":"time"},
				{"data":"time_up"},
				{"data":"county"},
				{"data":"district"},
				{"data":"place"},
				{"data":"detail"},
				{"data":"condition"},
				{"data":"man"},
				{"data":"woman"},
				{"data":"total"}, 
				{"data":"see"}, 
				 {
		            "data": null,
		            render:function(data, type, row)
		            {
		              return "<div class='form-check form-switch'style='position: relative; right: -40px;'>"+
						"<input class='form-check-input approve' type='checkbox' id="+data.number+">"+
						"<label	class='form-check-label' for='flexSwitchCheckChecked'>"
						"</label></div>";
		            },
		            "targets": -1
		        },
				{
			            "data": null,
			            render:function(data, type, row)
			            {
			              return "<i class='far fa-trash-alt delete' id="+data.number+"></i>";
			            },
			            "targets": -1
			   }
			]
		});
		
		$("#example tbody").on("click", ".approve", function () {
			console.log("change")
			
			
		})
		
		$("#example tbody").on("click", ".delete", function () {
			let number = $(this).attr("id");
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
	                        url: "delete/"+number,
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
