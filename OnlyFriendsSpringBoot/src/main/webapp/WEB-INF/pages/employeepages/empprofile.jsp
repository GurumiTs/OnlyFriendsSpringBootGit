<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<%@include file="../commonpages/dashboardsidebar.jsp"%>
		<!-- end of sidebar -->
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<%@include file="../commonpages/dashboardheader.jsp"%>
				<!--end of topbar -->
				<!-- Begin Page Content -->

				<div class="container-fluid">
					<!-- ************************** your content*************************** -->
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">編輯個人資訊</h1>
					<div class="container">
						<div class="row">
							<!-- form  -->
							<div class="col-6">
								<form action="empinfoupdate.controller" method="post"
									class="needs-validation" novalidate>
									<!-- email  -->
									<div class="mb-3">
										<label for="empEmail" class="form-label">信箱</label> <input
											type="email" class="form-control" name="empEmail"
											id="empEmail" value="${personalinfo.empEmail}" readonly required />
									</div>
									<!-- email  -->

									<!-- account name row  -->
									<div class="mb-3 row">
										<div class="col">
											<label for="empAcc" class="form-label">帳號</label> <input
												type="text" class="form-control" name="empAcc" id="empAcc"
												value="${personalinfo.empAccount}" readonly required />
										</div>
										<div class="col">
											<label for="empName" class="form-label">姓名</label> <input
												type="text" class="form-control" id="empName" name="empName"
												value="${personalinfo.empName}" required />
											<div class="valid-feedback">Beautiful!</div>
											<div class="invalid-feedback">english only!</div>
										</div>
									</div>
									<!-- account name row  -->

									<!-- address row  -->
									<div class="mb-3 row address" id="twzipcode">
										<div class="col">
											<input type="text" class="form-control" name="empAddress"
												id="empAddress" placeholder="addr."
												value="${personalinfo.empAddress}" />
										</div>
									</div>
									<!-- address row  -->

									<!-- birthday row  -->
									<div
										class="row d-flex justify-content-start align-items-center">
										<div class="col-4">
											<label for="empBday" class="form-label">生日</label> <input
												type="text" class="form-control" name="empBday" id="empBday"
												value="${personalinfo.empBday}" required />
											<div class="invalid-feedback">Choose your Happy Bday!</div>
										</div>

										<div class="button d-flex flex-row justify-content-end">
											<button type="submit" class="btn btn-primary my-3">
												儲存</button>
										</div>
									</div>
								</form>

								<hr />

								<form action="emppwdupdate.controller" method="post"
									enctype="multipart/form-data" class="needs-validation"
									novalidate>
									<!-- empacc d-none  -->
									<div class="mb-3 row">
										<div class="col">
											<input type="text" class="form-control d-none"
												name="empEmail" id="empEmail" value="${personalinfo.empEmail}"
												readonly required />
										</div>
									</div>
									<!-- empacc d-none  -->

									<!-- old pwd  -->
									<div class="mb-3 row">
										<div class="col-6">
											<label class="form-label">舊密碼</label> <input
												type="password" class="form-control" name="oldPwd"
												id="oldPwd" required />
										</div>
									</div>
									<!-- old pwd  -->

									<!-- updatepwd row   -->
									<div class="mb-3 row">
										<div class="col">
											<label for="updatePwd1" class="form-label">新密碼</label> <input type="password" class="form-control"
												name="updatePwd1" id="updatePwd1" required />
										</div>
										<div class="col">
											<label for="updatePwd2" class="form-label">確認密碼</label> <input
												type="password" class="form-control" name="updatePwd2"
												id="updatePwd2" required />
										</div>
										<div class="invalid-feedback">First letter should be
											uppercase,mix number and eng letters(8~12)</div>
									</div>
									<!-- updatepwd row   -->

									<div class="button d-flex flex-row justify-content-end">
										<button type="submit" class="btn btn-primary ">儲存</button>
									</div>
								</form>
							</div>
							<!-- form  -->

							<!-- pic  -->
							<div class="col-4 mt-5 mx-4 d-flex flex-column flex-wrap">
								<div class="card text-white border-0 bg-transparent"
									id="img-card">
									<img src="${personalinfo.empPic}"
										class="card-img rounded-circle shadow empPic" alt="..."
										style="width: 20vw; height: 20vw; object-fit: cover" />
									<div
										class="
						                      card-img-overlay
						                      d-flex
						                      justify-content-center
						                      align-items-end
						                    ">
										<h3 class="card-title">
											<i class="fas fa-user-edit text-dark btn fs-3"
												data-bs-toggle="modal" data-bs-target="#exampleModal"></i>

										</h3>
									</div>
								</div>
							</div>
						<!-- pic  -->
						</div>
					</div>

					<!-- **************************end of your content*************************** -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->
			<!-- modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Show me!</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<!-- modal body  -->
						<div class="modal-body">
							<form action="emppicupdate.controller" method="post"
								enctype="multipart/form-data" class="needs-validation"
								novalidate>
								<div
									class="
						                  row
						                  d-flex
						                  flex-column
						                  align-items-center
						                  justify-content-center
						                ">
									<img id="output" src="${personalinfo.empPic}" alt=""
										style="width: 250px; height: 250px" />

									<div class="col mb-2">
										<input type="text" class="form-control d-none" name="empEmail"
											id="empEmail" value="${personalinfo.empEmail}" readonly required />
									</div>

									<div class="col-6 mb-2">
										<input type="file" class="form-control" name="empPic"
											id="empPic" onchange="loadfile(event)" required />
										<div class="valid-feedback">Awesome!</div>
										<div class="invalid-feedback">JPG only</div>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Cancel</button>
										<button type="submit" class="btn btn-primary">Save</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- end of modal -->
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
		let loadfile = function(event) {
			let output = document.getElementById("output");
			output.src = URL.createObjectURL(event.target.files[0]);
			output.onload = function() {
				URL.revokeObjectURL(output.src);
			};
		};
	</script>

	<script>
		// zipcode select
		$("#twzipcode").twzipcode({
			detect : true,
			zipcodeIntoDistrict : true,
			css : [ "city form-control col", "town form-control col" ],
		});

		$("#twzipcode").twzipcode("set", {
			county : "${personalinfo.empCounty}",
			district : "${personalinfo.empDistrict}",
		});
		// zipcode select

		//submit validation
		(function() {
			"use strict";
			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.querySelectorAll(".needs-validation");
			// Loop over them and prevent submission
			Array.prototype.slice.call(forms).forEach(function(form) {
				form.addEventListener("submit", function(event) {
					if (!form.checkValidity()) {
						event.preventDefault();
						event.stopPropagation();
					}

					form.classList.add("was-validated");
				}, false);
			});
		})();
		//submit validation

		//name validate
		const empNameCheckR = /[a-zA-z]/;
		document.getElementById("empName").addEventListener("blur", nameCheck);
		function nameCheck() {
			let empName = document.getElementById("empName");
			let empNameVal = empName.value;
			if (empNameVal == "")
				empName.setCustomValidity("can't be empty");
			else if (empNameCheckR.test(empNameVal) == false)
				empName.setCustomValidity("english only");
			else
				empName.setCustomValidity("");
		}
		//name validate

		//bday
		document.getElementById("empBday").addEventListener("blur", bdayCheck);
		function bdayCheck() {
			function bdayECheck(bdayObjVal) {
				let splitDate = bdayObjVal.split("/");
				//console.log(splitDate);
				let date = new Date(splitDate[0], splitDate[1] - 1,
						splitDate[2]);
				// console.log(date);
				let year = date.getFullYear();
				let month = date.getMonth() + 1;
				let day = date.getDate();
				let status = false;
				if (year == splitDate[0] && month == splitDate[1]
						&& day == splitDate[2]) {
					return (status = true);
				} else
					return false;
			}

			let empBday = document.getElementById("empBday");
			let empBdayVal = empBday.value;

			const bdayCheckR = /\d{4}\/\d{1,2}\/\d{1,2}/;
			if (empBdayVal == "")
				empBday.setCustomValidity("can't be empty");
			else if (bdayCheckR.test(empBdayVal) == false)
				empBday.setCustomValidity("format incorrect");
			else if (bdayECheck(empBdayVal) == false)
				empBday.setCustomValidity("date not exist");

			if (bdayCheckR.test(empBdayVal) == true
					&& bdayECheck(empBdayVal) == true) {
				empBday.setCustomValidity("");
			}
		}
		//bday

		//pic
		document.getElementById("empPic").addEventListener("blur", picCheck);
		function picCheck() {
			let empPic = document.getElementById("empPic");
			let empPicVal = empPic.value;
			let picCheckR = /\.jpg$/;
			if (empPicVal == "")
				empPic.setCustomValidity("can't be empty");
			else if (picCheckR.test(empPicVal) == false)
				empPic.setCustomValidity("JPG only");
			else
				empPic.setCustomValidity("");
		}
		//pic

		//pwd
		const pwdCheckR = /^[A-Z]{1}(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*]).{7,11}$/;
		document.getElementById("updatePwd1")
				.addEventListener("blur", pwdCheck);
		document.getElementById("updatePwd2")
				.addEventListener("blur", pwdCheck);
		function pwdCheck() {
			let empPwd1 = document.getElementById("updatePwd1");
			let empPwd1Val = empPwd1.value;
			let empPwd2 = document.getElementById("updatePwd2");
			let empPwd2Val = empPwd2.value;

			if (empPwd1Val == "")
				empPwd1.setCustomValidity("pwd1 can't be empty");
			else if (empPwd2Val == "")
				empPwd2.setCustomValidity("pwd1 can't be empty");
			else if (empPwd1Val != empPwd2Val)
				empPwd1.setCustomValidity("pwd1 can't be empty");
			else if (pwdCheckR.test(empPwd1Val) == false)
				empPwd1.setCustomValidity("pwd1 format error");
			else if (pwdCheckR.test(empPwd2Val) == false)
				empPwd2.setCustomValidity("pwd2 format error");

			if (pwdCheckR.test(empPwd1Val) == true
					&& pwdCheckR.test(empPwd2Val) == true
					&& empPwd1Val == empPwd2Val) {
				empPwd1.setCustomValidity("");
				empPwd2.setCustomValidity("");
			}
		}
	</script>

	<c:if test="${not empty successMsg}">
		<script>
			Swal.fire({
				position : 'center',
				icon : 'success',
				title : '${successMsg}',
				showConfirmButton : false,
				timer : 1500
			})
		</script>
		<c:remove var="successMsg" scope="session" />
	</c:if>

	<c:if test="${not empty errorMsg}">
		<script>
			Swal.fire({
				icon : 'error',
				title : 'Oops...',
				text : '${errorMsg}',

			})
		</script>
		<c:remove var="successMsg" scope="session" />
	</c:if>
</body>
</html>
