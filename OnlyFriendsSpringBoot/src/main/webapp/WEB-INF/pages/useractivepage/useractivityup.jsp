<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
body{
font-size:1.2rem
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
				<div class="col-12 col-md-12 col-lg-5"
					style="background-color: White; border-radius: 10px;">
						<form action="userActivityup.controller" method="post"
						enctype="multipart/form-data">
						<div class="st1">
							<div class="">
								<img id="output" src="${userActivity.cover}" alt=""
									style="width: 600px; height: 450px; border-radius:10px; margin:10px"><br>

							</div>
							<div>
								<label class="form-label" for="">封面照片</label><span id="sp_cover"></span>
								<input name="cover" class="form-control" type="file" id="cover"
									multiple onchange="lovdFile(event)">

							</div>
							<lebel>請輸入欲修改活動ID:<input type="text" name="anum"
								size="20" placeholder="請輸入活動ID..." disabled="disabled"
								value="${userActivity.number}"></lebel>
							<div>
								<input type="hidden" name="anum" size="20"
									placeholder="請輸入活動ID..." value="${userActivity.number}" /> <label
									for="">活動名稱: </label> <input type="text" name="activityname" value="${userActivity.activityname}">
							</div>


							<div>
								<select name="type" class="form-select form-select-sm"
									aria-label=".form-select-sm example" value="${userActivity.type}">
									<option selected value="${userActivity.type}">活動類型</option>
									<option value="約會">約會</option>
									<option value="旅遊">旅遊</option>
									<option value="體能">體能</option>
									<option value="收藏">收藏</option>
									<option value="娛樂">娛樂</option>
									<option value="創作">創作</option>
									<option value="社會服務">社會服務</option>
									<option value="栽培飼養">栽培飼養</option>
								</select>
							</div>
							<div>
								<!-- yyyy-mm-dd  -->
								<label class="" for="">活動日期:</label> <input type="date"
									name="time" id="time" value="${userActivity.time}">
							</div>
							<div>
								<!-- yyyy-mm-dd  -->
								<label class="" for="">截止日期:</label> <input
									type="date" name="time_up" id="time_up" value="${userActivity.time_up}">
							</div>

							<div>
								<label for="comment1" class="">活動內容:</label>
								<textarea name="detail" id="plan" cols="40" rows="5" value="" style=" resize: none;">${userActivity.detail}</textarea>
							</div>

							<div>
								<!-- 縣市 區域 跟 完整地址 -->
								<label for="">活動地點:</label> <span id="twzipcode"></span><input
									type="text" name="place" value="${userActivity.place}">
							</div>

							<div>
								<label>活動須知</label> <input type="text" name="condition" value="${userActivity.condition}">
								<br> <label for="">男生人數:</label> <input type="number"
									name="man" id="numberInput" min="0" max="20" step="1"
									onchange="numberChange()" value="${userActivity.man}"> <label for=""> 女生人數:</label>
								<input type="number" name="woman" id="numberInput" min="0"
									max="20" step="1" onchange="numberChange()" value="${userActivity.woman}">
							</div>
							<div>
								<button type="submit" class="btn btn-primary btn-sm">修改活動</button>
								<button type="reset" class="btn btn-secondary btn-sm" style="margin-right:100px">清除資料</button>
							</div>
						</div>
					</form>
					
				</div>
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
