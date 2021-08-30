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
			
		<div class="main-sidebar">
          <aside id="sidebar-wrapper">
            <div class="card">
                  <div class="card-header">
                    <h4>搜尋</h4>
                  </div>
                  <div class="card-body">
                  <div class="container d-flex flex-column">
                  <input class="form-control" type="search" placeholder="搜尋..." aria-label="搜尋" data-width="250">
            	  <button class="btn" type="submit"><i class="fas fa-search"></i></button>
                   	  <span class="badge badge-primary mb-2">clothes</span>
                      <span class="badge badge-secondary mb-2">lucky stuff</span>
                      <span class="badge badge-success mb-2">Success</span>
                      <span class="badge badge-danger mb-2">Danger</span>
                      <span class="badge badge-warning mb-2">Warning</span>
                      <span class="badge badge-info mb-2">Info</span>
                      <span class="badge badge-light mb-2">Light</span>
                      <span class="badge badge-dark mb-2">Dark</span>
                  </div>
                  </div>
                </div>
          </aside>
        </div>
			
			
			
			<!-- Main Content -->
			<div class="main-content">
				<section class="section">
					
						<div class="bg-dark py-5">
							<div class="container px-4 px-lg-5 my-5">
								<div class="text-center text-white">
									<h1 class="display-4 fw-bolder">OnlyFriends</h1>
									<p class="lead fw-normal text-white-50 mb-0">這裡再想想要寫啥</p>
								</div>
							</div>
						</div>
					
					<div class="section-body">
						<div class="card">
							<div class="card-header">
								<h4>官方聯誼活動</h4>
							</div>
							<div class="card-body">
								<div
							          class="
							            row
							            gx-4 gx-lg-5
							            row-cols-2 row-cols-md-3 row-cols-xl-4
							            justify-content-center
							          "
							          id="itemarea"
							        >    
							        
							      </div>
							</div>
							<div class="card-footer bg-whitesmoke">
							<table id="showpage" class="d-flex justify-content-center">
								<tr>			
									<td colspan="3" align="right"> <c:forEach var="i"
											begin="1" end="${totalPages}" step="1">
											<button class="btn btn-outline-secondary" id="myPage" value="${i}" onclick="change(${i})">${i}</button>
										</c:forEach>
									</td>
								</tr>
							</table>
							
							</div>
						</div>
					</div>
				</section>
			</div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>	
		</div>
	</div>
	
	<%@include file="../frontcommonpages/shopbottom.jsp"%>

  <script >  
    var indexPage = 1;
    $(function(){
    	load(indexPage);
    })

	function change(page){
	   indexPage = page;
	   load(indexPage);
	}
    function load(){
    	$.ajax({
    	   type:'post',
    	   url:'queryalloabypage/' + indexPage,
    	   dataType:'JSON',
    	   contentType:'application/json',
    	   success: function(data) {
    	     var json = JSON.stringify(data, null, 2);
    	     var parsedObjinArray = JSON.parse(json);
    	     var itemarea = $('#itemarea');
    	     $('#itemarea').empty("");
    	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
    	     var item = 
    	    "<div class='col mb-5'>"+
             "<div class='card h-100'>"+          
             "<div class='badge bg-dark text-white position-absolute'style='top: 0.5rem; right: 0.5rem'>"
               +  "Sale"+
              "</div>" +    
               "<img class='card-img-top' src='"+n.img+"'/>"+     
               "<div class='card-body p-4'>" +
                 "<div class='text-center'>" +
                   "<h5 class='fw-bolder'>"+n.active+"</h5>"+
                   "<div class='d-flex justify-content-center small text-warning mb-2' >"+
                     "<div class='bi-star-fill'></div>"+
                     "<div class='bi-star-fill'></div>"+
                     "<div class='bi-star-fill'></div>"+
                     "<div class='bi-star-fill'></div>"+
                     "<div class='bi-star-fill'></div>"+
                  "</div>"+
                " </div>"+
               "</div>"+
             
               "<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>"+
                 "<div class='text-center'>"+
                  "<a class='btn btn-outline-dark mt-auto' href='oaitemEntry.controller?anum="+n.anum+"&active="+n.active+"' id='a'>詳細內容...</a>"+
                 "</div>"+
               "</div>"+
             "</div>"+
           "</div>" ;
           itemarea.append(item);
    	       });
    	    
    	},
    	error: function() {
    	    console.log("error");
    	}
    	});
    	}
    
    </script>
</body>
</html>
