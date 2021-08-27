<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<script
	src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
<style>
body {
	font-size: 1.2rem
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
			<div name="successDiv" style="display: none;"></div>
			<div name="errorsDiv" style="display: none;"></div>
			<div class="container mt-5">
				<br>
				<!-- Page Heading -->
				<h1 class="h3 mb-2 text-gray-800">Update Article</h1>
				<div class="box1">
					<form class="row g-3" action="blogusersupdateform" method="post"
						enctype="multipart/form-data">
<!-- 						<legend style="text-align: center;">更新資料</legend> -->
						<div class="mb-3">
							<label>文章編號:</label> 
							<input name="usersArticleID" disabled="disabled"
								size="2" value="${blogUser.usersArticleID}"
								style="text-align: center" />
							<input type="hidden" name="usersArticleID" size="3" value="${blogUser.usersArticleID}" />
							<em name="errors">${errors}</em> 
							<label>文章建立時間:</label> 
							<input name="usersCreateTime" disabled="disabled" size="10"
								value="${fn:substring(blogUser.usersCreateTime,0,10)}" /> 
							<input type="hidden" name="usersCreateTime" size="22" value="${blogUser.usersCreateTime}" />
						</div>
						<!-- 圖片 -->
						<div style="margin: auto; text-align: center">
							<img id="output" weight="100%" height="300px"
								src="${blogUser.usersImages}" /><br>
							<hr>
						</div>
						<div class="mb-3">
							<label for="formFile" class="form-label">文章圖片:</label> 
							<input class="form-control" type="file" id="formFile" name="usersImages" onchange="loadFile(event)">
						</div>
						<div class="col-md-12">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">帳號</span>
								<input type="text" class="form-control" disabled="disabled"
									value="${blogUser.memberAccount}"
									aria-label="Sizing example input"
									aria-describedby="basic-addon1" name="memberAccount"> 
								<input type="hidden" class="form-control" value="${blogUser.memberAccount}" name="memberAccount">
								<span id="errorAcc"></span> 
								<span class="input-group-text" id="inputGroup-sizing-default">暱稱</span> 
								<input type="text" class="form-control" placeholder="usersName"
									aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="usersName"
									value="${blogUser.usersName}">
							</div>
						</div>

						<div class="col-md-12">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">文章標題:</span>
								<input type="text" class="form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" name="usersTitle"
									value="${blogUser.usersTitle}">
							</div>
						</div>

						<div class="col-md-12">
							<label for="input-group-text" class="input-group-text">文章內容:</label>
							<textarea class="form-control" style="resize: none;" rows="100"
								id="editor" name="usersMainText">${blogUser.usersMainText}</textarea>
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

							<button onclick="location.href='memberblog'" type="button"
								class="btn btn-primary">返回</button>
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
		$(function(){
			var seccess = '${success}';
			var successDiv = document.getElementById("successDiv");
			if(model != ''){
				
			}
			
		});
	</script>
</body>
</html>
