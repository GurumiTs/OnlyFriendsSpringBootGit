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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/verify.css" />	
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
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

 <!-- <script src="https://www.google.com/recaptcha/api.js"></script> -->
</head>
  <body>
  <div id="app">
  
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
            <div class="login-brand">
             <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/images/login/flower.svg" alt="logo" width="100" class="shadow-light rounded-circle" /></a> 
            </div>

            <div class="card card-primary">
              <div class="card-header"><h4>登入</h4></div>
              
              <div class="card-body">
              <form action="${pageContext.request.contextPath}/login"
					method="post" id="loginform">  
                  <div class="form-group">
                   <label for="email" class="form-label">帳號</label> <input
							type="text" class="form-control" name="username" id="username" />                  
                  </div>

                  <div class="form-group">
                    <div class="d-block">
                    	<label for="password" class="control-label">密碼</label>
                      <div class="float-right">
                        <a href="sendingnewpassword" class="text-small">
                          忘記密碼?
                        </a>
                      </div>
                    </div>
                    <input type="password" class="form-control" name="password"
							id="password" />                   
                  </div>

                  <div class="form-group">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" name="remember-me" class="custom-control-input" tabindex="3" id="remember-me" value="true">
                      <label class="custom-control-label" for="remember-me">記住我</label>
                    </div>
                  </div>

                  
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
					
				
				<div id="content" style="margin-top:30px;margin-bottom:30px">
				</div>
                                                   

                  <div class="form-group">
                  	<button id="cbt"  type="submit" class="btn btn-primary btn-lg btn-block d-none" 
                      tabindex="4">
                      登入
                    </button>
                  
                  <!--    <button type="submit" class="g-recaptcha btn btn-primary btn-lg btn-block" 
                     data-sitekey="6Ld_JiIcAAAAAKhNWXoiB--DlXCP1SOSnkFI3K5p" data-callback='onSubmit'   data-action='submit' tabindex="4">
                      Login
                    </button>-->
                  </div>
                </form>
                <div class="text-center mt-4 mb-3">
                  <div class="text-job text-muted">第三方登入</div>
                </div>
                <div class="row sm-gutters">
                  <div class="col-6">
                  <button class="btn btn-outline-danger">
                  login with
                  <a href="${pageContext.request.contextPath}/oauth2/authorization/google"> <img
									src="${pageContext.request.contextPath}/images/smallicon/google.svg"
									alt="">
								</a></button>
                  </div>
                   <div class="col-6 ">
                   <button class="btn btn-outline-success" id="member">Member</button>          
		   		   <button class="btn btn-outline-danger" id="employee">Admin</button>   
                   </div>
                </div>
                 <div class="mt-5 text-muted text-center">
              	尚未擁有帳號?  <a type="button" class="fst-italic text-primary" data-bs-toggle="modal"
									data-bs-target="#staticBackdrop">前往註冊</a>
           		 </div>

              </div>
            </div>
         
          
            <div class="simple-footer">
              Copyright &copy; OnlyFriends 2021
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
	<div class="modal fade" id="staticBackdrop" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">帳號註冊</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="memberRegisterForm" novalidate>						
			        <div class="form-group">    
			        <div class="row">
                    <div class="col-8">           
                    <label class="form-label">帳號</label>
	                <input
	                  type="text"
	                  class="form-control"
	                  name="memberAccount"
	                  id="memberAccount"
	                  required/>	    
	                  <div class="text-danger fst-italic mt-1" id="emailtest"></div>        	                      	              
                  </div>
                   </div>	                
                  </div>
                  
                  <div class="form-group">
                    <div class="row">
                    <div class="col-8">
                    <label for="email" class="form-label">信箱</label> 
                    <input type="text" class="form-control" name="email" id="email" required />
	                </div>
	                </div>	                
                  </div>
                  
                  

                  <div class="form-group">
                    <div class="row">
                    <div class="col-8">
                    <label for="empPwd1" class="form-label">密碼</label> 
                    <input type="password" class="form-control" name="empPwd1" id="empPwd1" required />
	                </div>
	                </div>	                
                  </div>

                   <div class="form-group">
                    <div class="row">
                    <div class="col-8">
                     <label for="empPwd2" class="form-label">確認密碼</label> 
                     <input type="password" class="form-control" name="empPwd2" id="empPwd2" required />
                     <div class="invalid-feedback">First letter should be uppercase,mix number and eng letters(8~12)</div>
	                </div>
	                 <div class="col-2 d-flex align-items-center" onclick="pwdType()"><i class="fas fa-eye fw-bolder fs-5"></i></div>
	                </div>          	              
                  </div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">取消</button>
							<button id="memberRegister" type="button" class="btn btn-primary">送出</button>
						</div>
					</form>
				</div>
				<!--modal body -->
			</div>
		</div>
	</div>  
	
	




	<!-- bootstrap   -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

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


		<script src="${pageContext.request.contextPath}/js/crypto-js.js"></script>
		<script src="${pageContext.request.contextPath}/js/ase.js"></script>
        <script src="${pageContext.request.contextPath}/js/verify.js" ></script>
 
        

	 <!--  <script>
	   function onSubmit(token) {
	     document.getElementById("loginform").submit();
	     console.log('hi')
	   }
 	</script>-->
 	<script type="text/javascript">
 	
 	$(function(){
 		
 		 $('#content').slideVerify({
 	        baseUrl:'https://captcha.anji-plus.com/captcha-api',  //服务器请求地址, 默认地址为安吉服务器;
 	       	//containerId:'btn',
 	        mode:'fixed',     //展示模式
 	        imgSize : {       //图片的大小对象,有默认值{ width: '310px',height: '155px'},可省略
 	            width: '310px',
 	            height: '155px',
 	        },
 	        barSize:{          //下方滑块的大小对象,有默认值{ width: '310px',height: '50px'},可省略
 	            width: '310px',
 	            height: '50px',
 	        },
 	        beforeCheck:function(){  //检验参数合法性的函数  mode ="pop"有效
 	            let flag = true;
 	            //实现: 参数合法性的判断逻辑, 返回一个boolean值
 	            return flag
 	        },
 	        ready : function() {},  //加载完毕的回调
 	        success : function(params) { //成功的回调
 	        	$('#cbt').removeClass('d-none')
 	        	console.log(params)
 	            // params为返回的二次验证参数 需要在接下来的实现逻辑回传服务器
 	            //例如: login($.extend({}, params))
 	            
 	        	 $.ajax({
 		            type: "post",
 		            url: "ajcheck",
 		           	data: {"captchaVerification":params.captchaVerification}, 
 		            success: function (data) {
 		              console.log(data)
 		            },
 		            error: function (e) {
 		              console.log(e);
 		            },
 		          });

 	            
 	        },
 	        error : function() {
 	        	$('#cbt').addClass('d-none')
 	        	console.log('failed')
 	        	
 	        }        //失败的回调
 	    });
 	})
 	
 	
 	
 	
 	
 	
 	</script>

	<script>
		$(function() {
			$("#employee").click(function() {
				$("#username").val("hollan123@gmail.com");
				$("#password").val("Apple1234*")
			});

			$("#member").click(function() {
				$("#username").val("1011");
				$("#password").val("Apple1234*")
			});
			
			
			 $("#memberAccount").on("change", function () {
		          let email = $(this).val();
		          $.ajax({
		            type: "post",
		            url: "emailCheck.controller/" + email,
		            success: function (data) {
		              if (data == "y") {
		                console.log("used");
		                $("#emailtest").html(
		                  "<i class='fas fa-times-circle'></i>  be used"
		                );
		              } else {
		                $("#emailtest").html("");
		              }
		            },
		            error: function (e) {
		              console.log(e);
		            },
		          });
		        });
			 
			 $("#memberRegister").on("click", function () {
				 console.log("hi")
		          let formData = new FormData(document.getElementById("memberRegisterForm"));
		          $.ajax({
		            type: "post",
		            url: "memberRegister",
		            data: formData,
		            contentType: false,
		            cache: false,
		            processData: false,
		            success: function (data) {   
		              $('#memberAccount').prop('value',"")	
		              $('#empPwd1').prop('value','')
		              $('#empPwd2').prop('value','')
		              $('#email').prop('value','')
		              
		   			  Swal.fire("註冊成功，前往信箱收取認證信!", "", "success");		              
		            },
		            error: function (e) {
		              console.log("error");
		            },
		          });
		        });
			 
			 
		});
</script>
	
	<script>	
		//須以大寫字母為開頭,至少個數字以及特殊符號總長8~12
		const pwdCheckR = /^[A-Z]{1}(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*]).{7,11}$/;

		(function() {
			"use strict";
			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.querySelectorAll(".needs-validation");
			// Loop over them and prevent submission
			Array.prototype.slice.call(forms).forEach(function(form) {
				form.addEventListener("click", function(event) {
					if (!form.checkValidity()) {
						event.preventDefault();
						event.stopPropagation();
					}

					form.classList.add("was-validated");
				}, false);
			});
		})();

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
	
	
</body>
</html>


