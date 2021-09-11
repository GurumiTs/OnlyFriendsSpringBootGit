<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
body{
font-size:1.2rem
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0; // remove the gap so it doesn't close
 }

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.img1 {
	weight: 100px;
	height: 100px;
}

.edit:hover{
	font-size: 130%;
}

.delete:hover {
	font-size: 130%;
}

.delete {
	cursor: pointer;
}

.icon1{
height:50px;
}


tr th{
	font-size: 20px;
}
.data:hover {
	color: white;
	background-color: rgba(92, 92, 92, 0.637);
}

.delete:hover {
	color: red;
}

.delete {
	cursor: pointer;
	color: red;
	font-size: 25px;
}
.icon1 img:hover {
	width: 50px;
	height: 50px;
	display: block;
	
}
</style>
</head>
<body>
 <body class="layout-2">
    <div id="app">
      <div class="main-wrapper">
        
        <%@include file="../frontcommonpages/shopheader.jsp"%>
        
        <%@include file="../frontcommonpages/shopsider.jsp"%>

        <!-- Main Content -->
        <div class="main-content">
          <section class="section">
            <div class="section-header">
              <h1>參加活動</h1>
            </div>

            <div class="section-body">
              <div class="card">
              <div class="card-header icon1">
             
<!--              	<input type="submit" class="btn btn-danger" id="deletesome" value="刪除選中">   -->
<!-- 				<span><img src="images/smallicon/BlogusersDelete.png" width="45px" height="45px" id="deleteSome"></span> -->
              </div>
                  <!-- table -->
             		 <div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table id="example" class="table table-striped"
									style="width: 100%">
									<thead>
										<tr>
											<th>活動編號</th>
											<th>照片</th>
											<th>活動名稱</th>
											<th>活動縣市</th>
											<th>活動行政區</th>
											<th>活動時間</th>
											<th>活動簡介</th>
											<th>退出活動</th>
										</tr>
									</thead>

									<tfoot>
									<tr>
											<th class="d-none">活動編號</th>
											<th class="d-none">照片</th>
											<th class="d-none">活動名稱</th>
											<th class="d-none">活動縣市</th>
											<th class="d-none">活動行政區</th>
											<th class="d-none">活動時間</th>
											<th class="d-none">活動簡介</th>
											<th class="d-none">退出活動</th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
			<!-- table end -->
              
               
              </div>
            </div>
          </section>
        </div>
        <footer class="main-footer">
          <div class="footer-left">
            Copyright &copy; 2018
            <div class="bullet"></div>
            Design By <a href="https://nauval.in/">Muhamad Nauval Azhar</a>
          </div>
          <div class="footer-right">2.3.0</div>
        </footer>
      </div>
    </div>
    
    <%@include file="../frontcommonpages/shopbottom.jsp"%>
    
    
    <script>
 
	$(document).ready(function() {
	
	/* load data table */
	var table = $('#example').DataTable({
	    "ajax": {
	    	"url": "oaforuserpages.controller",
	    	"dataSrc": ""
	    	
	    },
	    "columns": [
	        { "data":"anum"}, 
	    	 { 
		        	"data": null,
		            render:function(data, type, row)
		            {
		              return "<img src="+data.img+" class='img1'>";
		            }
		     },
	
	        { "data":"active"},
	        { "data":"county"},
	        { "data":"district"},
	        { "data":"adate"},
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
	        {
	            "data": null,
	            render:function(data, type, row)
	            {
	              return "<i class='far fa-trash-alt delete' id="+data.anum+"></i>";
	            },
	            "targets": -1
	        }
	    ]
	});		
	
	
	
	/*delete*/
	$("#example tbody").on("click",".delete",function(){
		
		let anum = $(this).attr("id");
//			console.log($(this).closest("tr"));
		let dtr = $(this).closest("tr");
			Swal.fire({
				title:'你確定?',
				text:"按下去就真的退出了喔!",
				icon:'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '確定退出'
			}).then((result)=>{
				if(result.isConfirmed){
					$.ajax({
						type:"POST",
						url:"memberactivedelete/"+anum,	
						success:function(response){
							dtr.remove();
							Swal.fire(
									'退出成功!',
									'您已成功取消參加活動',
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
	
	
	
	
	});// function close
	
	/* load data table */
	
			
    
    
    
    </script>