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

			<!-- Page content-->
        <div class="container mt-5">
        <br>
                <!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">會員文章 - 新增</h1>
					<div class="box1">
					<form class="row" action="blogusersinsertform" method="post"
						enctype="multipart/form-data">
						<div class="col-md-12">

							<!-- 圖片 -->
							<div style="margin: auto; text-align: center">
								<img id="output" weight="100%" height="300px" /> <br>
								<hr>
							</div>

							<div class="mb-3">
								<label for="formFile" class="form-label">文章圖片:</label> <input
									class="form-control" type="file" id="formFile" name="usersImages"
									onchange="loadFile(event)">
							</div>
						</div>

						<div class="col-md-12">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">帳號</span>
								<input type="text" class="form-control" disabled="disabled"
									value="${personalinfo.memberAccount}" aria-label="Sizing example input"
									aria-describedby="basic-addon1" name="memberAccount">
								<input type="hidden" class="form-control"
									value="${personalinfo.memberAccount}" name="memberAccount">
								<span id="errorAcc"></span> 
								<span class="input-group-text" id="inputGroup-sizing-default">暱稱</span> 
								<input type="text" class="form-control" value="${personalinfo.memberName}"
									aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="usersName">
								<span id="erroruUserId"></span>
							</div>
						</div>

						<div class="col-md-12">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">標題:</span>
								<input type="text" class="form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" name="usersTitle"><span
									id="errorTitle"></span>
							</div>
						</div>

						<div class="col-md-12">
							<label for="input-group-text" class="input-group-text">文章內容:</label>
							<textarea class="form-control" style="resize: none;" id="editor"
								rows="100" name="usersMainText"></textarea>
							<div id="errorMainText"></div>
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

							<button onclick="location.href='memberblog'"
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
