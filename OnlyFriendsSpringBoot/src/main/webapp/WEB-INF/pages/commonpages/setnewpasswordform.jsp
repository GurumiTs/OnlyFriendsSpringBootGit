<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta
      name="author"
      content="Mark Otto, Jacob Thornton, and Bootstrap contributors"
    />
    <meta name="generator" content="Hugo 0.83.1" />
    <title>ForgetPassword</title>

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
      crossorigin="anonymous"
    />
      
  </head>
  <body class="text-center">
    <div class="container">
      <div
        class="row d-flex align-items-center justify-content-center min-vh-100"
      >
        <div class="col-4">
          <form
            action="setnewpasswordcontroller"
            method="POST"
            class="needs-validation"
            novalidate
          >
            <div class="row d-flex flex-row-reverse">
              <div class="col">
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

              <div class="col-12">
                <label class="form-label">Email Password</label>
                <input
                  type="password"
                  class="form-control"
                  name="oldPwd"
                  id="oldPwd"
                  required
                />
              </div>
            </div>

            <div class="row d-flex flex-row mb-3">
              <div class="col">
                <label for="updatePwd1" class="form-label">New Password</label>
                <input
                  type="password"
                  class="form-control"
                  name="updatePwd1"
                  id="updatePwd1"
                  required
                />
              </div>
              <div class="col">
                <label for="updatePwd2" class="form-label">Confirm</label>
                <input
                  type="password"
                  class="form-control"
                  name="updatePwd2"
                  id="updatePwd2"
                  required
                />

                <div class="invalid-feedback">
                  First letter should be uppercase,mix number and eng
                  letters(8~12)
                </div>
              </div>
            </div>

            <!-- updatepwd row   -->

            <div class="col showPwd mb-3">
              <input
                class="form-check-input"
                type="checkbox"
                name="showPwd"
                id="showPwd"
                onclick="pwdType()"
              /><label for="showPwd">show password</label>
            </div>

            <div class="button">
              <button type="submit" class="btn btn-primary">Save</button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
      crossorigin="anonymous"
    ></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

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
