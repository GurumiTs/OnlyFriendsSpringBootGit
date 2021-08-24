<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
#Grid:hover {
	transform: scale(1.05);
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

				<br /> <br />
				<!-- 輪播 -->
				<div id="carouselExampleFade" class="carousel slide carousel-fade"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="images\partyPic\優質單身男女.jpg" class="d-block w-100" alt="..." style="width: 900px; height: 400px;">
						</div>
						<div class="carousel-item">
							<img src="images\partyPic\五分鐘.jpg" class="d-block w-100" alt="..." style="width: 900px; height: 400px;">
						</div>
						<div class="carousel-item">
							<img src="images\partyPic\打到骨折.jpg" class="d-block w-100" alt="..." style="width: 900px; height: 400px;">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleFade" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleFade" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<!-- 輪播 style="width: 900px; height: 400px;" images\partyPic\party2.jpg-->
				<br />
				<div class="col-md-4 col-xs-12">
					<select class="from-cotrol">
					<option value="1">依日期排列</option>
					<option value="2">依地區排列</option>
					<option value="2">依活動排列</option>
					</select>
				<button type="submit" class="btn btn-sub1">搜尋</button>
				</div>
				<div class="row">
					<!-- Blog entries-->
					<div class="col-lg-12">
						<!-- Nested row for non-featured blog posts-->

						<form action="userActivity.controller" method="post"
						enctype="multipart/form-data">
						<div class="st1">
							<div class="">
								<img id="output"
									src="images\partyPic\party1.jpg"
									alt=""><br>

							</div>
							<div>
								<label class="form-label" for="">封面照片</label><span id="sp_cover"></span>
								<input name="cover" class="form-control" type="file" id="cover"
									multiple onchange="lovdFile(event)">

							</div>
							<div>
								<input type="hidden" name="anum" size="20"
									placeholder="請輸入活動ID..." value="${party.number}" /> <label
									for="">活動名稱: </label> <input type="text" name="Activityname">
							</div>


							<div>
								<select name="type" class="form-select form-select-sm"
									aria-label=".form-select-sm example">
									<option selected>活動類型</option>
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
									name="time" id="time">
							</div>
							<div>
								<!-- yyyy-mm-dd  -->
								<label class="" for="">截止日期:</label> <input
									type="datetime-local" name="time_up" id="time_up">
							</div>

							<div>
								<label for="comment1" class="">活動內容:</label>
								<textarea name="Detail" id="plan" cols="40" rows="5" value=""></textarea>
							</div>

							<div>
								<!-- 縣市 區域 跟 完整地址 -->
								<label for="">活動地點:</label> <span id="twzipcode"></span><input
									type="text" name="place">
							</div>

							<div>
								<label>參加條件</label> <input type="text" name="condition">
								<br> <label for="">男生人數:</label> <input type="number"
									name="man" id="numberInput" min="0" max="12" step="1"
									onchange="numberChange()"> <label for="">
									女生人數:</label> <input type="number" name="woman" id="numberInput"
									min="0" max="12" step="1" onchange="numberChange()">
							</div>
							<div>
								<button type="submit" class="btn btn-primary btn-sm">創建活動</button>
								<button type="reset" class="btn btn-secondary btn-sm">清除資料</button>
							</div>
						</div>
					</form>
					</div>
				</div>
			</div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
		</div>
	</div>

	<%@include file="../frontcommonpages/shopbottom.jsp"%>

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
			county : "${userActivity.county}",
			district : "${userActivity.district}",
		});
	</script>
</body>
</html>
