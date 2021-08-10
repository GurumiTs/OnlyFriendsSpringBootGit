<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <title>Employee MS</title>
    <!-- bootstrap5  -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
      crossorigin="anonymous"
    />
    <!-- fontawesome   -->
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
      integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
      crossorigin="anonymous"
    />
    <!-- datatables style -->
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap5.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/dashboard.css" />
  </head>
  <body>
    <header
      class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow"
    >
      <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="index"
        >OnlyFriends</a
      >
      <button
        class="navbar-toggler position-absolute d-md-none collapsed"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#sidebarMenu"
        aria-controls="sidebarMenu"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <ul
        class="
          navbar-nav
          px-3
          d-flex
          flex-row
          align-items-center
          justify-content-center
        "
      >
        <li class="nav-item text-nowrap mx-2">
          <a class="nav-link" href="employeeprofile.controller"
            ><i
              class="far fa-user-circle"
              style="font-size: 2rem; color: rgba(199, 199, 199, 0.849)"
            ></i
          ></a>
        </li>
        <li class="nav-item text-nowrap mx-2">
          <a class="nav-link" href="logout.controller">Sign out</a>
        </li>
      </ul>
    </header>

    <!-- bootstrap js  -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
      crossorigin="anonymous"
    ></script>

    <!-- jQuery  -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- tw zipcode   -->
    <script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>

    <!--datatable js -->
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap5.min.js"></script>
    <!--sweet alert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
      crossorigin="anonymous"
    ></script>
    <!-- fontawesome javascript  -->
    <script
      src="https://kit.fontawesome.com/1a950be563.js"
      crossorigin="anonymous"
    ></script>

    <script>
    $(function(){
    	
    	$(".sidebar-dropdown > a").click(function () {
        $(".sidebar-submenu").slideUp(200);
        if ($(this).parent().hasClass("active")) {
          $(".sidebar-dropdown").removeClass("active");
          $(this).parent().removeClass("active");
        } else {
          $(".sidebar-dropdown").removeClass("active");
          $(this).next(".sidebar-submenu").slideDown(200);
          $(this).parent().addClass("active");
        }
      });

      $("#close-sidebar").click(function () {
        $(".page-wrapper").removeClass("toggled");
      });
      $("#show-sidebar").click(function () {
        $(".page-wrapper").addClass("toggled");
      });
    	
    })
      
    </script>
  </body>
</html>