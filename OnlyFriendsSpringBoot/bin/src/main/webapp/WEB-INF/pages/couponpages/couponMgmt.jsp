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
	overflow:hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
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
#top {width: 60%;
	margin: -60px auto 5px auto;}
		
#top2 {
	width: 60%;
	margin: -0px auto 5px auto;
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

input[type=text], [type=date], #caNameInsert, #caNameUpdate, textarea {
	width: 100%;
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
	border: green 1px solid;
}


.fileplus {
	width: 30%;
}

#loadImg{
   width: 5%;
}

.textarea{resize: none;}

#couponDetail{float:right;
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
							style="color: cornflowerblue;">??????</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							data-bs-toggle="modal" data-bs-target="#update"
							style="color: cornflowerblue;">??????</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							data-bs-toggle="modal" data-bs-target="#delete"
							style="color: cornflowerblue;">??????</a></li>
					</ul>
					<select id="select" name="number" style="margin-right: 1%;">
						<option id="all" value="1">??????</option>
						<option id="category" value="2">??????</option>
					</select>

					<form id="Search" action="empgetByLike.controller" method="post"
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

			<!-- Bar????????????------------------------------------------------------------------------------ -->

			<section style="margin-top: 3%;">
				<div class="container">
					<div class="row">
						<c:forEach items="${find}" var="find" varStatus="status">
							<div class="col-md-4 col-sm-6">
								<div class="card border-primary mb-3"
									style="max-width: 20rem; max-height: 50rem;">
									<div class="card-header">${find.companyName} 
									<a href="couponDetailEntry.controller?couponImg=${find.couponId}&couponName=${find.couponName}"><i class="fas fa-search" style="font-size: 1.5em;" id="couponDetail"></i></a>
									</div>
									<div class="card-body">
										<img src="${find.couponImg}" id="mainImg" />
										<ul id="ul">
										    <li>???????????????:${find.couponId}</li>
											<li>???????????????:${find.couponName}</li>
											<li>??????:${find.couponPrice}</li>
											<li>?????????:${find.couponQty}</li>
											<li>???????????????:${find.couponStartDate}</li>
											<li>???????????????:${find.couponEndDate}</li>
											<li>????????????:${find.category}</li>
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



		<!-- ?????????(?????????Bar???????????????)-------------------------------------------------------------------------------------------- -->

		<!-- ????????????-------------------------------------------------------------------------------------------- -->
     
		<!-- ????????????-------------------------------------------------------------------------------------------- -->
		<form action="empgetAllCoupon.controller" id="FindAllCo"></form>

		<script>
			document.getElementById("Home").onclick = Findall;

			function Findall() {
				document.getElementById("FindAllCo").submit();

			}
		</script>

		<!-- ????????????-------------------------------------------------------------------------------------------- -->

		<script>
			document.getElementById("select").onclick = checkSelect;
			function checkSelect() {
				var selectObj = document.getElementById("select").value;

				if (selectObj == 1) {
					document.getElementById("Search").action = "empgetByLike.controller";
				} else {
					document.getElementById("Search").action = "empgetBycategoryName.controller";
				}
			}
		</script>




		<!-- ??????Modal ----------------------------------------------------------------------------- -->
		<div class="modal fade" id="add" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content modal-dialog-scrollable" style="width: 650px; margin: 50px auto;">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">
									?????? <img src='images/couponPic/fileplus.JPG' class="fileplus">
								</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form class="container" action="empinsertCoupon.controller" method="post"
									enctype="multipart/form-data">
									<div id="top">
										<img id="imgInsert" name="img" src="images/couponPic/pic.JPG"
											style="width: 100%; height: 50%;"><br> <input type="file" name="couponImg"
											accept="image/*" onchange="loadFile(event)" required><span
											id="spImgInsert"></span>
									</div>
									<script>
										var loadFile = function (event) {
											var output = document
												.getElementById('imgInsert');
											output.src = URL
												.createObjectURL(event.target.files[0]);
											output.onload = function () {
												URL.revokeObjectURL(output.src)
											}
										};
									</script>
									<div id="main">
										<div id="right">
											<label for="companyName" class="formName">????????????</label>
											<div class="line">
												<input placeholder="?????????????????????" type="text" name="companyName" id="coNameInsert" required><span id="spCoNameInsert"></span>
											</div>
											<br> <label for="category" class="formName">????????????</label>
											<div class="line">
												<select name="category" id="caNameInsert" required>
													<option value="">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????-??????">?????????-??????</option>
													<option value="?????????-??????">?????????-??????</option>
													<option value="?????????-??????">?????????-??????</option>
													<option value="?????????-??????">?????????-??????</option>
												</select><span id="spCaNameInsert"></span>
											</div>
											<br> <label for="couponName" class="formName">???????????????</label>
											<div class="line">
												<input placeholder="????????????????????????" type="text" name="couponName" id="pNameInsert"
													required><span id="spPNameInsert"></span>
											</div>
											<br> <label for="couponPrice" class="formName">???????????????</label>
											<div class="line">
												<input placeholder="????????????????????????" type="text" name="couponPrice" id="priceInsert"
													required><span id="spPriceInsert"></span>
											</div>
											<br> <label for="couponQty" class="formName">?????????</label>
											<div class="line">
												<input placeholder="??????????????????" type="text" id="pQtyInsert" name="couponQty"
													required><span id="spPQtyInsert"></span>
											</div>
											<br> <label for="couponStartDate" class="formName">???????????????</label>
											<div class="line">
												<input type="date" name="couponStartDate" id="startDateInsert"><span
													id="spStartDateInsert"></span>
											</div>
											<br> <label for="couponEndDate" class="formName">???????????????</label>
											<div class="line">
												<input type="date" name="couponEndDate" id="endDateInsert"><span
													id="spEndDateInsert"></span>
											</div>
										</div>
									<div id="left">
											<label for="couponInfo" class="formName">???????????????</label>
											<div class="line">
												<textarea placeholder="????????????????????????" name="couponInfo" rows="8" cols="100"
													 class="textarea"></textarea>
											</div><br>
											<label for="couponUse" class="formName">?????????????????????</label>
											<div class="line">
												<textarea placeholder="??????????????????????????????" name="couponUse" rows="8"
													cols="100" class="textarea"></textarea>
											</div>
										</div>
										
										<br>

									</div>
									<br>
									<div class="modal-footer">
										<input type="submit" class="btn btn-primary" value="??????">
										<input type="reset" class="btn btn-secondary" value="??????">
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
					sp7.innerHTML = "<img src='images/couponPic/error.png' class='error'>????????????";
				} else {
					sp7.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				}
			}

			function checkCoName() {
				let coNameObj = document.getElementById("coNameInsert");
				let coNameObjVal = coNameObj.value;

				let sp1 = document.getElementById("spCoNameInsert");

				if (coNameObjVal == "") {
					sp1.innerHTML = "<img src='images/couponPic/error.png' class='error'>????????????";
				} else {
					sp1.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				}
			}

			function checkPName() {
				let pNameObj = document.getElementById("pNameInsert");
				let pNameObjVal = pNameObj.value;
				let sp2 = document.getElementById("spPNameInsert");

				if (pNameObjVal == "") {
					sp2.innerHTML = "<img src='images/couponPic/error.png' class='error'>????????????";
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
					sp3.innerHTML = "<img src='images/couponPic/error.png' class='error'>????????????";
				} else if (re1.test(priceObjVal)) {
					if (priceObjVal >= 0 && priceObjVal <= 1000000) {
						sp3.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
					} else {
						sp3.innerHTML = "<img src='images/couponPic/error.png' class='error'>????????????";
					}
				} else {
					sp3.innerHTML = "<img src='images/couponPic/error.png' class='error'>?????????";
				}
			}

			function checkPQty() {
				let pQtyObj = document.getElementById("pQtyInsert");
				let pQtyObjVal = pQtyObj.value;
				let sp4 = document.getElementById("spPQtyInsert");
				re2 = /^[0-9]*$/;

				if (pQtyObjVal == "") {
					sp4.innerHTML = "<img src='images/couponPic/error.png' class='error'>????????????";
				} else if (re2.test(pQtyObjVal)) {
					if (pQtyObjVal >= 0 && pQtyObjVal <= 9999999) {
						sp4.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
					} else {
						sp4.innerHTML = "<img src='images/couponPic/error.png' class='error'>??????????????????(???)9999999???";
					}
				} else {
					sp4.innerHTML = "<img src='images/couponPic/error.png' class='error'>?????????";
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
					sp5.innerHTML = "<img src='images/couponPic/error.png' class='error'>????????????";
				} else if (theYear == theYear1 && theMonth == theMonth1
						&& theDate >= theDate1 || theYear == theYear1
						&& theMonth > theMonth1 || theYear > theYear1) {
					sp5.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				} else {
					sp5.innerHTML = "<img src='images/couponPic/error.png' class='error'>?????????";
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
					sp6.innerHTML = "<img src='images/couponPic/error.png' class='error'>????????????";

				} else if (d1[0] == theYear1 && d1[1] == theMonth1
						&& d1[2] <= theDate1 || d1[0] == theYear1
						&& d1[1] < theMonth1 || d1[0] < theYear1) {
					sp6.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				} else {
					sp6.innerHTML = "<img src='images/couponPic/error.png' class='error'>?????????";
				}
			}
		</script>
		<!-- ????????????!!------------------------------------------------------------------------- -->

		<!-- ??????Modal ----------------------------------------------------------------------------->
		<div class="modal fade" id="update" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content modal-dialog-scrollable" style="width: 650px; margin: 50px auto;">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">
									?????? <img src='images/couponPic/fileplus.JPG' class="fileplus">
								</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div id="topUpdate">
									<label for="couponId" style="font-weight: bold; font-size: 18px">?????????????????????????????????
									</label> <input placeholder="?????????????????????" type="text" name="couponId" id="pNameUpdate"
										required><button id="loadbutton">load</button><img
										src="images/couponPic/loadImg.gif" id="loadImg"><br>
								</div>
								<hr>
								<form class="container" class="box" action="empupdateCoupon.controller" method="post"
									enctype="multipart/form-data">
										<h6 style="font-weight: bold; font-size: 18px">??????????????????????????????????????????:</h6>
									<div id="top2">
										<br> <img id="up" name="img" src="images/couponPic/pic.JPG"
											style="width: 100%; height: 50%;"><br> <input type="file" name="couponImg"
											accept="image/*" onchange="loadFile2(event)" required><span
											id="spImgInsert"></span>
									</div>
									<script>
										var loadFile2 = function (event) {
											var output2 = document
												.getElementById('up');
											output2.src = URL
												.createObjectURL(event.target.files[0]);
											output2.onload = function () {
												URL.revokeObjectURL(output.src)
											}
										};
									</script>
									<div id="main">
										<div id="right">
											<label for="couponName" class="formName">???????????????</label>
											<div class="line">
												<input placeholder="????????????????????????" type="text" name="couponName" id="pNameUpdate2"
												required><span id="spPNameInsert"></span>
											</div>
											<br><label for="companyName">????????????</label>
											<div class="line">
												<input placeholder="?????????????????????" type="text" name="companyName" id="coNameUpdate"
												required><span id="spCoNameUpdate"></span>
											</div>
											<br><label for="category">????????????</label>
											<div class="line">
												<select name="category" id="caNameUpdate" required>
													<option value="">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????-??????">?????????-??????</option>
													<option value="?????????-??????">?????????-??????</option>
													<option value="?????????-??????">?????????-??????</option>
													<option value="?????????-??????">?????????-??????</option>
												</select><span id="spCaNameUpdate"></span>
											</div>
											<br> <label for="couponPrice">???????????????</label>
											<div class="line">
												<input placeholder="????????????????????????" type="text" name="couponPrice" id="priceUpdate"
													required><span id="spPriceUpdate"></span>
											</div>
											<br> <label for="couponQty">?????????</label>
											<div class="line">
												<input placeholder="??????????????????" type="text" id="pQtyUpdate" name="couponQty"
												required><span id="spPQtyUpdate"></span>
											</div>
											<br> <label for="couponStartDate">???????????????</label>
											<div class="line">
												<input type="date" name="couponStartDate" id="startDateUpdate" required><span
												id="spStartDateUpdate"></span>
											</div>
											<br> <label for="couponEndDate">???????????????</label>
											<div class="line">
												<input type="date" name="couponEndDate" id="endDateUpdate" required><span
												id="spEndDateUpdate"></span>
											</div>
										</div>
											<div id="left">
											   <label for="couponId" class="formName">???????????????</label>
											<div class="line">
												<input placeholder="????????????????????????" type="text" name="couponId" id="couponId"
												required><span id=""></span>
											</div>
												<br><label for="couponInfo" class="formName">???????????????</label>
												<div class="line">
													<textarea placeholder="????????????????????????" name="couponInfo" rows="8" cols="100"
														class="textarea" id="couponInfoUpdate"></textarea>
												</div><br>
												<label for="couponUse" class="formName">?????????????????????</label>
												<div class="line">
													<textarea placeholder="??????????????????????????????" name="couponUse" rows="8" cols="100"
														class="textarea" id="couponUseUpdate"></textarea>
												</div>
											</div>
											
										</div>
