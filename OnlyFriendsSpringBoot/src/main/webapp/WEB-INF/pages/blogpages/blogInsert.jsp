<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>
<style type="text/css">
.container {
	font-family: 微軟正黑體;
}

.jumbotron {
	background: url("images/title1.jpg") no-repeat center center/cover;
	height: 250px;
}

.box1 {
	background-color: white;
	border: 1px solid #f4f4f4;
	border-radius: 5px;
	margin: 100px;
	padding: 20px;
	display: block;
	box-shadow: 3px 3px 3px gray;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

#editor{

}
</style>
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
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
					<h1 class="h3 mb-2 text-gray-800">管理者文章 - 新增</h1>
					<div class="box1">
					<form class="row" action="empaddBlog.controller" method="post"
						enctype="multipart/form-data">
						<div class="col-md-12">

							<!-- 圖片 -->
							<div style="margin: auto; text-align: center">
								<img id="output" weight="100%" height="300px" /> <br>
								<hr>
							</div>

							<div class="mb-3">
								<label for="formFile" class="form-label">文章圖片:</label> <input
									class="form-control" type="file" id="formFile" name="images"
									onchange="loadFile(event)">
							</div>
						</div>

						<div class="col-md-12">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">管理者ID:</span>
								<input type="text" class="form-control"
									placeholder="EmployeeAcc" aria-label="Sizing example input"
									aria-describedby="basic-addon1" name="empAcc" value="${personalinfo.empAccount}">
									<span class="input-group-text"
									id="inputGroup-sizing-default">暱稱</span> 
									<input type="text" class="form-control" placeholder="UserID"
									aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" 
									name="userID"  value="${personalinfo.empName}">
									<span id="erroruUserId"></span>
							</div>
						</div>
						
						<div class="col-md-12">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">文章分類</span>
								<select class="form-select" id="inputGroupSelect03"
									aria-label="Example select with button addon" name="BlogType">
									<option selected disabled>請選擇文章分類</option>
									<option value="愛情" id="BlogType">愛情</option>
									<option value="星座" id="BlogType">星座</option>
									<option value="新聞" id="BlogType">新聞</option>
									<option value="Beauty" id="BlogType">Beauty</option>
									<option value="測驗" id="BlogType">測驗</option>
									<option value="其他" id="BlogType">其他</option>
								</select>
							</div>
						</div>
						
						<div class="col-md-12">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">文章標題:</span>
								<input type="text" class="form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" name="title" id="title" required><span
									id="errorTitle"></span><br>
							</div>
						</div>

						<div class="col-md-12">
							<label for="input-group-text" class="input-group-text">文章內容:</label>
							<textarea class="form-control" style="resize: none;" id="editor"
								rows="100" name="mainText"></textarea>
						</div>
						
						<script>
				        	ClassicEditor
				              .create( document.querySelector( '#editor' ),{
				              } )
				          	  .catch( error => {
				            	    console.error(error);
				            } );
				  		</script>
						
						<div style="margin: 10px auto; text-align: center;">
							<!-- <input type="submit" name="confirm" value="送出"> -->
							<button type="submit" class="btn btn-primary">送出</button>

							<button onclick="location.href='empblogmgmt.controller'"
								type="button" class="btn btn-primary">返回</button>
							<!--  οnclick="javascript:history.back(-1)" -->
						</div>
					</form>
				</div>
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
	<script type="text/javascript">
		var loadFile = function(event) {
			var output = document.getElementById('output');
			output.src = URL.createObjectURL(event.target.files[0]);
			output.onload = function() {
				URL.revokeObjectURL(output.src) // free memory
			}
		};
		
		document.getElementById("title").onblur=checkTitle;
        function checkTitle(){
            let sp=document.getElementById("errorTitle");
            let theNameVal=document.getElementById("title").value;
            console.log(theNameVal);
            if(theNameVal != ""){
                sp.innerHTML='<img id="check" src="images/smallicon/check.png" > ';
            }else{
                sp.innerHTML='<img id="error" src="images/smallicon/error.png"> 不可空白'; 
            }
            
        }
        
        
	</script>

 </body>
</html>	
	