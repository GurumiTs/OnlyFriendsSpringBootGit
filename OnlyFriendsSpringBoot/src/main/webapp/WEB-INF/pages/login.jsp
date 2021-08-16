<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="robots" content="index,follow" />
<meta name="author" content="hollan" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/all.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
 <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
      rel="stylesheet"
    />		
<base target="_self" />
<title>Welcome Onlyfriends</title>
<style>
* {
	font-family: 'Noto Sans TC', sans-serif;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${not empty employee}">
			<%@include file="./commonpages/loginedheader.jsp"%>
		</c:when>
		<c:when test="${not empty member}">
			<%@include file="./membercommonpages/memberloginedheader.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="./commonpages/header.jsp"%>
		</c:otherwise>
	</c:choose>

	<div class="container">
		<div
			class="row d-flex align-items-center justify-content-center min-vh-100">
			<div class="col-6">
				<img src="./images/login/login.svg" alt="" />
			</div>
			<div class="col-4 w-25">
				<form action="${pageContext.request.contextPath}/login"
					method="post">
					<div class="mb-3">
						<label for="email" class="form-label">Email</label> <input
							type="text" class="form-control" name="username" id="username" />
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">Password</label> <input
							type="password" class="form-control" name="password"
							id="password" />
					</div>
					<div class="row mb-3 ">
						<div class="col-6 ">
							<input type="checkbox" id="remember-me" name="remember-me" /> <label
								for="autologin">Remember-me</label>
						</div>

						<div class="col-6">
							<label><a href="sendingnewpassword">Forget Password?</a></label>
						</div>
					</div>
					<!-- check account  -->


					<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
						<p style="color: rgb(184, 58, 58); font-style: italic">email
							or password error</p>
						<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
					</c:if>


					<c:if test="${not empty errorMsg}">
						<p style="color: rgb(184, 58, 58); font-style: italic">
							${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>


					<c:if test="${not empty successMsg}">
						<p style="color: #198754; font-style: italic">${successMsg}</p>
						<c:remove var="successMsg" scope="session" />
					</c:if>

					<c:if test="${not empty signupErrorMsg}">
						<p style="color: rgb(184, 58, 58); font-style: italic">
							${signupErrorMsg}</p>
						<c:remove var="signupErrorMsg" scope="session" />
					</c:if>

					<div class="col d-flex align-items-end justify-content-end">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>

					<div class="row mb-3 d-felx flex-row ">
						<div class="col">
							<p class="btn btn-link text-success" id="member">Member</p>
							<p class="btn btn-link text-danger" id="employee">Employee</p>
						</div>
					</div>


					<div class="row mb-3 d-felx flex-column ">
						<div class="col align-items-center justify-content-center">
							<hr />
						</div>
						<div
							class="col d-flex flex-row align-items-center justify-content-center">
							<div class="col">
								<a type="button" class="fst-italic" data-bs-toggle="modal"
									data-bs-target="#staticBackdrop">SignUp</a>
							</div>

							<div class="col  d-flex align-items-end justify-content-end">
								<a href="${pageContext.request.contextPath}/oauth2/authorization/google"> <img
									src="${pageContext.request.contextPath}/images/smallicon/google.svg"
									alt="">
								</a>

							</div>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
	<div class="container">
		<div class="mb-3">
			<ul class="bubbles">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
	</div>
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="signupmember.controller" method="post"
						enctype="multipart/form-data" class="needs-validation" novalidate>

						<div class="mb-3 row">
							<div class="col">
								<label for="empEmail" class="form-label">Email</label> <input
									type="email" class="form-control" name="empEmail" id="empEmail"
									required />
							</div>
							<div class="col">
								<label for="empName" class="form-label">Name</label> <input
									type="text" class="form-control" id="empName" name="empName"
									required />
								<div class="valid-feedback">Beautiful!</div>
								<div class="invalid-feedback">english only!</div>
							</div>
						</div>


						<div class="mb-3 row">
							<div class="col">
								<label for="empPwd1" class="form-label">Password</label> <input
									type="password" class="form-control" name="empPwd1"
									id="empPwd1" required />
							</div>
							<div class="col">
								<label for="empPwd2" class="form-label">Confirm</label> <input
									type="password" class="form-control" name="empPwd2"
									id="empPwd2" required />
							</div>
							<div class="invalid-feedback">First letter should be
								uppercase,mix number and eng letters(8~12)</div>
						</div>

						<div class="mb-3 row">

							<div class="col">
								<label for="empPic" class="form-label">Photo</label> <input
									type="file" class="form-control" name="empPic" id="empPic"
									required />
								<div class="valid-feedback">Awesome!</div>
								<div class="invalid-feedback">JPG only</div>
							</div>
							<div class="col showPwd">
								<input class="form-check-input" type="checkbox" name="showPwd"
									id="showPwd" onclick="pwdType()" /><label for="showPwd">show
									password</label>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</form>
				</div>
				<!--modal body -->
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
		crossorigin="anonymous"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script>
		const emailCheckR = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;

		//須以大寫字母為開頭,至少個數字以及特殊符號總長8~12
		const pwdCheckR = /^[A-Z]{1}(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*]).{7,11}$/;

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

		//pwd
		document.getElementById("empPwd1").addEventListener("blur", pwdCheck);
		document.getElementById("empPwd2").addEventListener("blur", pwdCheck);
		function pwdCheck() {
			let empPwd1 = document.getElementById("empPwd1");
			let empPwd1Val = empPwd1.value;
			let empPwd2 = document.getElementById("empPwd2");
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

		function pwdType() {
			let empPwd1 = document.getElementById("empPwd1");
			let empPwd2 = document.getElementById("empPwd2");
			if (empPwd1.type === "password") {
				empPwd1.type = "text";
			} else {
				empPwd1.type = "password";
			}
			if (empPwd2.type === "password") {
				empPwd2.type = "text";
			} else {
				empPwd2.type = "password";
			}
		}
	</script>

	<script>
		$(function() {
			$("#employee").click(function() {
				$("#username").val("hollan5835650@gmail.com");
				$("#password").val("Apple1234*")
			});

			$("#member").click(function() {
				$("#username").val("apple123@gmail.com");
				$("#password").val("Apple1234*")
			});
		});
	</script>


</body>
</html>
