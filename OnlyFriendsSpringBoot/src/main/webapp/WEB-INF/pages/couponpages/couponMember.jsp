<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
</head>
<style>

.card1 {
  width: 400px;
  height: 180px;
  border-radius: 5px;
  box-shadow: 0 4px 6px 0 rgba(0, 0, 0, 0.2);
  background-color: #fff;
  padding: 10px 10px;
  position: relative;
  margin:20px;

}
.card1::after {
  position: absolute;
  content: "";
  height: 40px;
  right: -20px;
  border-radius: 40px;
  z-index: 1;
  top: 70px;
  background-color: #DDDDDD;

  width: 40px;
}

.card1::before {
  position: absolute;
  content: "";
  height: 40px;
  left: -20px;
  border-radius: 40px;
  z-index: 1;
  top: 70px;
  background-color:	#DDDDDD;
 
  width: 40px;
}

.main1 {
  display: flex;
  justify-content: space-between;
  padding: 0 10px;
  align-items: center;
  width:100%;
  margin-top:13px;
}


.co-img img {
 width:30%;

}
.vertical {
  border-left: 5px dotted black;
  height: 100px;
  position: absolute;
  left: 40%;
}
.content{
  color: #565656;
  width:70%;
  text-align:center;
}
.content h1 {
  font-size: 35px;
}

.content h1 span {
  font-size: 18px;
}
.content h2 {
  font-size: 18px;
  text-transform: uppercase; 
}

.content p {
  font-size: 16px;
  color: #696969;
}

#button{padding-left:7%;margin-buttom:5%;}

