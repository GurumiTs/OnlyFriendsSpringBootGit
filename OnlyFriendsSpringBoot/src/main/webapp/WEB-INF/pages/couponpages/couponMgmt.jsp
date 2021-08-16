<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<title>Coupon</title>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
#mainImg {
	width: 90%;
	height: 100px;
	margin-left: 16px;
}

.card-header {
	text-align: center;
}

#ul {
	width: 110%;
	font-size: 14px;
}

card-body.img {
	margin-left: auto;
	margin-right: auto;
}

img.error {
	width: 20px;
	height: 20px;
}

.ok {
	width: 20px;
	height: 20px;
}

#main {
	display: flex;
	width: 100%;
}

#left {
	width: 49%;
	margin-right: 40px;
}

#right {
	width: 51%;
}

#imgInsert {
	margin-top: 72.19px;
}

input[type=text], [type=date], #caNameInsert, #caNameUpdate {
	width: 70%;
	box-sizing: border-box;
	border: 3px solid #555;
}

.line {
	display: flex;
	margin-bottom: -10px;
}

span {
	width: 45%;
	font-size: 50%;
}

.formName {
	margin-bottom: -10px;
}

#deleteForm {
	width: 50%;
	margin: 0 auto;
}

.lineDelete {
	margin-bottom: -10px;
}

#pNameUpdate {
	width: 50%;
	margin: -10px auto -35px auto;
}

