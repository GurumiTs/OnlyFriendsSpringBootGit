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
             	<div style=""><a href="blogusersinsert"></a></div>
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
											
										</tr>
									</thead>

									<tfoot>
									<tr>
											<th>活動編號</th>
											<th>照片</th>
											<th>活動名稱</th>
											<th>活動縣市</th>
											<th>活動行政區</th>
											<th>活動時間</th>
											
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