</style>
<body>
<body class="layout-2">
	<div id="app">
		<div class="main-wrapper">

			<%@include file="../frontcommonpages/shopheader.jsp"%>

			 <div class="main-sidebar">
			 
				<aside id="sidebar-wrapper">
			<%@include file="../frontcommonpages/shopsider.jsp"%>
					<!-- <div class="card">
						<div class="card-header">
							<h4>Search by</h4>
						</div>
						<div class="card-body">
							<div class="container d-flex flex-column">
								<input name="queryVal" id="queryVal" class="form-control"
									type="search" placeholder="Search" aria-label="Search"
									data-width="250">
								<button class="btn" type="submit" id="Search">
									<i class="fas fa-search"></i>
								</button>
								<button class="badge badge-primary mb-2" id="travel"
									name="travel" value="優惠券-旅遊">Travel</button>
								<button class="badge badge-secondary mb-2" id="food" name="food"
									value="優惠券-美食">Food</button>
								<button class="badge badge-success mb-2" id="sports"
									name="sports" value="優惠券-運動">Sports</button>
								<button class="badge badge-danger mb-2" id="accommodation"
									name="accommodation" value="優惠券-住宿">Accommodation</button>
							</div>
						</div>
					</div>-->
				</aside>
			</div>



			<!-- Main Content -->
			<div class="main-content">
				<section class="section">

					<div class="section-body">
						<div class="card">
							<div >
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
									<li class="nav-item"><a class="nav-link active"
										href="couponMember.controller">領取優惠券 <span
											class="visually-hidden">(current)</span>
									</a></li>
									<li class="nav-item"><a class="nav-link" href="myCouponEntry.controller" id="mycoupon">我的優惠券</a>
									</li>
								</ul>

							</div>
						</div>
					</nav>
							</div>
							<div class="card-body " style="background-color: #DDDDDD;">
							<form action="updatecouponUsers.controller" method="post" enctype="multipart/form-data">
							<div id="button">
							<input placeholder="請輸入優惠券序號" type="text" name="couponRecord" id="couponRecord">
							<button id="couponGet" class="btn btn-primary">領取</button>
							</div>
							</form>				
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
				</section>
			</div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
		</div>
	</div>

	<%@include file="../frontcommonpages/shopbottom.jsp"%>



	<script>
	
	 $(function () {
   
				$.ajax({
				 type:'GET',
			     url:'couponMemberCheck.controller',
			     dataType:'JSON',     
			     contentType:'application/json',
			     success(res) {
			              var json = JSON.stringify(res, null, 3);
                          var parsedObjinArray = JSON.parse(json);
			              var itemarea = $('#itemarea');
			               $('#itemarea').empty("");
			               $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件			    

				               	var d=new Date();
				                let theYear = d.getFullYear();
				               	let theMonth = d.getMonth()+1 ;
				               	let theDate = d.getDate();  				               	
				                let d1=n.couponEndDate.split("-");

			            	   
				            if(d1[0]>theYear || d1[0]>=theYear && d1[1]>theMonth || d1[0]>=theYear && d1[1]==theMonth && d1[2]>=theDate)     {				            					       
   	                       var item =    
   	     	                "<div class='card1'>"+
   	                        "<div class='main1'>"+
   	                        "<div class='co-img'>"+ 
   	                        
   	                        "<img class='card-img-top'src='"+n.couponImg+"' style='width: 135px'/>"+ 
   	                        "</div>"+
   	                        "<div class='vertical'></div>"+    
   	                        "<div class='content'>" +
   	                        "<h6>序號:"+n.couponId+"</h6>"+
   	                        "<h2>"+n.couponName+"</h2>"+
   	                        "<h1>$"+n.couponPrice+"<span>Coupon</span></h1> "+
   	                        "<p>截止日:"+n.couponEndDate+"</p>"+
   	                        " </div>"+
   	                     "</div>"+
   	                   "</div>" ;
				            }
   	                   itemarea.append(item);
   	            	       });			               		                 	         
   	            	},
   	            	error: function() {
   	            	    console.log("error");
   	            	}		    
				})
     })
     
     
      $(function () {
            $('#mycoupon').click(function(){
            	       	
            		$.ajax({
       				 type:'GET',
       			     url:'couponMemberCheck.controller',
       			     dataType:'JSON',     
       			     contentType:'application/json',
       			     success(res) {
       			              var json = JSON.stringify(res, null, 3);
                                 var parsedObjinArray = JSON.parse(json);
       			              var itemarea = $('#itemarea');
       			               $('#itemarea').empty("");
       			               $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件			    

       				               	var d=new Date();
       				                let theYear = d.getFullYear();
       				               	let theMonth = d.getMonth()+1 ;
       				               	let theDate = d.getDate();  				               	
       				                let d1=n.couponEndDate.split("-");

       			            	   
       				            if(d1[0]>theYear || d1[0]>=theYear && d1[1]>theMonth || d1[0]>=theYear && d1[1]==theMonth && d1[2]>=theDate)     {				            					       
          	                       var item =    
          	     	                "<div class='card1'>"+
          	                        "<div class='main1'>"+
          	                        "<div class='co-img'>"+ 	                       
          	                        "<img class='card-img-top'src='"+n.couponImg+"' style='width: 135px'/>"+ 
          	                        "</div>"+
          	                        "<div class='vertical'></div>"+    
          	                        "<div class='content'>" +
          	                        "<h6>序號:"+n.couponId+"</h6>"+
          	                        "<h2>"+n.couponName+"</h2>"+
          	                        "<h1>$"+n.couponPrice+"<span>Coupon</span></h1> "+
          	                        "<p>截止日:"+n.couponEndDate+"</p>"+
          	                        " </div>"+          	                   
          	                     "</div>"+
          	                   "</div>" ;
       				            }
          	                   itemarea.append(item);
          	            	       });
       			               
       			                 	         
          	            	},
          	            	error: function() {
          	            	    console.log("error");
          	            	}		
            })	
     })  
      }) 
 
    // $(function () {
        //    $('#couponGet').click(function(){
          //  	var couponGetId=$('#couponGetId').val();
          //  	console.log(couponGetId);
           // 	$('#loadImg').css("display","none");
          //  	$.ajax({
				//	   type:'GET',
	          //     	   url:'updatecouponUsers.controller',
	          //     	   dataType:'JSON',
	          //     	   contentType:'application/json',
	          //     	   success(res) {
	          //     	   let coupons=res;
	          //     	console.log(coupons);
	          //     	for(let i=0;i<coupons.length;i++){  
	               		
	             //  		var couponId=coupons[i].couponId;               		
	             //  		console.log(couponId);              		               		
	            //   	if(couponId==couponGetId){
	           //    	   Swal.fire('Get this coupon!!!');					 			
	               		
	          //     	}

	               	
	       //        	}
	           		
			//		}				   
			//	})			
         //   })	
   //  })      
	 
	
	
	
     
     
     
     
     
     
     
     
     
     
    </script>



	<!--   <script>
    
  //search
 	$(function () {

  		$('#Search').click(function () {
  		let indexPage = 1;
  		let queryVal = $('#queryVal').val();
  		console.log(queryVal);
    	$.ajax({
     	   type:'POST',
     	   url:'queryallcoupons/' + indexPage,
     	   dataType:'JSON',
     	   data:{"queryVal":queryVal},
     	   success: function(data) {
     		   
     		   
     		   console.log(data);
     	     let json = JSON.stringify(data, null, 3);
     	     let parsedObjinArray = JSON.parse(json);
     	     let itemarea = $('#itemarea');
     	     $('#itemarea').empty("");
     	  
     	   
     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
     	     let item = 		
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
     	 		
            itemarea.append(item);
     	       });
  
     	},
     	error: function() {
     	    console.log("error");
     	}
     	});
     	})
 	})
 	//Travel
 	$(function () {

  		$('#travel').click(function () {
  		let indexPage = 1;
  		let travel=$('#travel').val();
 		
    	$.ajax({
     	   type:'POST',
     	   url:'queryallCategoryTravel/' + indexPage,
     	   data:{"travel":travel},
     	   dataType:'JSON',
     	   success: function(data) {
     		   
     		   
     		 console.log(data);
     	     let json = JSON.stringify(data, null, 3);
     	     let parsedObjinArray = JSON.parse(json);
     	     let itemarea = $('#itemarea');
     	     $('#itemarea').empty("");
     	  
     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
     	     let item = 		
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
     	 		
            itemarea.append(item);
     	       });
  
     	},
     	error: function() {
     	    console.log("error");
     	}
     	});
     	})
 	})
 	
 	//food
 	$(function () {

  		$('#food').click(function () {
  			let indexPage = 1;
  		let food=$('#food').val();
  		 console.log(food);
 		
    	$.ajax({
     	   type:'POST',
     	   url:'queryallCategoryFood/' + indexPage,
     	   data:{"food":food},
     	   dataType:'JSON',
     	   success: function(data) {
     		   
     		   
     		 console.log(data);
     	     let json = JSON.stringify(data, null, 3);
     	     let parsedObjinArray = JSON.parse(json);
     	     let itemarea = $('#itemarea');
     	     $('#itemarea').empty("");
     
     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
     	     let item = 		
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
     	 		
            itemarea.append(item);
     	       });
  
     	},
     	error: function() {
     	    console.log("error");
     	}
     	});
     	})
 	})
 	
 	//sports
 	$(function () {

  		$('#sports').click(function () {
  			let indexPage = 1;
  		let sports=$('#sports').val();
  		 console.log(sports);
 		
    	$.ajax({
     	   type:'POST',
     	   url:'queryallCategorySports/' + indexPage,
     	   data:{"sports":sports},
     	   dataType:'JSON',
     	   success: function(data) {
     		   
     		   
     		 console.log(data);
     	     let json = JSON.stringify(data, null, 3);
     	     let parsedObjinArray = JSON.parse(json);
     	     let itemarea = $('#itemarea');
     	     $('#itemarea').empty("");
 
     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
     	     let item = 		
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
     	 		
            itemarea.append(item);
     	       });
  
     	},
     	error: function() {
     	    console.log("error");
     	}
     	});
     	})
 	})
 	
 	//accommodation
 	$(function () {

  		$('#accommodation').click(function () {
  			let indexPage = 1;
  		let accommodation=$('#accommodation').val();
  		 console.log(accommodation);
 		
    	$.ajax({
     	   type:'POST',
     	   url:'queryallCategoryAccommodation/' + indexPage,
     	   data:{"accommodation":accommodation},
     	   dataType:'JSON',
     	   success: function(data) {
     		   
     		   
     		 console.log(data);
     	     let json = JSON.stringify(data, null, 3);
     	     let parsedObjinArray = JSON.parse(json);
     	     let itemarea = $('#itemarea');
     	     $('#itemarea').empty("");
     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
     	     let item = 		
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
     	 		
            itemarea.append(item);
     	       });
  
     	},
     	error: function() {
     	    console.log("error");
     	}
     	});
     	})
 	})
    
    
     
     </script>-->
</body>
</html>
