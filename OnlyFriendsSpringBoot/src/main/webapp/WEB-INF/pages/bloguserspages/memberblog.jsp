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

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.img1 {
	weight: 150px;
	height: 150px;
}
tr th{
	font-size: 20px;
}
.edit{
	font-size: 25px;
}

.edit:hover{
	font-size: 40px;
}

.delete:hover {
	font-size: 40px;
}

.delete {
	cursor: pointer;
	font-size: 25px;
}

.icon1{
height:50px;
}

.icon1 img:hover {
	width: 50px;
	height: 50px;
	display: block;
}
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0; // remove the gap so it doesn't close
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
              <h1>管理我的文章</h1>
            </div>

            <div class="section-body">
              <div class="card">
              <div class="card-header icon1">
             	<div style=""><a href="blogusersinsert"><img src="images/smallicon/BlogmgmtInsert.png" width="45px" height="45px"></a></div>
<!--              	<input type="submit" class="btn btn-danger" id="deletesome" value="刪除選中">   -->
<!-- 				<span><img src="images/smallicon/BlogusersDelete.png" width="45px" height="45px" id="deleteSome"></span> -->
              </div>
                  <!-- table -->
             		 <div class="card shadow mb-4">
						<div class="card-body">
							<div class="">
								<table id="example" class="table table-striped">
									<thead>
										<tr>
											<th>文章編號</th>
											<th>圖片</th>
											<th>標題</th>
											<th>最後修改時間</th>
											<th>內文</th>
											<th>暱稱</th>
											<th>修改</th>
											<th>刪除</th>
											<th>審核狀態</th>
										</tr>
									</thead>

									<tfoot>
										<tr>
											<th class="d-none">文章編號</th>
											<th class="d-none">圖片</th>
											<th class="d-none">文章標題</th>
											<th class="d-none">最後更新時間</th>
											<th class="d-none">內容</th>
											<th class="d-none">暱稱</th>
											<th class="d-none">Edit</th>
											<th class="d-none">Del</th>
											<th class="d-none">審核狀態</th>
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
				<!-- 新增彈窗 -->
     			<c:if test="${not empty insertSuccess}">
						<script>
							Swal.fire({
								  position: 'center',
								  icon: 'insertSuccess',
								  title: '投稿成功! 待審核通過後通知您!',
								  showConfirmButton: false,
								  timer: 1500
								})
					
						</script>						
					<c:remove var="insertSuccess" scope="session" />
				</c:if>
     			<c:if test="${not empty insertError}">
						<script>
							Swal.fire({
								  icon: 'insertError',
								  title: 'Oops...',
								  text: '投稿失敗，請確認資料後再次更新!',
								})
					
						</script>						
					<c:remove var="insertError" scope="session" />
				</c:if>
				
				<!-- 修改彈窗 -->
     			<c:if test="${not empty success}">
						<script>
							Swal.fire({
								  position: 'center',
								  icon: 'success',
								  title: '更新成功!',
								  showConfirmButton: false,
								  timer: 1500
								})
					
						</script>						
					<c:remove var="success" scope="session" />
				</c:if>
     			<c:if test="${not empty error}">
						<script>
							Swal.fire({
								  icon: 'error',
								  title: 'Oops...',
								  text: '更新失敗，請確認資料後再次更新!',
								})
					
						</script>						
					<c:remove var="error" scope="session" />
				</c:if>
    
    <script >  
	/* load data table */
	var table = $('#example').DataTable(
		{
	    ajax: {
	    	"url": "userblogalltojson",
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
	        { "data": "usersUpdateTime" },
	        { 
	        	"data": "usersMainText",
	        	render:function(data, type, row)
	        	{
	        		if (data) {
	        			return (data.length > 90)?data.substring(0, 90)+"...":data;
	        		} else {
	        			return '';
	        		}
	        	}
	        },
	        { "data": "usersName"},		  
	        {
	            "data": null,
	            render:function(data, type, row)
	            {
	              return "<a href='blogusersupdate?usersArticleID="+data.usersArticleID+"'><i class='fas fa-edit edit'></i>";
	            }
	        },
	        {
	            "data": null,
	            render:function(data, type, row)
	            {
	              return "<i class='far fa-trash-alt delete' id="+data.usersArticleID+"></i>";
	            }
	        },
	        {
	            "data": null,
	            render:function(data, type, row)
	            {
	              return "<p>"+data.blogAuthority+"</p>";
	            }
	        }
	    ]
	    ,language: {
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
	    			$(td).css("width", "400px");
	    			$(td).css("font-weight", "bold");
	    			$(td).css("font-size", "18px");
	    		},
	    	},
	    	{
		    	targets: [3],
		    	createdCell: function (td, cellData, rowData, row, col){
	    			$(td).css("width", "130px");
	    		},
		    	render: function(data){
		    		return moment(data).format('YYYY-MM-DD');
		    	},
	    	},
	    	{
	    		targets: [4],
	    		createdCell: function (td, cellData, rowData, row, col){
	    			$(td).css("width", "500px");
	    		},
	    	},
	    	{
	    		targets: [5],
	    		createdCell: function (td, cellData, rowData, row, col){
	    			$(td).css("width", "100px");
	    			$(td).css("font-size", "14px");
	    		},
	    	},
	    	{
	    		targets: [6],
	    		createdCell: function (td, cellData, rowData, row, col){
	    			$(td).css("width", "80px");
	    			$(td).css("font-size", "14px");
	    		},
	    	},
	    	{
	    		targets: [7],
	    		createdCell: function (td, cellData, rowData, row, col){
	    			$(td).css("width", "80px");
	    			$(td).css("font-size", "14px");
	    		},
	    	},
	    	{
	    		targets: [8],
	    		createdCell: function (td, cellData, rowData, row, col){
	    			$(td).css("width", "100px");
	    			$(td).css("font-size", "14px");
	    		},
	    	},
	    	{
	    		targets: '_all',
	    		className: 'text-center'
	    	},
	    ]
	});

	// Delete
	$("#example tbody").on("click", ".delete", function () {
		let articleID = $(this).attr("id");
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
	                  url: "usersblogdelete/"+articleID,
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
	
//     // Delete多選
// 	$(function(){
//     	$(#deleteSome).click(function(){
//     		$.ajax({
//     			type: "POST",
//     			url: "usersblogdeletesome",
//     			dataType: "Json",
//     			data: "delete="+$(this).next().val(),
//     			success: function(data){
//     				if(data.status == 1){
//     					$(me).parent().parent().remove();
//     				}else{
// 						alert('系統故障');
// 					}
//     			}
//     		});
//     	});
//     });    
    
    </script>
  </body>
</html>       