<br>
											
									
									<div class="modal-footer">
										<input type="submit" class="btn btn-primary" value="??????">
										<input type="reset" class="btn btn-secondary" value="??????">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
		<script>
		                  $(function () {
		                	  
		                	  $('#loadImg').css("display","none");
		                	   
		                	  $('#loadbutton').click(function () {
	   
		                		   $('#loadImg').css("display","inline-block");
		                		   
									var couponId = $('#pNameUpdate').val();
									
									$.ajax({
										type:'POST',
										url:'getAllCouponToJson.controller',
										data:{"couponId":couponId},
										dataType:'json',
										
										success:function(data){ 
											$('#loadImg').css("display","none");
											
											$('#up').attr("src",data.couponImg);
											$('#pNameUpdate2').val(data.couponName);
											$('#coNameUpdate').val(data.companyName);
											$('#caNameUpdate').val(data.category);
											$('#priceUpdate').val(data.couponPrice);
											$('#pQtyUpdate').val(data.couponQty);
											$('#startDateUpdate').val(data.couponStartDate);
											$('#endDateUpdate').val(data.couponEndDate);
											$('#couponInfoUpdate').val(data.couponInfo);	
											$('#couponUseUpdate').val(data.couponUse);	
											$('#couponId').val(data.couponId);
											
										},error:function(data) 
								        {
											$('#loadImg').css("display","none");
									         alert('?????????????????????');
									        }
								   
									})
											$('#spPNameUpdate').style.display="none";
								});
		                	   
		                	   
		                	   
		                   
		                  })

						</script>
		<script>
			document.getElementById("caNameUpdate").onblur = checkcaNameUpdate;
			document.getElementById("coNameUpdate").onblur = checkCoNameUpdate;
			document.getElementById("priceUpdate").onblur = checkPriceUpdate;
			document.getElementById("pQtyUpdate").onblur = checkPQtyUpdate;
			document.getElementById("startDateUpdate").onblur = checkStartDateUpdate;
			document.getElementById("endDateUpdate").onblur = checkEndDateUpdate;

			function checkcaNameUpdate() {
				let caNameObj = document.getElementById("caNameUpdate");
				let caNameObjVal = caNameObj.value;

				let sp7 = document.getElementById("spCaNameUpdate");
				if (caNameObjVal == "") {
					sp7.innerHTML = "<img src='images/couponPic/error.png' class='error'>????????????";
				} else {
					sp7.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				}
			}

			function checkCoNameUpdate() {
				let coNameObj = document.getElementById("coNameUpdate");
				let coNameObjVal = coNameObj.value;

				let sp1 = document.getElementById("spCoNameUpdate");

				if (coNameObjVal == "") {
					sp1.innerHTML = "<img src='images/couponPic/error.png' class='error'>????????????";
				} else {
					sp1.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				}
			}

			function checkPriceUpdate() {
				let priceObj = document.getElementById("priceUpdate");
				let priceObjVal = priceObj.value;

				let sp3 = document.getElementById("spPriceUpdate");
				re1 = /^[0-9]*$/;

				if (priceObjVal == "") {
					sp3.innerHTML = "<img src='images/couponPic/error.png' class='error'>????????????";
				} else if (re1.test(priceObjVal)) {
					if (priceObjVal >= 0 && priceObjVal <= 1000000) {
						sp3.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
					} else {
						sp3.innerHTML = "<img src='images/couponPic/error.png' class='error'>????????????";
					}
				} else {
					sp3.innerHTML = "<img src='images/couponPic/error.png' class='error'>?????????";
				}
			}

			function checkPQtyUpdate() {
				let pQtyObj = document.getElementById("pQtyUpdate");
				let pQtyObjVal = pQtyObj.value;
				let sp4 = document.getElementById("spPQtyUpdate");
				re2 = /^[0-9]*$/;

				if (pQtyObjVal == "") {
					sp4.innerHTML = "<img src='images/couponPic/error.png' class='error'>????????????";
				} else if (re2.test(pQtyObjVal)) {
					if (pQtyObjVal >= 0 && pQtyObjVal <= 50) {
						sp4.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
					} else {
						sp4.innerHTML = "<img src='images/couponPic/error.png' class='error'>??????????????????(???)50???";
					}
				} else {
					sp4.innerHTML = "<img src='images/couponPic/error.png' class='error'>?????????";
				}
			}

			
			}
		</script>
		<!-- ????????????!!------------------------------------------------------------------------- -->

		<!-- ??????Modal ----------------------------------------------------------------------------->
		<div class="modal fade" id="delete" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog ">
				<div class="modal-content" style="width: 650px; margin: 50px auto;">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">
							?????? <i class="fas fa-trash-alt"></i>
						</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form action="empdeleteCoupon.controller" method="post">
						<div class="modal-body" id="deleteForm">
							<label for="couponId" class="lineDelete">???????????????</label><br> <input
								placeholder="????????????????????????????????????" type="text" id="pNameDelete"
								name="couponId" required><span id="spPNameDelete"></span>
						</div>
						<div class="modal-footer">
							<input type="submit" class="btn btn-primary" value="??????">
							<input type="reset" class="btn btn-secondary" value="??????">
						</div>
					</form>
				</div>
			</div>
		</div>
	<!--  	<script>
			document.getElementById("pNameDelete").onblur = checkpNameDelet;
			function checkpNameDelet() {
				let pNameObj = document.getElementById("pNameDelete");
				let pNameObjVal = pNameObj.value;
				let sp2 = document.getElementById("spPNameDelete");

				if (pNameObjVal == "") {
					sp2.innerHTML = "<img src='images/couponPic/error.png' class='error'>????????????";
				} else {
					sp2.innerHTML = "<img src='images/couponPic/correct.png' class='ok'>ok";
				}
			}
		</script>-->
		<!-- ????????????!!------------------------------------------------------------------------- -->
		<!-- page-content" -->
	</div>
	<!-- page-wrapper -->
</body>
</html>