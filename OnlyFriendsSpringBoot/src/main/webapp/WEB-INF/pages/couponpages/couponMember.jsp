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
	box-shadow: 0 4px 6px 0 rgba(0, 0, 0, 0.5);
	background-color: #fff;
	padding: 10px 10px;
	position: relative;
	margin: 20px;
}

.card1::after {
	position: absolute;
	content: "";
	height: 40px;
	right: -20px;
	border-radius: 40px;
	z-index: 1;
	top: 70px;
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
	width: 40px;
}

.main1 {
	display: flex;
	justify-content: space-between;
	padding: 0 10px;
	align-items: center;
	width: 100%;
	margin-top: 13px;
}

.co-img img {
	width: 30%;
}

.vertical {
	border-left: 5px dotted black;
	height: 100px;
	position: absolute;
	left: 40%;
}

.content {
	color: #565656;
	width: 70%;
	text-align: center;
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

#button {
	padding-left: 7%;
	margin-buttom: 5%;
}

body {
	font-size: 1.2rem
}

#sidebar-wrapper {
	margin-top: -50%;
}

#relative {
	position: relative;
	width: 560px;
	height: 315px;
	margin: auto;
}

#absolute {
	position: absolute;
	right: 0;
	top: 0;
	width: 30px;
	height: 30px;
}

#close {
	width: 80%;
	margin-left: auto;
	opacity: 0.8;
}

