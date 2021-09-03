<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
body{
font-size:1.2rem
}
</style>
</head>
<body>
 <body class="layout-2">
    <div id="app">
      <div class="main-wrapper">
        
        <%@include file="../frontcommonpages/shopheader.jsp"%>
        
          <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1><img src="${pageContext.request.contextPath}/images/smallicon/bigcs.svg" alt="logo" width="75" class="shadow-light rounded-circle">              
            線上客戶服務中心</h1>           
          </div>
		 <div class="row align-items-center justify-content-center" id="row">
		 </div>
          
                 
        </section>
      </div>
    </div>
  </div>


        
    
    <%@include file="../frontcommonpages/shopbottom.jsp"%>
    <script
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	
    <script src="${pageContext.request.contextPath}/js/employeeservice.js"></script>    
   
  </body>
</html>       