.fileplus {
	width: 30%;
}
</style>
</head>
<body>
	<%@include file="../commonpages/dashboardtop.jsp"%>

	<div id="wrapper">
		<%@include file="../commonpages/dashboardsidebar.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<%@include file="../commonpages/dashboardheader.jsp"%>

			<nav class="navbar navbar-expand-lg navbar-dark bg-light">
				<a class="navbar-brand" href="#"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarColor01" aria-controls="navbarColor01"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarColor01">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a id="Home" class="nav-link"
							href="#" data-bs-target="#FindAllCo"
							style="color: cornflowerblue;">Coupon<span class="sr-only">(current)</span></a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							data-bs-toggle="modal" data-bs-target="#add"
							style="color: cornflowerblue;">新增</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							data-bs-toggle="modal" data-bs-target="#update"
							style="color: cornflowerblue;">修改</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							data-bs-toggle="modal" data-bs-target="#delete"
							style="color: cornflowerblue;">刪除</a></li>
					</ul>
					<select id="select" name="number" style="margin-right: 1%;">
						<option id="all" value="1">名稱</option>
						<option id="caName" value="2">分類</option>
					</select>

					<form id="Search" action="getByLike.controller" method="post"
						class="form-inline my-2 my-lg-0">
						<div style="display: flex; margin-right: 10%">
							<input name="queryVal" class="form-control mr-sm-2" type="text"
								placeholder="Search">
							<button class="btn btn-secondary" type="submit">Search</button>
						</div>
					</form>
				</div>
			</nav>

			<!-- <main class="page-content"> -->

			<!-- Bar以下畫面------------------------------------------------------------------------------ -->

			<section style="margin-top: 3%;">
				<div class="container">
					<div class="row">
						<c:forEach items="${find}" var="find" varStatus="status">
							<div class="col-md-4 col-sm-6">
								<div class="card border-primary mb-3"
									style="max-width: 20rem; max-height: 50rem;">
									<div class="card-header">${find.coName}</div>
									<div class="card-body">
										<img src="${find.pImg}" id="mainImg" />
										<ul id="ul">
											<li>優惠券名稱:${find.pName}</li>
											<li>價格:$${find.price}</li>
											<li>庫存量:${find.pQty}</li>
											<li>優惠起始日:${find.startDate}</li>
											<li>優惠截止日:${find.endDate}</li>
											<li>分類名稱:${find.caName}</li>
										</ul>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<%@include file="../commonpages/dashboardfooter1.jsp"%>
					<%@include file="../commonpages/dashboardlogoutmodal.jsp"%>
					<%@include file="../commonpages/dashboardbottom.jsp"%>
				</div>
			</section>
		</div>



		<!-- 功能區(以上是Bar下面的畫面)-------------------------------------------------------------------------------------------- -->

		<!-- 載入顯示-------------------------------------------------------------------------------------------- -->


		<!-- 全部顯示-------------------------------------------------------------------------------------------- -->
		<form action="getAllCoupon.controller" id="FindAllCo"></form>

		<script>
			document.getElementById("Home").onclick = Findall;

			function Findall() {
				document.getElementById("FindAllCo").submit();

			}
		</script>

		<!-- 分類顯示-------------------------------------------------------------------------------------------- -->

		<script>
			document.getElementById("select").onclick = checkSelect;
			function checkSelect() {
				var selectObj = document.getElementById("select").value;

				if (selectObj == 1) {
					document.getElementById("Search").action = "getByLike.controller";
				} else {
					document.getElementById("Search").action = "getByCaName.controller";
				}
			}
		</script>




		<!-- 新增Modal ----------------------------------------------------------------------------- -->
		<div class="modal fade" id="add" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content modal-dialog-scrollable"
					style="width: 650px; margin: 50px auto;">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">
							新增 <img src='images/couponPic/fileplus.JPG' class="fileplus">
						</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form class="container" action="insertCoupon.controller"
							method="post" enctype="multipart/form-data">
							<div id="main">
								<div id="left">
									<img id="imgInsert" name="img" src="images/couponPic/pic.JPG"
										style="width: 100%; height: 50%;"><br> <input
										type="file" name="pImg" accept="image/*"
										onchange="loadFile(event)" required><span
										id="spImgInsert"></span>
								</div>
								<script>
									var loadFile = function(event) {
										var output = document
												.getElementById('imgInsert');
										output.src = URL
												.createObjectURL(event.target.files[0]);
										output.onload = function() {
											URL.revokeObjectURL(output.src)
										}
									};
								</script>
								<div id="right">
									<label for="coName" class="formName">廠商名稱</label>
									<div class="line">
										<input placeholder="請輸入廠商名稱" type="text" name="coName"
											id="coNameInsert" required><span id="spCoNameInsert"></span>
									</div>
									<br> <label for="caName" class="formName">分類名稱</label>
									<div class="line">
										<select name="caName" id="caNameInsert" required>
											<option value="">請選擇</option>
											<option value="餐廳">餐廳</option>
											<option value="旅遊">旅遊</option>
											<option value="服裝">服裝</option>
											<option value="運動">運動</option>
										</select><span id="spCaNameInsert"></span>
									</div>
									<br> <label for="pName" class="formName">優惠券名稱</label>
									<div class="line">
										<input placeholder="請輸入優惠券名稱" type="text" name="pName"
											id="pNameInsert" required><span id="spPNameInsert"></span>
									</div>
									<br> <label for="price" class="formName">優惠券價格</label>
									<div class="line">
										<input placeholder="請輸入優惠券價格" type="text" name="price"
											id="priceInsert" required><span id="spPriceInsert"></span>
									</div>
									<br> <label for="pQty" class="formName">庫存量</label>
									<div class="line">
										<input placeholder="請輸入庫存量" type="text" id="pQtyInsert"
											name="pQty" required><span id="spPQtyInsert"></span>
									</div>
									<br> <label for="startDate" class="formName">優惠起初日</label>
									<div class="line">
										<input type="date" name="startDate" id="startDateInsert"
											required><span id="spStartDateInsert"></span>
									</div>
									<br> <label for="endDate" class="formName">優惠截止日</label>
									<div class="line">
										<input type="date" name="endDate" id="endDateInsert" required><span
											id="spEndDateInsert"></span>
									</div>
									<br>

								</div>
							</div>
							<br>
							<div class="modal-footer">
								<input type="submit" class="btn btn-primary" value="送出">
								<input type="reset" class="btn btn-secondary" value="清除">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script>
			document.getElementById("caNameInsert").onblur = checkCaName;
			document.getElementById("coNameInsert").onblur = checkCoName;
			document.getElementById("pNameInsert").onblur = checkPName;
			document.getElementById("priceInsert").onblur = checkPrice;
			document.getElementById("pQtyInsert").onblur = checkPQty;
			document.getElementById("startDateInsert").onblur = checkStartDate;
			document.getElementById("endDateInsert").onblur = checkEndDate;

			function checkCaName() {
				let caNameObj = document.getElementById("caNameInsert");
				let caNameObjVal = caNameObj.value;

				let sp7 = document.getElementById("spCaNameInsert");
				if (caNameObjVal == "") {
					sp7.innerHTML = "<img src='images/couponPic/error.png' class='error'>不可空白";
				} else {
					sp7.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				}
			}

			function checkCoName() {
				let coNameObj = document.getElementById("coNameInsert");
				let coNameObjVal = coNameObj.value;

				let sp1 = document.getElementById("spCoNameInsert");

				if (coNameObjVal == "") {
					sp1.innerHTML = "<img src='images/couponPic/error.png' class='error'>不可空白";
				} else {
					sp1.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				}
			}

			function checkPName() {
				let pNameObj = document.getElementById("pNameInsert");
				let pNameObjVal = pNameObj.value;
				let sp2 = document.getElementById("spPNameInsert");

				if (pNameObjVal == "") {
					sp2.innerHTML = "<img src='images/couponPic/error.png' class='error'>不可空白";
				} else {
					sp2.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				}
			}

			function checkPrice() {
				let priceObj = document.getElementById("priceInsert");
				let priceObjVal = priceObj.value;

				let sp3 = document.getElementById("spPriceInsert");
				re1 = /^[0-9]*$/;

				if (priceObjVal == "") {
					sp3.innerHTML = "<img src='images/couponPic/error.png' class='error'>不可空白";
				} else if (re1.test(priceObjVal)) {
					if (priceObjVal >= 0 && priceObjVal <= 1000000) {
						sp3.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
					} else {
						sp3.innerHTML = "<img src='images/couponPic/error.png' class='error'>價錢過高";
					}
				} else {
					sp3.innerHTML = "<img src='images/couponPic/error.png' class='error'>請輸入";
				}
			}

			function checkPQty() {
				let pQtyObj = document.getElementById("pQtyInsert");
				let pQtyObjVal = pQtyObj.value;
				let sp4 = document.getElementById("spPQtyInsert");
				re2 = /^[0-9]*$/;

				if (pQtyObjVal == "") {
					sp4.innerHTML = "<img src='images/couponPic/error.png' class='error'>不可空白";
				} else if (re2.test(pQtyObjVal)) {
					if (pQtyObjVal >= 0 && pQtyObjVal <= 50) {
						sp4.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
					} else {
						sp4.innerHTML = "<img src='images/couponPic/error.png' class='error'>庫存量應低於(含)50筆";
					}
				} else {
					sp4.innerHTML = "<img src='images/couponPic/error.png' class='error'>請輸入";
				}
			}

			function checkStartDate() {
				let startDateObj = document.getElementById("startDateInsert");
				let startDateObjVal = startDateObj.value;
				let sp5 = document.getElementById("spStartDateInsert");

				d = new Date(startDateObjVal);
				let theYear = d.getFullYear();
				let theMonth = d.getMonth() + 1;
				let theDate = d.getDate();
				let today = new Date();
				let theYear1 = today.getFullYear();
				let theMonth1 = today.getMonth() + 1;
				let theDate1 = today.getDate();
				if (startDateObjVal == "") {
					sp5.innerHTML = "<img src='images/couponPic/error.png' class='error'>不可空白";
				} else if (theYear == theYear1 && theMonth == theMonth1
						&& theDate >= theDate1 || theYear == theYear1
						&& theMonth > theMonth1 || theYear > theYear1) {
					sp5.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				} else {
					sp5.innerHTML = "<img src='images/couponPic/error.png' class='error'>請輸入";
				}
			}

			function checkEndDate() {
				let endDateObj = document.getElementById("endDateInsert");
				let endDateObjVal = endDateObj.value;
				let sp6 = document.getElementById("spEndDateInsert");

				var std = document.getElementById("startDateInsert").value
				let d1 = std.split("-");

				d = new Date(endDateObjVal);
				let theYear1 = d.getFullYear();
				let theMonth1 = d.getMonth() + 1;
				let theDate1 = d.getDate();

				if (endDateObjVal == "") {
					sp6.innerHTML = "<img src='images/couponPic/error.png' class='error'>不可空白";

				} else if (d1[0] == theYear1 && d1[1] == theMonth1
						&& d1[2] <= theDate1 || d1[0] == theYear1
						&& d1[1] < theMonth1 || d1[0] < theYear1) {
					sp6.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				} else {
					sp6.innerHTML = "<img src='images/couponPic/error.png' class='error'>請輸入";
				}
			}
		</script>
		<!-- 新增區域!!------------------------------------------------------------------------- -->

		<!-- 修改Modal ----------------------------------------------------------------------------->
		<div class="modal fade" id="update" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content modal-dialog-scrollable"
					style="width: 650px; margin: 50px auto;">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">
							修改 <img src='images/couponPic/fileplus.JPG' class="fileplus">
						</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
							<div>
								<label for="pName" style="font-weight: bold; font-size: 18px">請輸入欲變更優惠券名稱
								</label> <input placeholder="請輸入優惠券名稱" type="text" name="pName"
									id="pNameUpdate" required><button id="loadbutton">load</button><span id="spPNameUpdate"></span><br>
							</div>
							<hr>
							<form class="container" class="box"
							action="updateCoupon.controller" method="post"
							enctype="multipart/form-data">
							<div id="main">
								<div id="feedback"></div>
								<div id="left">
									<h6 style="font-weight: bold; font-size: 18px">以下請輸入待修改的優惠券項目:</h6>
									<br> <img id="up" name="img"
										src="images/couponPic/pic.JPG"
										style="width: 100%; height: 50%;"><br> <input
										type="file" name="pImg" accept="image/*"
										onchange="loadFile2(event)" required><span
										id="spImgInsert"></span>
								</div>
								<script>
									var loadFile2 = function(event) {
										var output2 = document
												.getElementById('up');
										output2.src = URL
												.createObjectURL(event.target.files[0]);
										output2.onload = function() {
											URL.revokeObjectURL(output.src)
										}
									};
								</script>
								<div id="right">
								    <label for="pName" class="formName">優惠券名稱</label>
									<div class="line">
										<input placeholder="請輸入優惠券名稱" type="text" name="pName"
											id="pNameUpdate2" required><span id="spPNameInsert"></span>
									</div>
									<br><label for="coName">廠商名稱</label>
									<div class="line">
										<input placeholder="請輸入廠商名稱" type="text" name="coName"
											id="coNameUpdate" required><span id="spCoNameUpdate"></span>
									</div>
									<br> <label for="caName">分類名稱</label>
									<div class="line">
										<select name="caName" id="caNameUpdate" required>
											<option value="">請選擇</option>
											<option value="餐廳">餐廳</option>
											<option value="旅遊">旅遊</option>
											<option value="服裝">服裝</option>
											<option value="運動">運動</option>
										</select><span id="spCaNameUpdate"></span>
									</div>
									<br> <label for="price">優惠券價格</label>
									<div class="line">
										<input placeholder="請輸入優惠券價格" type="text" name="price"
											id="priceUpdate" required><span id="spPriceUpdate"></span>
									</div>
									<br> <label for="pQty">庫存量</label>
									<div class="line">
										<input placeholder="請輸入庫存量" type="text" id="pQtyUpdate"
											name="pQty" required><span id="spPQtyUpdate"></span>
									</div>
									<br> <label for="startDate">優惠起初日</label>
									<div class="line">
										<input type="date" name="startDate" id="startDateUpdate" 
											required><span id="spStartDateUpdate"></span>
									</div>
									<br> <label for="endDate">優惠截止日</label>
									<div class="line">
										<input type="date" name="endDate" id="endDateUpdate" required ><span
											id="spEndDateUpdate"></span>
									</div>
									<br>

								</div>
							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-primary" value="送出">
								<input type="reset" class="btn btn-secondary" value="清除">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script>
		                  
		                	   $('#loadbutton').click(function () {
									
									var pName = $('#pNameUpdate').val();
									
									$.ajax({
										type:'POST',
										url:'getAllCouponToJson.controller',
										data:{"pName":pName},
										dataType:'json',
										success:function(data){ 
											$('#up').attr("src",data.pImg);
											$('#pNameUpdate2').val(data.pName);
											$('#coNameUpdate').val(data.coName);
											$('#caNameUpdate').val(data.caName);
											$('#priceUpdate').val(data.price);
											$('#pQtyUpdate').val(data.pQty);
											$('#startDateUpdate').val(data.startDate);
											$('#endDateUpdate').val(data.endDate);	 
											
										},error:function(data) 
								        {
									         alert('無此優惠券名稱');
									        }
								   
									})
								});
		                	   
		                	   
		                	   
		                   
							

						</script>
		<script>
			document.getElementById("caNameUpdate").onblur = checkcaNameUpdate;
			document.getElementById("coNameUpdate").onblur = checkCoNameUpdate;
			document.getElementById("pNameUpdate").onblur = checkPNameUpdate;
			document.getElementById("priceUpdate").onblur = checkPriceUpdate;
			document.getElementById("pQtyUpdate").onblur = checkPQtyUpdate;
			document.getElementById("startDateUpdate").onblur = checkStartDateUpdate;
			document.getElementById("endDateUpdate").onblur = checkEndDateUpdate;

			function checkcaNameUpdate() {
				let caNameObj = document.getElementById("caNameUpdate");
				let caNameObjVal = caNameObj.value;

				let sp7 = document.getElementById("spCaNameUpdate");
				if (caNameObjVal == "") {
					sp7.innerHTML = "<img src='images/couponPic/error.png' class='error'>不可空白";
				} else {
					sp7.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				}
			}

			function checkCoNameUpdate() {
				let coNameObj = document.getElementById("coNameUpdate");
				let coNameObjVal = coNameObj.value;

				let sp1 = document.getElementById("spCoNameUpdate");

				if (coNameObjVal == "") {
					sp1.innerHTML = "<img src='images/couponPic/error.png' class='error'>不可空白";
				} else {
					sp1.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				}
			}

			function checkPNameUpdate() {
				let pNameObj = document.getElementById("pNameUpdate");
				let pNameObjVal = pNameObj.value;
				let sp2 = document.getElementById("spPNameUpdate");

				if (pNameObjVal == "") {
					sp2.innerHTML = "<img src='images/couponPic/error.png' class='error'>不可空白";
				} else {
					sp2.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				}
			}

			function checkPriceUpdate() {
				let priceObj = document.getElementById("priceUpdate");
				let priceObjVal = priceObj.value;

				let sp3 = document.getElementById("spPriceUpdate");
				re1 = /^[0-9]*$/;

				if (priceObjVal == "") {
					sp3.innerHTML = "<img src='images/couponPic/error.png' class='error'>不可空白";
				} else if (re1.test(priceObjVal)) {
					if (priceObjVal >= 0 && priceObjVal <= 1000000) {
						sp3.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
					} else {
						sp3.innerHTML = "<img src='images/couponPic/error.png' class='error'>價錢過高";
					}
				} else {
					sp3.innerHTML = "<img src='images/couponPic/error.png' class='error'>請輸入";
				}
			}

			function checkPQtyUpdate() {
				let pQtyObj = document.getElementById("pQtyUpdate");
				let pQtyObjVal = pQtyObj.value;
				let sp4 = document.getElementById("spPQtyUpdate");
				re2 = /^[0-9]*$/;

				if (pQtyObjVal == "") {
					sp4.innerHTML = "<img src='images/couponPic/error.png' class='error'>不可空白";
				} else if (re2.test(pQtyObjVal)) {
					if (pQtyObjVal >= 0 && pQtyObjVal <= 50) {
						sp4.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
					} else {
						sp4.innerHTML = "<img src='images/couponPic/error.png' class='error'>庫存量應低於(含)50筆";
					}
				} else {
					sp4.innerHTML = "<img src='images/couponPic/error.png' class='error'>請輸入";
				}
			}

			function checkStartDateUpdate() {
				let startDatObj = document.getElementById("startDateUpdate");
				let startDateObjVal = startDatObj.value;
				let sp5 = document.getElementById("spStartDateUpdate");

				d = new Date(startDateObjVal);
				let theYear = d.getFullYear();
				let theMonth = d.getMonth() + 1;
				let theDate = d.getDate();
				let today = new Date();
				let theYear1 = today.getFullYear();
				let theMonth1 = today.getMonth() + 1;
				let theDate1 = today.getDate();
				if (startDateObjVal == "") {
					sp5.innerHTML = "<img src='images/couponPic/error.png' class='error'>不可空白";
				} else if (theYear == theYear1 && theMonth == theMonth1
						&& theDate >= theDate1 || theYear == theYear1
						&& theMonth > theMonth1 || theYear > theYear1) {
					sp5.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				} else {
					sp5.innerHTML = "<img src='images/couponPic/error.png' class='error'>請輸入";
				}
			}

			function checkEndDateUpdate() {
				let endDateObj = document.getElementById("endDateUpdate");
				let endDateObjVal = endDateObj.value;
				let sp6 = document.getElementById("spEndDateUpdate");

				var std = document.getElementById("startDateUpdate").value
				let d1 = std.split("-");

				d = new Date(endDateObjVal);
				let theYear1 = d.getFullYear();
				let theMonth1 = d.getMonth() + 1;
				let theDate1 = d.getDate();

				if (endDateObjVal == "") {
					sp6.innerHTML = "<img src='images/couponPic/error.png' class='error'>不可空白";

				} else if (d1[0] == theYear1 && d1[1] == theMonth1
						&& d1[2] <= theDate1 || d1[0] == theYear1
						&& d1[1] < theMonth1 || d1[0] < theYear1) {
					sp6.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				} else {
					sp6.innerHTML = "<img src='images/couponPic/error.png' class='error'>請輸入";
				}
			}
		</script>
		<!-- 修改區域!!------------------------------------------------------------------------- -->

		<!-- 刪除Modal ----------------------------------------------------------------------------->
		<div class="modal fade" id="delete" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog ">
				<div class="modal-content" style="width: 650px; margin: 50px auto;">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">
							刪除 <i class="fas fa-trash-alt"></i>
						</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form action="deleteCoupon.controller" method="post">
						<div class="modal-body" id="deleteForm">
							<label for="pName" class="lineDelete">優惠券名稱</label><br> <input
								placeholder="請輸入要刪除的優惠券名稱" type="text" id="pNameDelete"
								name="pName" required><span id="spPNameDelete"></span>
						</div>
						<div class="modal-footer">
							<input type="submit" class="btn btn-primary" value="確認">
							<input type="reset" class="btn btn-secondary" value="清除">
						</div>
					</form>
				</div>
			</div>
		</div>
		<script>
			document.getElementById("pNameDelete").onblur = checkpNameDelet;
			function checkpNameDelet() {
				let pNameObj = document.getElementById("pNameDelete");
				let pNameObjVal = pNameObj.value;
				let sp2 = document.getElementById("spPNameDelete");

				if (pNameObjVal == "") {
					sp2.innerHTML = "<img src='images/couponPic/error.png' class='error'>不可空白";
				} else {
					sp2.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				}
			}
		</script>
		<!-- 刪除區域!!------------------------------------------------------------------------- -->
		<!-- page-content" -->
	</div>
	<!-- page-wrapper -->
</body>
</html>