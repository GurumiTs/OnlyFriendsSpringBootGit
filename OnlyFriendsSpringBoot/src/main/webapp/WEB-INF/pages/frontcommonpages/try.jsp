<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
</head>
<body>
 <body class="layout-2">
    <div id="app">
      <div class="main-wrapper">
        
        <%@include file="../frontcommonpages/shopheader.jsp"%>
        
        <%@include file="../frontcommonpages/shopsider.jsp"%>
        
        <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>Chat Box</h1>
          </div>

          <div class="section-body">
            <div class="row align-items-center justify-content-center">
              <div class="col-12 col-sm-6 col-lg-4">
                <div class="card">
                  <div class="card-header">
                    <h4>Box</h4>
                  </div>
                  <div class="card-body">
                    <ul class="list-unstyled list-unstyled-border" id="friendsarea">                          
                    </ul>
                  </div>
                </div>
              </div>
           
              <div class="col-12 col-sm-6 col-lg-4">
                <div class="card chat-box card-success" id="mychatbox2">
                  <div class="card-header">
                    <h4><i class="fas fa-circle text-success mr-2" title="Online" data-toggle="tooltip"></i> Chat with Ryan</h4>
                  </div>
                  <div class="card-body chat-content">
                  </div>
                  <div class="card-footer chat-form">
                    <form id="chat-form2">
                      <input type="text" class="form-control" placeholder="Type a message">
                      <button class="btn btn-primary">
                        <i class="far fa-paper-plane"></i>
                      </button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>

  
        <footer class="main-footer">
          <div class="footer-left">
            Copyright &copy; 2018
            <div class="bullet"></div>
            Design By <a href="https://nauval.in/">Muhamad Nauval Azhar</a>
          </div>
          <div class="footer-right">2.3.0</div>
        </footer>
      </div>
    </div>
    
    <%@include file="../frontcommonpages/shopbottom.jsp"%>
    
    
    <script >  
    $(function(){
    	loadfriends()
    })
    function loadfriends(){
    	console.log("hi")
    	 $.ajax({
             type: "post",
             url: "memberfriendsquery",
             success: function (data) {
             console.log(data)	 
              $('#friendsarea').html('')
              $.each(data,function(i,friend){ //i為順序 n為單筆物件
         	     var item =          	    	 
         	    "<li class='media'>"+
                 "<img alt='image' class='mr-3 rounded-circle' width='50' src='"+friend.memberPic+"'>"+
                 "<div class='media-body'>"+
                   "<div class='mt-0 mb-1 font-weight-bold'>"+friend.memberName+"</div>"+
                   "<div class='mt-0 mb-1 font-weight-bold'>"+friend.memberEmail+"</div>"+  
                " </div>"+
               "</li>";
               $('#friendsarea').append(item);});
             },
             error: function (data) {
               console.log("無法送出");
             },
           });          
    }
   
   
    </script>
  </body>
</html>       