.modal-dialog {
	margin-top: 100px;
}
</style>
<body>
<body class="layout-2">
	<div id="app">
		<div class="main-wrapper">

			<%@include file="../frontcommonpages/shopheader.jsp"%>


			<div class="main-sidebar">

				<aside id="sidebar-wrapper">
					<%@include file="../frontcommonpages/shopsider.jsp"%>

				</aside>
			</div>



			<!-- Main Content -->
			<div class="main-content">
				<section class="section">

					<div class="section-body">
						<div class="card" style="background-color: ##FFFAF2;">
							<div>
								<!--  	<nav class="navbar navbar-expand-lg " style="background-color: #DDDDDD;">
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
												<li class="nav-item"><a class="nav-link"
													href="myCouponEntry.controller" id="mycoupon">我的優惠券</a></li>
											</ul>

										</div>
									</div>
								</nav>-->
								<!--<ul id="ul">
							  	<li>
										<a class="nav-link" href="couponMember.controller"><span style="color:#6E6E6E;font-weight:bold;">領取優惠券</span></a>
									</li>
									<li>
										<a class="nav-link" href="myCouponEntry.controller"><span style="color:#6E6E6E;font-weight:bold;">我的優惠券</span></a>
									</li>

								</ul>-->
								<!--  	<button type="button" class="btn btn-link"><h3>領取優惠券</h3></button>
								<button type="button" class="btn btn-link"><h3>我的優惠券</h3></button>
								<hr>-->

								<ul class="nav nav-tabs">
									<li class="nav-item"><a class="nav-link "
										aria-current="page" href="#" id="money">現金券</a></li>
									<li class="nav-item"><a class="nav-link" href="#"
										id="discount">折扣券</a></li>
									<li class="nav-item"><a class="nav-link" href="#"
										id="freight">運費券</a></li>
									<li class="nav-item"><a class="nav-link" href="#"
										id="cooperate">異業券</a></li>
									<li class="nav-item"><a class="nav-link" href="#"
										id="activity">活動券</a></li>
									<li class="nav-item"><a class="nav-link"
										href="myCouponEntry.controller" id="mycoupon">我的優惠券</a></li>

								</ul>
							</div>

							<div class="card-body ">
								<!--  <div>
							<button type="button" class="btn btn-light disabled" id="money">現金券</button>
							<button type="button" class="btn btn-light disabled" id="discount">折扣券</button>
							<button type="button" class="btn btn-light disabled" id="freight">運費券</button>
							</div>-->
								<!-- <form action="updatecouponUsers.controller" method="post"
									enctype="multipart/form-data">-->
								<div id="button">
									<input placeholder="請輸入優惠券序號" type="text" name="couponRecord2"
										id="couponRecord2">
									<button id="couponGet" class="btn btn-primary"
										data-bs-toggle="modal" data-bs-target="#search">領取</button>
									<span>${Error}</span>
								</div>
								<!-- </form>-->
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

	<div class="modal fade" id="search" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-dialog-scrollable">


				<div id="ad">
					<div id="relative">

						<iframe width="560" height="315"
							src="https://www.youtube.com/embed/gP2aYfSbY5I"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen id="iframe"></iframe>
						<form action="updatecouponUsers.controller" method="post"
							enctype="multipart/form-data">
							<input type="text" name="couponRecord" value="" id="couponRecord">
							<div id="absolute">
								<button type="submit" id="submit">
									<img src="images/couponPic/close.png" id="close">
								</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	
	var couponRecord;
	var cid=[];
	var cprice=[];
	//console.log(cid);
	
	//console.log(cprice);
	 $(function () {
		
         $('#close').css("display", "none");
         $('#iframe').css("display", "none");
         $('#couponRecord').css("display", "none");
         $('#submit').css("display", "none");

         $('#couponGet').click(function () {
        	        	
        	 couponRecord=$('#couponRecord2').val();
        	
        	 $('#couponRecord').val(couponRecord);
             var ifrm;
            // console.log(arr[0])
            console.log("cid[0]"+cid[0]);
            for(let i=0; i < cid.length;i++){
            	if(cid[i]==couponRecord){
            		console.log(cid[i]);
             $('#iframe').css("display", "block");
             ifrm = $('#iframe').attr("src");
             $('#iframe').attr('src', ifrm + "?autoplay=1&mute=1");
             var closeView = setInterval(closeView, 10000);
            	}else{
            		
            	}
            }
           //if(cid===couponRecord){
        	   

           
             
          // }else{
        	   
          // }
             function closeView() {
                 $('#close').css("display", "block");
                 $('#submit').css("display", "block");
             }
             
        	   

         })

         $('#close').click(function () { 
        	 
        	 
        	 
             $('#ad').hide().show();
             Swal.fire({
            	  position: 'top-end',
            	  icon: 'success',
            	  title: '已領取',
            	  showConfirmButton: false,
            	  timer: 1500
            	})
            
         })

     });
	
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
								//cid = n.couponId;
								cid.push(n.couponId)
								cprice.push(n.couponPrice)
			            	  //console.log(cid)
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
      $(function () {
            $('#money').click(function(){
	
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
        $(function () {
            $('#discount').click(function(){
            	       	
            		$.ajax({
       				 type:'GET',
       			     url:'couponMember1Check.controller',
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
          	                        "<h1>"+n.couponPrice+"%<span>Coupon</span></h1> "+
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
      
       $(function () {
            $('#freight').click(function(){
            	       	
            		$.ajax({
       				 type:'GET',
       			     url:'couponMember2Check.controller',
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
          	                        "<h1>"+n.couponPrice+"%<span>Coupon</span></h1> "+
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
      
       $(function () {
            $('#cooperate').click(function(){
            	       	
            		$.ajax({
       				 type:'GET',
       			     url:'couponMember3Check.controller',
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
      
      $(function () {
            $('#activity').click(function(){
            	       	
            		$.ajax({
       				 type:'GET',
       			     url:'couponActivity.controller',
       			     dataType:'JSON',     
       			     contentType:'application/json',
       			     success(res) {
       			              var json = JSON.stringify(res, null, 3);
                                 var parsedObjinArray = JSON.parse(json);
       			              var itemarea = $('#itemarea');
       			               $('#itemarea').empty("");
       			               $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件			    

       				        
       				            			            					       
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
          	                        "<p>倒數時間:"+n.couponEndDate+"</p>"+
          	                        " </div>"+          	                   
          	                     "</div>"+
          	                   "</div>" ;
       				          
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
