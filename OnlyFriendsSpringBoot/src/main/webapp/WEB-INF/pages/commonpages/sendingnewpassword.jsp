<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 

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
    <title>Sending NewPassword</title>

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
      crossorigin="anonymous"
    />
     <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/emailverifysuccess.css">


  </head>
  <body class="text-center">
    <div class="container-fluid">
      <div
        class="row d-flex align-items-center justify-content-center min-vh-100"
      >
        <div class="col-2">
          <form
            action="sendingnewpasswordform.controller"
            method="POST"
            class="needs-validation "
            novalidate
          >
            <div class="col my-3">
              <input
                type="email"
                class="form-control"
                name="email"
                id="email"
                placeholder="Email"
                required
              />
            </div>

            <div class="col my-3 d-flex flex-row">
              <div class="col-6">
                <input
                  type="text"
                  class="form-control"
                  name="code"
                  required
                />
              </div>
              <div class="col-4">
                <img src="http://localhost:8080/OnlyFriends/VerifyImg" id="codeImage"/>
              </div>
              <div class="col-2">
                <i class="btn fas fa-sync-alt text-light" id="refresh"></i>
            </div>   

           </div>

            <div class="col ">
              <div class="button">
                <button type="submit" class="btn btn-primary">Save</button>
              </div>
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
      <!-- fontawesome javascript  -->
    <script
      src="https://kit.fontawesome.com/1a950be563.js"
      crossorigin="anonymous"
    ></script>

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
    $(function(){
      $("#refresh").on("click",function(){
        let no = Math.random() * 6 + 1
        $("#codeImage").attr("src","http://localhost:8080/OnlyFriends/VerifyImg?date="+no);
      })
    })
    </script>
  </body>
</html>
