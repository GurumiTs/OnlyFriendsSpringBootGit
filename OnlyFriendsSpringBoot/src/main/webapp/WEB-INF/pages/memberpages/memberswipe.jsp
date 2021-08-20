<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/swipe.css" /> 
</head>
<body>
	
    <div class="underbackground">
      <div class="header">
        <div class="title" id="coinarea">
        </div>
        <a href="${pageContext.request.contextPath}/">Back</a>       
      </div>
    </div>
    <div class="backgrounds">
      <div class="background layer-3"><div class="head"></div></div>
      <div class="background layer-2"><div class="head"></div></div>
      <div class="background layer-1"><div class="head"></div></div>
    </div>
    <br><br><br><br><br>
    <div class="container mt-5">
        
    <!-- card area -->
     <div class="row gx-4 gx-lg-5 d-flex justify-content-center align-items-center " id="cardarea">
      
                <div class="col-12 col-md-6 col-sm-12">
                <div class="card  bg-transparent shadow-none">
                  
                  <div class="card-body">
                    <div class="empty-state" data-height="400">
                      <img class="img-fluid" src="${pageContext.request.contextPath}/images/smallicon/ball.png" alt="" />
                      <h2 class="text-white">閉上眼睛，在心中默念<br> 準備好我們就開始吧!</h2>
                      <p class="lead text-white">
                      
                      </p>
                      <a href="memberswipeloading" class="btn btn-primary mt-4">Let's Go</a>
                    </div>
                  </div>
                </div>               
              </div>
       </div> <!-- end of card row -->
    </div>   
     
      

	<%@include file="../frontcommonpages/shopbottom.jsp"%>

    <script>

    </script>
</body>
</html>
