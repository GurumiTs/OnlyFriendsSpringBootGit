<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>
<style>
body{
font-size:1.2rem
}

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
					<h1 class="h3 mb-2 text-gray-800">Official Active</h1>
					<!--Employee DataTale  -->
					<div class="card shadow mb-4">
						
						<div class="card-body">
							<div class="table-responsive">
							<table id="example233" class = "table  text-center fs-5 bg-linear2"
									style="width: 100%"> </table>
						 	<a href="empofficialactiveform.controller"><img src="images/smallicon/add.svg" alt=""></a>
							
							<table id="example" class="table table-striped" style="width:100%"> 
							
							
							
            <thead>
                <tr>
                	<th>照片</th>
			        <th>管理者ID</th>
			          <th>活動編號</th>
			          <th>管理者名稱</th>
			          <th>活動類型1</th>
			          <th>活動類型2</th>
			          <th>活動日期</th>
			          <th>活動報名開始</th>
			          <th>活動報名截止</th>
			          <th>活動名稱</th>
			          <th>活動縣市</th>
			          <th>活動行政區</th>
			          <th>活動內容</th>
			          <th>男性人數</th>
			          <th>女性人數</th>
			          <th>編輯</th>
			     
			          
			          
			          
                </tr>
            </thead>
            <tbody>
     	
             </tbody>
            <tfoot>
                <tr>
               		 <th>照片</th>
			          <th>管理者ID</th>
			          <th>隨機活動編號</th>
			          <th>管理者名稱</th>
			          <th>活動類型1</th>
			          <th>活動類型2</th>
			          <th>活動日期</th>
			          <th>活動報名開始</th>
			          <th>活動報名截止</th>
			          <th>活動名稱</th>
			          <th>活動縣市</th>
			          <th>活動行政區</th>
			          <th>活動內容</th>
			          <th>男性人數</th>
			          <th>女性人數</th>   
			          <th>編輯</th>          
                </tr>
            </tfoot>
        </table>
				


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
		
		/* load data table */
		var table = $('#example').DataTable({
		    "ajax": {
		    	"url": "oatojson",
		    	"dataSrc": ""
		    	
		    },
		    "columns": [
		    	 { 
			        	"data": null,
			            render:function(data, type, row)
			            {
			              return "<img src="+data.img+" class='img1'>";
			            }
			        },
		        { "data":"empAcc"},
		        { "data":"anum"}, 
		        { "data":"aname"},
		        { "data":"atype"},
		        { "data":"atype2"},
		        { "data":"adate"},
		        { "data":"startDeadline"},
		        { "data":"finishDeadline"},
		        { "data":"active"},
		        { "data":"county"},
		        { "data":"district"},
		      	{"data": "conditions",
	        	render:function(data, type, row)
	        	{
	        		if (data) {
	        			return (data.length > 30)?data.substring(0, 30)+"...":data;
	        		} else {
	        			return '';
	        		}
	        	}
	        },
		        { "data":"male"},
		        { "data":"female"},
		        {
		            "data": null,
		            render:function(data, type, row)
		            {
		              return "<a id="+data.anum+" class='fas fa-user-edit edit' href = 'empofficialactivesaveorupdate.controller?anum="+data.anum+"'></a> <span></span> <i class='far fa-trash-alt delete' id="+data.anum+"></i>";
		            },
		            "targets": -1
		        }
		    ]
		});		
		
		});
		
		/* load data table */
		
		
		
		/*delete*/
		$("#example tbody").on("click",".delete",function(){
			
			let anum = $(this).attr("id");
// 			console.log($(this).closest("tr"));
			let dtr = $(this).closest("tr");
				Swal.fire({
					title:'你確定?',
					text:"按下去就真的刪了喔!",
					icon:'warning',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
		            cancelButtonColor: '#d33',
		            confirmButtonText: '刪掉了喔'
				}).then((result)=>{
					if(result.isConfirmed){
						$.ajax({
							type:"POST",
							url:"empdeleteofficailactive/"+anum,	
							success:function(response){
								dtr.remove();
								Swal.fire(
										'刪除成功!',
										'',
										'success'
										) },
										error:function(xhr){
											Swal.fire({
												icon:'error',
												title:'Oops...',
												text:'Something went wrong!'
											}) },	//error close
						});//ajax close
					} //if close
				}); //then close
			});
		
	
		
	</script>
 </body>
</html>	
	
