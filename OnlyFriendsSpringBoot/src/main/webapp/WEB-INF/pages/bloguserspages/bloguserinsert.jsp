<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
<style>
body{
font-size:1.2rem
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

</style>
</head>
<body>
<body class="layout-2">
	<div id="app">
		<div class="main-wrapper">

			<%@include file="../frontcommonpages/shopheader.jsp"%>

			<!-- Page content-->
        <div class="container mt-5">
        <br>
                <!-- Page Heading -->
<!-- 					<h1 class="h3 mb-2 text-gray-800">發布文章</h1> -->
					<div class="box1">
					<form class="row" action="blogusersinsertform" method="post"
						enctype="multipart/form-data">
						<div class="col-md-12">

							<legend style="text-align: center;">文章新增</legend>
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
									aria-describedby="basic-addon1" name="empAcc"><span
									id="errorAcc"></span> <span class="input-group-text"
									id="inputGroup-sizing-default">暱稱</span> <input type="text"
									class="form-control" placeholder="UserID"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" name="userID"><span
									id="erroruUserId"></span>
							</div>
						</div>

						<div class="col-md-12">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">文章標題:</span>
								<input type="text" class="form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" name="title"><span
									id="errorTitle"></span>
							</div>
						</div>

						<div class="col-md-12">
							<label for="input-group-text" class="input-group-text">文章內容:</label>
							<textarea class="form-control" style="resize: none;" id="editor"
								rows="100" name="mainText"></textarea>
							<div id="errorMainText"></div>
						</div>
						
						<script>
				        	ClassicEditor
				              .create( document.querySelector( '#editor' ),{
				            	  toolbar: {
				            		    items: [
				            		        'heading', '|',
// 				            		        'Font', 'Fontfamily', 'Fontsize', '|',
				            		        'bold', 'italic', '|',
				            		        'undo', 'redo'
				            		    ],
				            		    shouldNotGroupWhenFull: true
				            	  },
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
        </div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
		</div>
	</div>

	<%@include file="../frontcommonpages/shopbottom.jsp"%>

	<script type="text/javascript">
		var loadFile = function(event) {
			var output = document.getElementById('output');
			output.src = URL.createObjectURL(event.target.files[0]);
			output.onload = function() {
				URL.revokeObjectURL(output.src) // free memory
			}
		};
	</script>
</body>
</html>
