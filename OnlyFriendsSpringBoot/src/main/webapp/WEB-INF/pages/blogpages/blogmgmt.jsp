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

.edit:hover {
	font-size: 130%;
}

.delete:hover {
	font-size: 130%;
}

.delete {
	cursor: pointer;
}
.deleteUser:hover {
	font-size: 130%;
}

.deleteUser {
	cursor: pointer;
}

.insert{
	height: 50px;
	weight: 150px;
}

.insert a img:hover {
	width: 50px;
	height: 50px;
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
					<h1 class="h3 mb-2 text-gray-800">後台文章管理</h1>
					<!--Employee DataTale  -->
					<div class="card shadow mb-4">

						<div class="card-body">
							<div>
								<div>
									<div class="insert">
										<a href="empbloginsertform.controller"><img
											src="images/smallicon/BlogmgmtInsert.png" width="45px"
											height="45px"></a>&nbsp;
										<span>點擊左圖新增</span>
									</div>
									<div style="float:right;font-size: 20px;"><i id="reloadbutton" type="button" class="fas fa-sync-alt"></i></div>
								</div>
<!-- 								<ul class="nav nav-tabs" id="myTab" role="tablist"> -->
<!-- 									<li role="presentation" class="active"> -->
<!-- 										<a href="#empBlogInfo" role="tab" data-toggle="tab">管理者文章</a> -->
<!-- 									</li> -->
<!-- 									<li role="presentation"> -->
<!-- 										<a href="#userBlogInfo" role="tab" data-toggle="tab">會員文章</a> -->
<!-- 									</li> -->
<!-- 								</ul> -->
								<nav>
									<div class="nav nav-tabs" id="nav-tab" role="tablist">
										<button class="nav-link active" id="nav-home-tab"
											data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
											role="tab" aria-controls="nav-home" aria-selected="true">管理者文章</button>
										<button class="nav-link" id="nav-profile-tab"
											data-bs-toggle="tab" data-bs-target="#nav-profile"
											type="button" role="tab" aria-controls="nav-profile"
											aria-selected="false">會員文章</button>
									</div>
								</nav>
								<br/>
								<div class="tab-content" id="nav-tabContent">
								<!-- 第一table -->
									<div class="tab-pane fade show active" id="nav-home"
										role="tabpanel" aria-labelledby="nav-home-tab">
										<table id="example" class="table table-striped"
											style="width: 100%">
											<thead>
												<tr>
													<th>編號</th>
													<th>圖片</th>
													<th>標題</th>
													<th>最後更新時間</th>
													<th>內容</th>
													<th>管理者帳號</th>
													<th>管理者名稱</th>
													<th>文章類型</th>
													<th>編輯</th>
													<th>刪除</th>
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
													<th class="d-none">類型</th>
													<th class="d-none">編輯</th>
													<th class="d-none">刪除</th>
												</tr>
											</tfoot>
										</table>
									</div>
									
								<!-- 第二table -->
									<div class="tab-pane fade" id="nav-profile" role="tabpanel"
										aria-labelledby="nav-profile-tab">
										<table id="example2" class="table table-striped"
											style="width: 100%">
											<thead>
												<tr>
													<th>編號</th>
													<th>圖片</th>
													<th>標題</th>
													<th>最後更新時間</th>
													<th>內文</th>
													<th>會員帳號</th>
													<th>會員名稱</th>
<!-- 													<th>刪除</th> -->
													<th>狀態</th>
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
<!-- 													<th class="d-none">Del</th> -->
													<th class="d-none">審核狀態</th>
												</tr>
											</tfoot>
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
		$(function(){
			reload();
		});
	
		function delConfirm(Name) {
			return confirm("Delete [" + Name + "] ?");
		}

		var table1 = $('#example').DataTable({
		    "ajax": {
		    	"url": "blogalltojson",
		    	"dataSrc": "blogemp",
		    },
		    "columns": [
		        { "data": "articleID" },
		        { 
		        	"data": null,
		            render:function(data, type, row)
		            {
		              return "<img src="+data.images+" class='img1'>";
		            }
		        },
		        { "data": "title" }, 
		        { "data": "updateTime",
		        	render:function(data, type, row)
		        	{
		        		return data.substring(0, 10);
		        	}	
		        },
		        { 
		        	"data": "mainText",
		        	render:function(data, type, row)
		        	{
		        		if (data) {
		        			return (data.length > 100)?data.substring(0, 100)+"...":data;
		        		} else {
		        			return '';
		        		}
		        	}
		        },
		        { "data": "empAcc"},		  
		        { "data": "userID"},		  
		        { "data": "blogType"},		  
		        {
		            "data": null,
		            render:function(data, type, row)
		            {
		              return "<a class='edit' href='empupdateentry.controller?articleID="+data.articleID+"'><i class='fas fa-edit'></i>";
		            }
		        },
		        {
		            "data": null,
		            render:function(data, type, row)
		            {
		              return "<i class='far fa-trash-alt delete' id="+data.articleID+"></i>";
		            }
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
		    },
		    columnDefs:[
		    	{
		    		targets: [0],
		    		createdCell: function (td, cellData, rowData, row, col){
		    			$(td).css("width", "60px");
		    		},
		    	},
		    	{
		    		targets: [1],
		    		createdCell: function (td, cellData, rowData, row, col){
		    			$(td).css("width", "150px");
		    		},
		    	},
		    	{
		    		targets: [2],
		    		createdCell: function (td, cellData, rowData, row, col){
		    			$(td).css("width", "250px");
		    			$(td).css("font-size", "18px");
		    			$(td).css("font-weight", "bold");
		    		},
		    	},
		    	{
			    	targets: [3],
			    	createdCell: function (td, cellData, rowData, row, col){
		    			$(td).css("width", "150px");
		    		},
			    	render: function(data){
			    		return moment(data).format('YYYY-MM-DD');
			    	},
		    	},
		    	{
		    		targets: [4],
		    		createdCell: function (td, cellData, rowData, row, col){
		    			$(td).css("width", "550px");
		    		},
		    	},
		    	{
		    		targets: '_all',
		    		className: 'text-center'
		    	},
		    ]
		});
		
		var table2 = $('#example2').DataTable(
					{
				    ajax: {
				    	"url": "blogalltojson",
				    	"dataSrc": "bloguser",
				    },
				    columns: [
				        { "data": "usersArticleID" },
				        { 
				        	"data": null,
				            render:function(data, type, row)
				            {
				              return "<img src="+data.usersImages+" class='img1'>";
				            }
				        },
				        { "data": "usersTitle" }, 
				        { "data": "usersUpdateTime", 
				        	render:function(data, type, row)
				        	{
				        		return data.substring(0, 10);
				        	}	
				        },
				        { 
				        	"data": "usersMainText",
				        	render:function(data, type, row)
				        	{
				        		if (data) {
				        			return (data.length > 100)?data.substring(0, 100)+"...":data;
				        		} else {
				        			return '';
				        		}
				        	}
				        },
				        { "data": "memberAccount"},
				        { "data": "usersName"},		
				        { 
				        	"data": null,
				        	render:function(data, type, row)
				        	{
				        		if(data.blogAuthority == '審核通過'){
					        		return "<p style=''>"+data.blogAuthority+"</p>"+
					        		"<div class='form-check form-switch'style='position: relative; text-align:center;'>"+
									"<input class='form-check-input authority' type='checkbox' id='"+data.usersArticleID+"' checked>"+
									"<label	class='form-check-label' for='flexSwitchCheckChecked'>"
									"</label></div>";
				        		}else{
				        			return "<p style='color:red;'>"+data.blogAuthority+"</p>"+
					        		"<div class='form-check form-switch'style='position: relative; text-align:center;'>"+
									"<input class='form-check-input authority' type='checkbox' id='"+data.usersArticleID+"'>"+
									"<label	class='form-check-label' for='flexSwitchCheckChecked'>"
									"</label></div>";
				        		}
				        	}
				        },
				    ],language: {
				    	"lengthMenu": "顯示 _MENU_ 筆資料",
				    	"sInfoEmpty": "目前有 _MAX_ 筆資料",
				    	"sProcessing": "處理中...",
				    	"sSearch": "搜尋:",
				    	"sLoadingRecords": "載入資料中...",
				    	"oPaginate": {
				            "sFirst": "首頁",
				            "sPrevious": "上一頁",
				            "sNext": "下一頁",
				            "sLast": "末頁"
				         },
				    },
				    columnDefs:[
				    	{
				    		targets: [0],
				    		createdCell: function (td, cellData, rowData, row, col){
				    			$(td).css("width", "40px");
				    		},
				    	},
				    	{
				    		targets: [1],
				    		createdCell: function (td, cellData, rowData, row, col){
				    			$(td).css("width", "150px");
				    		},
				    	},
				    	{
				    		targets: [2],
				    		createdCell: function (td, cellData, rowData, row, col){
				    			$(td).css("width", "250px");
				    			$(td).css("font-size", "18px");
				    			$(td).css("font-weight", "bold");
				    		},
				    	},
				    	{
					    	targets: [3],
					    	createdCell: function (td, cellData, rowData, row, col){
				    			$(td).css("width", "100px");
				    		},
					    	render: function(data){
					    		return moment(data).format('YYYY-MM-DD');
					    	},
				    	},
				    	{
				    		targets: [4],
				    		createdCell: function (td, cellData, rowData, row, col){
				    			$(td).css("width", "450px");
				    		},
				    	},
				    	{
				    		targets: [5],
				    		createdCell: function (td, cellData, rowData, row, col){
				    			$(td).css("width", "100px");
				    		},
				    	},
				    	{
				    		targets: [6],
				    		createdCell: function (td, cellData, rowData, row, col){
				    			$(td).css("width", "100px");
				    		},
				    	},
				    	{
				    		targets: [7],
				    		createdCell: function (td, cellData, rowData, row, col){
				    			$(td).css("width", "80px");
				    		},
				    		className: 'text-left'
				    	},
				    	{
				    		targets: '_all',
				    		className: 'text-center'
				    	},
				    ]
				});
		
		// Set Authority
		$("#example2 tbody").on("click", ".authority", function () {
			let usersArticleID=$(this).attr("id");
			console.log(usersArticleID);
			let dtr = $(this).closest("th");
			 $.ajax({
				  type : "post",
				  url: "authority",    
			      data: {"usersArticleID":usersArticleID}, 
			      success: function(data) 
			        {
			    	  	console.log("success")
			    		table2.ajax.reload();
			        },
			      error: function(data) 
			        {
			           console.log('無法送出');
			        }
			  });			  
		});
		
		// Delete
		$("#example tbody").on("click", ".delete", function () {
			let articleID = $(this).attr("id");
			console.log($(this).closest("tr"));
			let dtr = $(this).closest("tr");
			  Swal.fire({
	                title: '確定要刪除此文章?',
	                text: "刪除後將無法回覆該文章資料",
	                icon: 'warning',
	                showCancelButton: true,
	                confirmButtonColor: '#3085d6',
	                cancelButtonColor: '#d33',
	                confirmButtonText: '確定刪除',
	                cancelButtonText: '取消'
	              }).then((result) => {
	                if (result.isConfirmed) {
	                  $.ajax({
	                        type: "POST",
	                        url: "empblogdelete/"+articleID,
	                        success: function(response) {  
	                        	dtr.remove();
	                             Swal.fire(
	                              '刪除成功！',
	                              '所選文章已經刪除',
	                              'success'
	                            ) } ,
	                            error: function (xhr) {
	                            Swal.fire({
	                              icon: 'error',
		                          title: '錯誤！',
		                          text: '請重新檢查文章內容。'
	                            }) },  //error close
	                     }); //ajax close          
	                } //if close 

	           }); //then close 
		});
		
		// Delete userblog
		$("#example2 tbody").on("click", ".deleteUser", function () {
			let usersArticleID = $(this).attr("id");
			console.log($(this).closest("tr"));
			let dtr = $(this).closest("tr");
			  Swal.fire({
				  title: '是否移除掉此會員發布的文章?',
	                text: "刪除後將無法回覆該文章資料",
	                icon: 'warning',
	                showCancelButton: true,
	                confirmButtonColor: '#3085d6',
	                cancelButtonColor: '#d33',
	                confirmButtonText: '確定刪除',
	                cancelButtonText: '取消'
	              }).then((result) => {
	                if (result.isConfirmed) {
	                  $.ajax({
	                        type: "POST",
	                        url: "usersblogdelete/"+usersArticleID,
	                        success: function(response) {  
	                        	dtr.remove();
	                        	Swal.fire(
	  	                          '刪除成功！',
	  	                          '所選文章已經刪除',
	  	                          'success'
	                            ) } ,
	                            error: function (xhr) {
	                            Swal.fire({
	                              icon: 'error',
	                              title: '錯誤！',
	                              text: '請重新檢查文章內容。'
	                            }) },  //error close
	                     }); //ajax close          
	                } //if close 

	           }); //then close 
		});
		
		function reload(){
			$("#reloadbutton").click(function(){
				table1.ajax.reload();
				table2.ajax.reload();
			});
		};
		
	</script>
</body>
</html>

