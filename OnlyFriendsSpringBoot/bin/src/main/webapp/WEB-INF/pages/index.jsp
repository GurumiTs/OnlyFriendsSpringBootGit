<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta
      content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"
      name="viewport"
    />
    <title>Layout &rsaquo; Transprent Sidebar &mdash; Stisla</title>

    <!-- General CSS Files -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
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

    <!-- Template CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/membermain.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/membercomponent.css" />   
  <style>
	body{
	font-size:1.2rem
	}
</style>
  </head>

  <body class="layout-2">
    <div id="app">
      <div class="main-wrapper">
        
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
        
        
        
        <!-- Main Content -->
        <div class="main-content">
          <!-- Heading Row-->
          <div class="row gx-4 gx-lg-5 align-items-center my-5">
            <div class="col-lg-7">
              <img
                class="img-fluid rounded mb-4 mb-lg-0"
                src="${pageContext.request.contextPath}/images/indexPic/balloon.svg"
                alt="..."
              />
            </div>
            <div class="col-lg-5">
              <h1 class="font-weight-light">OnlyFriends®</h1>
              <h3 class="card-title mt-3">The Most Popular Dating Web</h3>
              <p class="card-text mt-3">
                Dating, Make Friends & Meet New People
              </p>
              <a class="btn btn-primary" href="#!">Call to Action!</a>
            </div>
          </div>

          <!-- Call to Action-->
          <div class="card text-white bg-light my-5 py-4 text-center">
            <div class="card-body d-flex flex-row text-dark">
              <div class="col">
                <img src="${pageContext.request.contextPath}/images/indexPic/hangout1.svg" alt="" />
                <h1>Outdoor Active</h1>
              </div>
              <div class="col">
                <img src="${pageContext.request.contextPath}/images/indexPic/hangout2.svg" alt="" />
                <h1>Study Group</h1>
              </div>
              <div class="col">
                <img src="${pageContext.request.contextPath}/images/indexPic/hangout4.svg" alt="" />
                <h1>Gathering</h1>
              </div>
            </div>
          </div>
          <div class="row gx-4 gx-lg-5">
            <div class="col-md-4 mb-5">
              <div class="card h-100">
                <div class="card-body">
                  <h2 class="card-title">愜意時光</h2>
                  <img
                    src="${pageContext.request.contextPath}/images/indexPic/c1.jpg"
                    alt=""
                    class="img-fluid rounded mb-4 mb-lg-0"
                  />
                </div>
              </div>
            </div>
            <div class="col-md-4 mb-5">
              <div class="card h-100">
                <div class="card-body">
                  <h2 class="card-title">浪漫海濱</h2>
                  <img
                    src="${pageContext.request.contextPath}/images/indexPic/c3.jpg"
                    alt=""
                    class="img-fluid rounded mb-4 mb-lg-0"
                  />
                </div>
              </div>
            </div>
            <div class="col-md-4 mb-5">
              <div class="card h-100">
                <div class="card-body">
                  <h2 class="card-title">幽靜森遊</h2>
                  <img
                    src="${pageContext.request.contextPath}/images/indexPic/c2.jpg"
                    alt=""
                    class="img-fluid rounded mb-4 mb-lg-0"
                  />
                </div>
              </div>
            </div>
          </div>

          <div class="card text-white bg-transparent my-5 py-4 text-center">
            <div class="card-body d-flex flex-row text-dark">
              <div class="col d-flex justify-content-end">
                <img src="${pageContext.request.contextPath}/images/indexPic/heart.svg" alt="" />
              </div>
              <div class="col mt-5">
                <h1>Lucky Stuff</h1>
                <button class="btn-lg btn-primary mt-5">Shop</button>
              </div>
            </div>
          </div>

          <div class="card text-white bg-secondary my-5 py-4 text-center">
            <div class="card-body d-flex flex-row text-dark">
              <div class="col mt-5">
                <h1>Coupon</h1>
                <button class="btn-lg btn-primary mt-5">Take</button>
              </div>
              <div class="col">
                <img src="${pageContext.request.contextPath}/images/indexPic/coupon.svg" alt="" />
              </div>
            </div>
          </div>

          <div class="card text-white bg-transparent my-5 py-4 text-center">
            <div class="card-body d-flex flex-row text-dark">
              <div class="col d-flex justify-content-end">
                <img src="${pageContext.request.contextPath}/images/indexPic/activities.svg" alt="" />
              </div>
              <div class="col mt-5">
                <h1>Free Activities</h1>
                <button class="btn-lg btn-primary mt-5">Go</button>
              </div>
            </div>
          </div>
          <!-- Content Row-->
        </div>
      </div>
    </div>
    
    

   <!-- bootstrap   -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
      crossorigin="anonymous"
    ></script>

    <!-- jQuery  -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- tw zipcode   -->
    <script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
    <!--datatable -->
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap5.min.js"></script>
    <!--sweet alert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- fontawesome  -->
    <script
      src="https://kit.fontawesome.com/1a950be563.js"
      crossorigin="anonymous"
    ></script>
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
   
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
      integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"
    ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
 

    <!-- Page Specific JS File -->
  </body>
</html>


