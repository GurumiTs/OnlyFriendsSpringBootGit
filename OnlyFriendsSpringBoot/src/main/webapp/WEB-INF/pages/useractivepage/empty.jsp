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

        <!-- Main Content  -->
        <div class="main-content" >
        <h3>活 動 創 辦 中~</h3>
				<div class="col-12 col-md-12 col-lg-5" style="background-color:White;border-radius:10px;">
					<form action="userInsertActivity.controller" method="post"
						enctype="multipart/form-data">
						<div class="st1">
							<div class="">
								<img id="output" src="images\partyPic\party1.jpg" alt=""
									style="width:460px;height:400px; border-radius:10px; margin:10px"><br>

							</div>
							<div>
								<label class="form-label" for="">封面照片</label><span id="sp_cover"></span>
								<input name="cover" class="form-control" type="file" id="cover"
									multiple onchange="lovdFile(event)">

							</div>
							<div>
							  <label for="">活動名稱: </label>
							  <input type="text" name="Activityname" id="Activityname">
							</div>


							<div>
								<select name="type" id="type" class="form-select form-select-sm"
									aria-label=".form-select-sm example">
									<option selected id="type">活動類型</option>
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
								<label class="" for="">活動日期:</label>
								 <input type="date"	name="time" id="time">
							</div>
							<div>
								<!-- yyyy-mm-dd  -->
								<label class="" for="">截止日期:</label> <input
									type="date" name="time_up" id="time_up">
							</div>

							<div>
								<label for="comment1" class="">活動內容:</label>
								<textarea name="Detail" id="Detail" cols="40" rows="5" value="" style=" resize: none;"></textarea>
							</div>

							<div>
								<!-- 縣市 區域 跟 完整地址 -->
								<label for="">活動地點:</label> <span id="twzipcode"></span><input
									type="text" name="place" id="place">
							</div>

							<div>
								<label>活動須知:</label> <input type="text" name="condition" id="condition">
								<br> 
								<label for="">男生人數:</label> 
								<input type="number" name="man" id="man" min="0" max="20" step="1"	onchange="numberChange()">
								<label for="">女生人數:</label>
								<input type="number" name="woman" id="woman" min="0" max="20" step="1" onchange="numberChange()">
							</div>
							<div>
								<button type="submit" class="btn btn-primary btn-md">創建活動</button>
								<button type="reset" class="btn btn-secondary btn-md" style="margin-right:100px">清除資料</button>
								<button type="button" id="activity" class="btn btn-success" style="margin-right:100px">一拳超人</button>
								
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
	document.getElementById("cover").addEventListener("blur",
			checkcover);

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
   
	//一建輸入

	$(function(){		
		
	$("#activity").click(function(){
		$("#Activityname").val("打球");
		$("#type").val("體能");
		$("#time").val("2021-08-28");
		$("#time_up").val("2021-08-27");
		$("#Detail").val("跟第四組成員廝殺羽毛球");
		
		$("#twzipcode").twzipcode("set", {
			county : "桃園市",
			district : "中壢區",
		});
		
		$("#place").val("中央大學依仁堂");
		$("#condition").val("需要學員證+口罩+自備球拍");
		$("#man").val("2");
		$("#woman").val("2");
		
	});
	
	});
	
    </script>
  </body>
</html>       