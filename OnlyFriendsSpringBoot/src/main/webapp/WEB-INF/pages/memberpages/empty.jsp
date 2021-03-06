<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
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
              <h1>Account</h1>
            </div>
<!-- Main Content -->
			<div class="main-content">
				<div class="col-12 col-md-12 col-lg-5" style="background-color:White;border-radius:10px;">
					<form action="userInsertActivity.controller" method="post"
						enctype="multipart/form-data">
						<div class="st1">
							<div class="">
								<img id="output" src="images\partyPic\party1.jpg" alt=""
									style="width: 600px; height: 450px; border-radius:10px; margin:10px"><br>

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
								<textarea name="Detail" id="plan" cols="40" rows="5" value="" style=" resize: none;"></textarea>
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
									onchange="numberChange()"> <label for=""> 女生人數:</label>
								<input type="number" name="woman" id="numberInput" min="0"
									max="12" step="1" onchange="numberChange()">
							</div>
							<div>
								<button type="submit" class="btn btn-primary btn-sm">創建活動</button>
								<button type="reset" class="btn btn-secondary btn-sm" style="margin-right:100px">清除資料</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- main content -->
            
              
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
    
    
    <script >  
   
   
    </script>
  </body>
</html>       