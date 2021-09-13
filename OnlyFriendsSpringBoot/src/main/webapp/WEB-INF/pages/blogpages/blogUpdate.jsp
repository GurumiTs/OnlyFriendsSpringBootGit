<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
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
					<h1 class="h3 mb-2 text-gray-800">管理者文章 - 修改</h1>
					<div class="box1">
					<form class="row g-3" action="empblogUpdate.controller" method="post"
					enctype="multipart/form-data">
					<div class="mb-3">
						<label>文章編號:</label> <input name="articleId" disabled="disabled"
							size="2" value="${blog.articleID}" style="text-align: center"/> <input type="hidden"
							name="articleId" size="3" value="${blog.articleID}"/> <em
							name="errors">${errors}</em>
						<label>文章建立時間:</label> <input name="createTime" disabled="disabled" size="10" value="${fn:substring(blog.createTime,0,10)}" />
						<input type="hidden" name="createTime" size="22" value="${blog.createTime}" />
					</div>
					<!-- 圖片 -->
					<div style="margin: auto; text-align: center">
						<img id="output" weight="100%" height="300px" src="${blog.images}" /><br>
						<hr>
					</div>
					<div class="mb-3">
						<label for="formFile" class="form-label">文章圖片:</label> <input
							class="form-control" type="file" id="formFile" name="images"
							onchange="loadFile(event)">
					</div>
					<div class="col-md-12">
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">管理者ID:</span> <input
								type="text" class="form-control" placeholder="EmployeeAcc"
								aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
								name="empAcc" value="${blog.empAcc}">
								
								
							<span class="input-group-text" id="inputGroup-sizing-default">暱稱</span> 
							<input type="text" class="form-control" placeholder="UserID"
								aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" 
								name="userID" value="${blog.userID}">
							
						</div>
					</div>
					<div class="col-md-12">
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">文章分類</span>
							<select class="form-select" id="inputGroupSelect03"
								aria-label="Example select with button addon" name="BlogType" value="${blog.blogType}">
								<c:choose>
									<c:when test="${blog.blogType == null}">
										<option selected disabled>請選擇文章分類</option>
									</c:when>
									<c:otherwise>
										<option selected id="BlogType">${blog.blogType}</option>
										<option disabled id="BlogType">----------------</option>
										<option disabled>請選擇文章分類</option>
									</c:otherwise>
								</c:choose>
								
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
								aria-describedby="inputGroup-sizing-default" name="title" id="title"
								value="${blog.title}" required>
							<span id="errorTitle"></span><br>
						</div>
					</div>

					<div class="col-md-12">
						<label for="input-group-text" class="input-group-text">文章內容:</label>
						<textarea class="form-control" style="resize: none;" rows="100" id="editor"
							name="mainText">${blog.mainText}</textarea>
					</div>
						
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
		
		ClassicEditor
        .create( document.querySelector( '#editor' ),{
        })
    	  .catch( error => {
      	    console.error(error);
      	});
		
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
	