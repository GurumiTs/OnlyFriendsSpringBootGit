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

.data:hover {
	color: white;
	background-color: rgba(92, 92, 92, 0.637);
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
					<h1 class="h3 mb-2 text-gray-800">會員帳號管理</h1>
					<!--Employee DataTale  -->
					<div class="card shadow mb-4">
					<!--  
						<div class="card-header py-3 d-none" id="successHeader">
							<div class="alert alert-success alert-dismissible fade show"
										role="alert">
										update success
										<button type="button" class="btn-close"
											data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
						</div>-->
						<div class="card-body">
							<div class="table-responsive">
								<table id="example" class="table table-hover text-center text-dark fs-5 hover"
									style="width: 100%">
									<thead>
										<tr>
											<th>姓名</th>
											<th>帳號</th>
											<th>信箱</th>
											<th>年齡</th>
											<th>狀態</th>									
										</tr>
									</thead>									
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
	$(document).ready(function () {
		/*load zipcode query */
		$("#twzipcode").twzipcode({
	        detect: true,
	        zipcodeIntoDistrict: true,
	        css: ["city form-control col", "town form-control col"],
	      });
		/*load zipcode query */
		
		/* load data table */
		var table = $('#example').DataTable({
		    "ajax": {
		    	"url": "memalltojson",
		    },
		    "columns": [
		        { "data": "memberName" },
		        { "data":"memberAccount"},
		        { "data": "memberEmail" }, 
		        { "data":"memberAge"},		  
		        {
		            "data": null,
		            render:function(data, type, row)
		            {
		              if(data.memberAuth == 0){
		            	 console.log(data.memberName+data.memberAuth) 
			             return "<i class='fas fa-user-slash edit text-danger' id="+data.memberAccount+"></i> <span class='d-none'>|</span> <i class='far fa-trash-alt delete d-none' id="+data.memberAccount+"></i>";
		              }
		              else{
				         return "<i class='fas fa-user edit' id="+data.memberAccount+"></i> <span class='d-none'>|</span> <i class='far fa-trash-alt delete d-none' id="+data.memberAccount+"></i>";

		              }
		            },
		            "targets": -1
		        }
		    ],language: {
		    	"lengthMenu": "顯示 _MENU_ 筆資料",
		    	"sProcessing": "處理中...",
		    	"sSearch": "搜尋:",
		    	"sLoadingRecords": "載入資料中...",
		    	"oPaginate": {
		            "sFirst": "首頁",
		            "sPrevious": "上一頁",
		            "sNext": "下一頁",
		            "sLast": "末頁"
		         },
		    }
		});		
		/* load data table */
		$("#example tbody").on("click", ".edit", function () {
			let memberAccount = $(this).attr("id");
			$.ajax({
				type:"post",
				url:"banuser",
				data:{"memberAccount":memberAccount},
				success:function(response){
					table.ajax.reload();
				},
				error:function(xhr){
					
				}
			})
			
			
		})
				
		$("#example tbody").on("click", ".delete", function () {
			let memberAccount = $(this).attr("id");
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
	                        type: "post",
	                        url: "memberdelete/"+memberAccount,
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
	});
</script>




	
</body>
</html>
