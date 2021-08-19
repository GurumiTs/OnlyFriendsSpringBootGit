<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"
	name="viewport" />
<title>Login/Sign up</title>

<!-- General CSS Files -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous" />
<!-- bootstrap5  -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
	crossorigin="anonymous" />
<!-- fontawesome   -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous" />
<!-- datatables style -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap5.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css" />

<!-- Custom fonts for this template-->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />


<!-- Template CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/membermain.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/membercomponent.css" />
	<style>
	.bubbles {
  position: absolute;
  z-index: -999;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 0;
}

.bubbles li {
  position: absolute;
  list-stye: none;
  display: block;
  width: 20px;
  height: 20px;
  border-radius: 30%;
  bottom: -150px;
  background: rgba(103, 119, 239, 0.2);
  -webkit-animation: animate 25s infinite linear;
          animation: animate 25s infinite linear;
}

.bubbles li:nth-child(1) {
  left: 25%;
  width: 80px;
  height: 80px;
  -webkit-animation-delay: 0;
          animation-delay: 0;
}

.bubbles li:nth-child(2) {
  left: 10%;
  width: 20px;
  height: 20px;
  -webkit-animation-delay: 2s;
          animation-delay: 2s;
  -webkit-animation-duration: 12s;
          animation-duration: 12s;
}

.bubbles li:nth-child(3) {
  left: 70%;
  width: 20px;
  height: 20px;
  -webkit-animation-delay: 4s;
          animation-delay: 4s;
}

.bubbles li:nth-child(4) {
  left: 40%;
  width: 60px;
  height: 60px;
  -webkit-animation-delay: 0s;
          animation-delay: 0s;
  -webkit-animation-duration: 18s;
          animation-duration: 18s;
}

.bubbles li:nth-child(5) {
  left: 65%;
  width: 20px;
  height: 20px;
  -webkit-animation-delay: 0s;
          animation-delay: 0s;
}

.bubbles li:nth-child(6) {
  left: 75%;
  width: 110px;
  height: 110px;
  -webkit-animation-delay: 3s;
          animation-delay: 3s;
}

.bubbles li:nth-child(7) {
  left: 35%;
  width: 150px;
  height: 150px;
  -webkit-animation-delay: 7s;
          animation-delay: 7s;
}

.bubbles li:nth-child(8) {
  left: 50%;
  width: 25px;
  height: 25px;
  -webkit-animation-delay: 15s;
          animation-delay: 15s;
  -webkit-animation-duration: 45s;
          animation-duration: 45s;
}

.bubbles li:nth-child(9) {
  left: 20%;
  width: 15px;
  height: 15px;
  -webkit-animation-delay: 2s;
          animation-delay: 2s;
  -webkit-animation-duration: 35s;
          animation-duration: 35s;
}

.bubbles li:nth-child(10) {
  left: 85%;
  width: 150px;
  height: 150px;
  -webkit-animation-delay: 0s;
          animation-delay: 0s;
  -webkit-animation-duration: 11s;
          animation-duration: 11s;
}

@-webkit-keyframes animate {
  0% {
    -webkit-transform: translateY(0) rotate(0deg);
            transform: translateY(0) rotate(0deg);
    opacity: 1;
    border-radius: 30%;
  }
  100% {
    -webkit-transform: translateY(-1000px) rotate(720deg);
            transform: translateY(-1000px) rotate(720deg);
    opacity: 0;
    border-radius: 50%;
  }
}

@keyframes animate {
  0% {
    -webkit-transform: translateY(0) rotate(0deg);
            transform: translateY(0) rotate(0deg);
    opacity: 1;
    border-radius: 30%;
  }
  100% {
    -webkit-transform: translateY(-1000px) rotate(720deg);
            transform: translateY(-1000px) rotate(720deg);
    opacity: 0;
    border-radius: 50%;
  }
}
/*# sourceMappingURL=bubble.css.map */
	
	
	</style>


