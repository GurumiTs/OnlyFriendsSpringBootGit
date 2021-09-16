<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>

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
					
					<nav>
					  <div class="nav nav-tabs" id="nav-tab" role="tablist">
					    <button class="btn btn-secondary mx-1 my-2" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true"><i class="fas fa-users"></i></button>
					    <button class="btn btn-secondary mx-1 my-2" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false"><i class="fas fa-user-shield"></i></button>
					  </div>
					</nav>
								
						<div class="card-body">
							<div class="table-responsive">
							
							<div class="tab-content" id="nav-tabContent">
						  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
						 
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
						  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
						  
						  <table id="example2" class="table table-hover text-center text-dark fs-5 hover"
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
		    	"url": "memallowornotjson",
		    	"dataSrc": "allow",
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
				         return "<button class='btn btn-warning edit' id="+data.memberAccount+"><i class='fas fa-user'></i>停用</button>";
		              
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
		
		/* load data table */
		var table2 = $('#example2').DataTable({
		    "ajax": {
		    	"url": "memallowornotjson",
		    	"dataSrc": "notallow",
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
		              
			             return "<button class='btn btn-danger edit' id="+data.memberAccount+"><i class='fas fa-user-slash'></i>啟用</button>";
      
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
					table2.ajax.reload();
				},
				error:function(xhr){
					
				}
			})
		})
		
		$("#example2 tbody").on("click", ".edit", function () {
			let memberAccount = $(this).attr("id");
			$.ajax({
				type:"post",
				url:"banuser",
				data:{"memberAccount":memberAccount},
				success:function(response){
					table.ajax.reload();
					table2.ajax.reload();
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
