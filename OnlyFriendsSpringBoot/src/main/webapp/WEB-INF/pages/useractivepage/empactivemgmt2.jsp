<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>
<style>

body {
	font-size: 1.2rem
}

.img1{
 width:250px;
 hight:200px;
 }
 delete:hove{
transform: scale(1.2)
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
											<th>Time　　　</th>
											<th>Deadline　　　</th>
											<th>County</th>
											<th>District</th>
											<th>Place　　　</th>
											<th>detail　　　　　　　　　　　　</th>
											<th>Condition　　　</th>
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
		            }		  
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
		            	
		            if(data.approve == 'true'){
		            	 return "<div class='form-check form-switch'style='position: relative;'>"+
						"<input class='form-check-input approve' type='checkbox' id='"+data.number+"' checked>"+
						"<label	class='form-check-label' for='flexSwitchCheckChecked'>"
						"</label></div>";
		            }
		            else{
		            	 return "<div class='form-check form-switch'style='position: relative;'>"+
							"<input class='form-check-input approve' type='checkbox' id='"+data.number+"' >"+
							"<label	class='form-check-label' for='flexSwitchCheckChecked'>"
							"</label></div>";		            	
		            }
		            	
		             
		            },
		           
		        },
				{
			            "data": null,
			            render:function(data, type, row)
			            {
			              return "<i class='far fa-trash-alt delete' id="+data.number+"></i>";
			            }
			   },
			],
			"columnDefs":[
				{
		    		targets: [16],
		    		createdCell: function (td, cellData, rowData, row, col){
		    			$(td).css("width", "450px");
		    		},
		    		className: 'text-center'
				},
			]
		});
		
		$("#example tbody").on("click", ".approve", function () {
			let number=$(this).attr("id");
			console.log(number);
			let dtr = $(this).closest("th");
			 $.ajax({
				  type : "post",
				  url: "approve",    
			      data: {"number":number}, 
			      success : function(data) 
			        {
			    	  	console.log("success")
			    		table.ajax.reload();
			    	  
			        },error: function(data) 
			        {
			           console.log('無法送出');
			        }
			  });			  
			
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