</head>
  <body>
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
            <div class="login-brand">
              <img src="${pageContext.request.contextPath}/images/login/flower.svg" alt="logo" width="100" class="shadow-light rounded-circle">
            </div>

            <div class="card card-primary">
              <div class="card-header"><h4>Reset Password</h4></div>

              <div class="card-body">
                <p class="text-muted">We will send a new password to your email</p>
                 <form
		            action="setnewpasswordcontroller"
		            method="POST"
		            class="needs-validation"
		            novalidate
		          >
                  <div class="form-group">
                    <label class="form-label d-none" >Email</label>
	                <input
	                  type="text"
	                  class="form-control d-none"
	                  name="email"
	                  id="email"
	                  value="${param.email}"
	                  required	                  
	                />
                  </div>
                  
                    <div class="form-group">               
                    <label class="form-label">Password</label>
	                <input
	                  type="password"
	                  class="form-control"
	                  name="oldPwd"
	                  id="oldPwd"
	                  required
	                />	             	                      	              
                  </div>

                  <div class="form-group">
                    <label for="updatePwd1" class="form-label">New Password</label>
	                <input
	                  type="password"
	                  class="form-control"
	                  name="updatePwd1"
	                  id="updatePwd1"
	                  required
	                />
                  </div>

                   <div class="form-group">
                    <div class="row">
                    <div class="col-8">
                     <label for="updatePwd2" class="form-label">Confirm</label>
	                <input
	                  type="password"
	                  class="form-control"
	                  name="updatePwd2"
	                  id="updatePwd2"
	                  required
	                />
	                </div>
	                 <div class="col-2 d-flex align-items-center" onclick="pwdType()"><i class="fas fa-eye fw-bolder fs-5"></i></div>
	                </div>          	              
                  </div>

                  <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-lg btn-block" tabindex="4">
                      Reset Password
                    </button>
                  </div>
                </form>
              </div>
            </div>
             <div class="simple-footer">
              Copyright &copy; OnlyFriends 2021 <a href="${pageContext.request.contextPath}/">Back</a>
            </div>
          </div>
        </div>
      </div>
    </section>
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





	<!-- bootstrap   -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
		crossorigin="anonymous"></script>

	<!-- jQuery  -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<!-- tw zipcode   -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
	<!--datatable -->
	<script
		src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap5.min.js"></script>
	<!--sweet alert -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- fontawesome  -->
	<script src="https://kit.fontawesome.com/1a950be563.js"
		crossorigin="anonymous"></script>
	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script
		src=" https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>


	<!-- JS Libraies -->
	<script src="../node_modules/sticky-kit/dist/sticky-kit.min.js"></script>

	<!-- Page Specific JS File -->
	
  <script>
      //submit validation
      (function () {
        "use strict";
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll(".needs-validation");
        // Loop over them and prevent submission
        Array.prototype.slice.call(forms).forEach(function (form) {
          form.addEventListener(
            "submit",
            function (event) {
              if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
              }

              form.classList.add("was-validated");
            },
            false
          );
        });
      })();
      //submit validation
    </script>

    <script>
    //submit validation
    (function () {
      "use strict";
      // Fetch all the forms we want to apply custom Bootstrap validation styles to
      var forms = document.querySelectorAll(".needs-validation");
      // Loop over them and prevent submission
      Array.prototype.slice.call(forms).forEach(function (form) {
        form.addEventListener(
          "submit",
          function (event) {
            if (!form.checkValidity()) {
              event.preventDefault();
              event.stopPropagation();
            }

            form.classList.add("was-validated");
          },
          false
        );
      });
    })();
    //submit validation

    //pwd
    const pwdCheckR =
      /^[A-Z]{1}(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*]).{7,11}$/;
    document.getElementById("updatePwd1").addEventListener("blur", pwdCheck);
    document.getElementById("updatePwd2").addEventListener("blur", pwdCheck);
    function pwdCheck() {
      let empPwd1 = document.getElementById("updatePwd1");
      let empPwd1Val = empPwd1.value;
      let empPwd2 = document.getElementById("updatePwd2");
      let empPwd2Val = empPwd2.value;

      if (empPwd1Val == "") empPwd1.setCustomValidity("pwd1 can't be empty");
      else if (empPwd2Val == "")
        empPwd2.setCustomValidity("pwd1 can't be empty");
      else if (empPwd1Val != empPwd2Val)
        empPwd1.setCustomValidity("pwd1 can't be empty");
      else if (pwdCheckR.test(empPwd1Val) == false)
        empPwd1.setCustomValidity("pwd1 format error");
      else if (pwdCheckR.test(empPwd2Val) == false)
        empPwd2.setCustomValidity("pwd2 format error");

      if (
        pwdCheckR.test(empPwd1Val) == true &&
        pwdCheckR.test(empPwd2Val) == true &&
        empPwd1Val == empPwd2Val
      ) {
        empPwd1.setCustomValidity("");
        empPwd2.setCustomValidity("");
      }
    }

    function pwdType() {
      let updatePwd1 = document.getElementById("updatePwd1");
      let updatePwd2 = document.getElementById("updatePwd2");
      let oldPwd = document.getElementById("oldPwd");
      if (updatePwd1.type === "password") {
        updatePwd1.type = "text";
      } else {
        updatePwd1.type = "password";
      }
      if (updatePwd2.type === "password") {
        updatePwd2.type = "text";
      } else {
        updatePwd2.type = "password";
      }
      if (oldPwd.type === "password") {
        oldPwd.type = "text";
      } else {
        oldPwd.type = "password";
      }
    }


  </script>

	
</body>
</html>


