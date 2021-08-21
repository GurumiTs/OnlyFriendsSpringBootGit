<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>
<style>
#output {
	width: 600px;
	height: 450px;
}

.st1 {
	border: 2px solid grey;
	border-radius: 5px;
	width: 610px;
}

textarea {
	resize: none;
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
					<h1 class="h3 mb-2 text-gray-800">會員修改活動</h1>
					
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="st1">
					<!-- 活動欄位 -->
					<!-- <legend><strong>創辦活動(測試版)</strong></legend>-->
					<div class="st1">
					<!-- 活動欄位 -->
					<!-- <legend><strong>創辦活動(測試版)</strong></legend>-->
					<form action="emppartyup.controller" method="post"
						enctype="multipart/form-data">
						<div class="st1">
							<div class="">
								<img id="output" alt="" src="${party.cover}"><br>
							</div>

							<div>
								<label class="form-label" for="">封面照片</label><span id="sp_cover"></span>
								<input name="cover" class="form-control" type="file" id="cover"
									value="${party.cover}" multiple onchange="lovdFile(event)">

							</div>

							<lebel>請輸入欲修改活動ID:<input type="text" name="anum"
								size="20" placeholder="請輸入活動ID..." disabled="disabled"
								value="${party.number}"></lebel>
							<div>
								<input type="hidden" name="anum" size="20"
									placeholder="請輸入活動ID..." value="${party.number}" /> <label
									for="">活動名稱: </label> <input type="text" name="name"
									value="${party.name}">
							</div>


							<div>
								<select name="type" class="form-select form-select-sm"
									aria-label=".form-select-sm example" value="${party.type}">
									<option selected  value="${party.type}">活動類型</option>
									<option value="約會">約會</option>
									<option value="旅遊">旅遊</option>
									<option value="體能">體能</option>
									<option value="收藏">收藏</option>
									<option value="娛樂">娛樂</option>
									<option value="創作">創作</option>
									<option value="社會">社會服務</option>
									<option value="飼養">栽培飼養</option>
								</select>
							</div>
							<div>
								<!-- yyyy-mm-dd  -->
								<label class="" for="">活動日期:</label> <input type="date"
									name="time" id="time" value="${party.time}">
							</div>
							<div>
								<!-- yyyy-mm-dd  -->
								<label class="" for="">截止日期:</label> <input
									type="datetime-local" name="time_up" id="time_up"
									value="${party.time_up}">
							</div>

							<div>
								<label for="comment1" class="">活動內容:</label>
								<textarea name="plany" id="plan" cols="40" rows="5" value="">${party.plany}</textarea>
							</div>

							<div>
								<!-- 縣市 區域 跟 完整地址 -->
								<label for="">活動地點:</label> <span id="twzipcode"></span><input
									type="text" name="place" value="${party.place}">
							</div>

							<div>
								<label>參加條件</label> <input type="text" name="condition"
									value="${party.condition}"> <br> <label for="">男生人數:</label>
								<input type="number" name="man" id="numberInput" min="0"
									max="12" step="1" onchange="numberChange()"
									value="${party.man}"> <label for=""> 女生人數:</label> <input
									type="number" name="woman" id="numberInput" min="0" max="12"
									step="1" onchange="numberChange()" value="${party.woman}">
							</div>
							<div>
								<button type="submit" class="btn btn-primary btn-sm">修改活動</button>
								<button type="reset" class="btn btn-secondary btn-sm">清除資料</button>
							</div>
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
<script>
		// 照片顯示
		var lovdFile = function(event) {
			var output = document.getElementById('output');
			output.src = URL.createObjectURL(event.target.files[0]);
			output.onload = function() {
				URL.revokeObjectURL(output.src)
			}
		}
		// 照片欄位判定
		document.getElementById("cover").addEventListener("blur", checkcover);

		function checkcover() {
			let cover = document.getElementById("cover");
			let coverVal = cover.value;
			let sp_cover = document.getElementById("sp_cover");
			let coverCheck = /\.jpg$/;
			if (coverVal == "")
				sp_cover.innerHTML = "請上傳照片";
			else if (coverCheck.test(coverVal) == false)
				sp_cover.innerHTML = "僅支援 .jpg 檔案"
			else
				sp_cover.innerHTML = "成功"
		}
		// 縣市
		$("#twzipcode").twzipcode({
			zipcodeIntoDistrict : true,
		});

		$("#twzipcode").twzipcode("set", {
			county : "${party.county}",
			district : "${party.district}",
		});
	</script>
 </body>
</html>	
	
