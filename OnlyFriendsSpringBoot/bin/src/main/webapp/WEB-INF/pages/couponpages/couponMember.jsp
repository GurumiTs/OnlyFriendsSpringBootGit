<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
</head>
<style>
    .coupon {
        position: relative;
        width: 100%;
       
        margin: 50px auto;
        background-image: radial-gradient( circle at 1px 8px, transparent 6px, #ff9e6d 6px, #ff9e6d 0px), radial-gradient( circle at 199px 8px, transparent 6px, #ff9e6d 6px, #ff9e6d 0px); background-size: 200px 18px; background-position: 0 0, 200px 0; background-repeat-x: no-repeat;
        font-size: 60px; color: #fff; font-weight: bold; line-height: 160px; padding-left: 60px; box-sizing: border-box; cursor: pointer;   
    }
    .coupon::before { position: absolute; content: ""; left: 240px; top: 0; bottom: 0; width: 0; border-left: 1px dashed #fff; }
    .coupon::after { position: absolute; content: "立即領取"; font-size: 26px; width: 70px; top: 50%; right: 2%; transform: translate(-50%, -50%); line-height: 40px; letter-spacing: 5px; }

</style>
<body>
<body class="layout-2">
	<div id="app">
		<div class="main-wrapper">

			<%@include file="../frontcommonpages/shopheader.jsp"%>

			<div class="main-sidebar">
				<aside id="sidebar-wrapper">
					<div class="card">
						<div class="card-header">
							<h4>Search by</h4>
						</div>
						<div class="card-body">
							<div class="container d-flex flex-column">
								<input class="form-control" type="search" placeholder="Search"
									aria-label="Search" data-width="250">
								<button class="btn" type="submit">
									<i class="fas fa-search"></i>
								</button>
								<span class="badge badge-primary mb-2">clothes</span> <span
									class="badge badge-secondary mb-2">lucky stuff</span> <span
									class="badge badge-success mb-2">Success</span> <span
									class="badge badge-danger mb-2">Danger</span> <span
									class="badge badge-warning mb-2">Warning</span> <span
									class="badge badge-info mb-2">Info</span> <span
									class="badge badge-light mb-2">Light</span> <span
									class="badge badge-dark mb-2">Dark</span>
							</div>
						</div>
					</div>
				</aside>
			</div>



			<!-- Main Content -->
			<div class="main-content">
				<section class="section">

					<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
						<div class="container-fluid">
							<button class="navbar-toggler" type="button"
								data-bs-toggle="collapse" data-bs-target="#navbarColor01"
								aria-controls="navbarColor01" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>

							<div class="collapse navbar-collapse" id="navbarColor01">
								<ul class="navbar-nav me-auto">
									<li class="nav-item"><a class="nav-link active" href="#">領取優惠券
											<span class="visually-hidden">(current)</span>
									</a></li>
									<li class="nav-item"><a class="nav-link" href="#">我的優惠券</a>
									</li>
									<li class="nav-item"><a class="nav-link" href="#">優惠券紀錄</a>
									</li>
								</ul>
								
							</div>
						</div>
					</nav>

					<div class="section-body" >
						<div class="card" >
							<div class="card-header">
								<h4>On Sale</h4>
							</div>
							<div class="card-body " >
								<div
									class="
							            row
							            gx-4 gx-lg-5
							            row-cols-2 row-cols-md-3 row-cols-xl-4
							            justify-content-center
							          "
									id="itemarea"></div>
							</div>
							--<div class="card-footer bg-whitesmoke">
								<table id="showpage" class="d-flex justify-content-center">
									<tr>
										<td colspan="2" align="right"><c:forEach var="i"
												begin="1" end="${totalPages}" step="1">
												<button class="btn btn-outline-secondary" id="myPage"
													value="${i}" onclick="change(${i})">${i}</button>
											</c:forEach></td>
									</tr>
								</table>

							--</div>
						</div>
					</div>
				</section>
			</div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
		</div>
	</div>

	<%@include file="../frontcommonpages/shopbottom.jsp"%>
	
	
	<section style="margin-top: 3%;">
	<div class="container">
		<div class="row">
			
				<div class="col-md-4 col-sm-6">
					<div class="card  mb-3"
						style="max-width: 20rem; max-height: 50rem;">
						<div class="card-header"></div>
						<div class="card-body">
							<div
									class="
							            row
							            gx-4 gx-lg-5
							            row-cols-2 row-cols-md-3 row-cols-xl-4
							            justify-content-center
							          "
									id="itemarea"></div>
						</div>
					</div>
				</div>
			
		</div>
		
	</div>
</section>
	
	
	
	
	
	
	
	
	
	
	

	<script>  
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
     	   type:'POST',
     	   url:'queryallcouponsbypage/' + indexPage,
     	   dataType:'JSON',
     	   contentType:'application/json',
     	   success: function(data) {
     	     var json = JSON.stringify(data, null, 2);
     	     var parsedObjinArray = JSON.parse(json);
     	     var itemarea = $('#itemarea');
     	     $('#itemarea').empty("");
     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
     	 		 
     	 		//if(n.category=="折扣券" || n.category=="開卡禮"){
     	     var item = 
     	    "<div class='col mb-5'>"+
              "<div class='card h-100'>"+ 
       
                "<div class='card-body p-4'>" +
                  "<div class='text-center'>" +
                    "<h5 class='fw-bolder'>"+n.couponName+"</h5>"+
                    "<div class='d-flex justify-content-center small text-warning mb-2' >"+
                      "<div class='bi-star-fill'></div>"+
                      "<div class='bi-star-fill'></div>"+
                      "<div class='bi-star-fill'></div>"+
                      "<div class='bi-star-fill'></div>"+
                      "<div class='bi-star-fill'></div>"+
                   "</div>"+
                    "<span>$"+n.couponPrice+"</span>" +
                 " </div>"+
                "</div>"+
               
              
                "<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>"+
                  "<div class='text-center'>"+
                   "<a class='btn btn-outline-dark mt-auto' href='#' >立即領取</a>"+
                  "</div>"+
                "</div>"+
              "</div>"+
            "</div>" ;
     	 		//}
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
