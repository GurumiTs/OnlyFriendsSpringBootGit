<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
body{
font-size:1.2rem
}

.img1 {
	weight: 150px;
	height: 150px;
}
.card-header{

}
.insert a img:hover {
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
              <h1>Your Blog</h1>
            </div>

            <div class="section-body">
              <div class="card">
              <div class="card-header insert">
             	<a href="blogusersinsert"><img src="images/smallicon/BlogmgmtInsert.png" width="45px" height="45px"></a>
				<a href="#!"><img src="images/smallicon/BlogmgmtInsert.png" width="45px" height="45px"></a>
				<a href="#!"><img src="images/smallicon/BlogmgmtInsert.png" width="45px" height="45px"></a>
              </div>
                  <!-- table -->
             		 <div class="card shadow mb-4 card-body">
						<div class="card-body">
							<div class="table-responsive">
								<table id="example" class="table table-striped"
									style="width: 100%">
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
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
			<!-- table end -->
                <div class="card-footer bg-whitesmoke">This is card footer</div>
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
    
    
    <script >  
	/* load data table */
	var table = $('#example').DataTable({
	    "ajax": {
	    	"url": "blogalltojson",
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
	        { "data": "userID"},		  
	        {
	            "data": null,
	            render:function(data, type, row)
	            {
	              return "<a href='empupdateentry.controller?articleID="+data.articleID+"'><i class='fas fa-edit'></i>";
	            }
	        },
	        {
	            "data": null,
	            render:function(data, type, row)
	            {
	              return "<i class='far fa-trash-alt delete' id="+data.articleID+"></i>";
	            }
	        }
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
	                        url: "empblogdelete/"+articleID,
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