<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<body class="layout-2">
	<div id="app">
		<div class="main-wrapper">

			<%@include file="../frontcommonpages/shopheader.jsp"%>



			<!-- Page content-->
			<div class="container mt-5">

				<section class="py-5">
					<div class="container px-4 px-lg-5 my-5">
						<div class="row gx-4 gx-lg-5 align-items-center">
							<div class="col-md-6">
								<img class="card-img-top mb-5 mb-md-0"
									src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg"
									alt="..." id="couponImg" />
							</div>
							<div class="col-md-6">
								<div class="small mb-1" id="couponId"></div>
								<h1 class="display-5 fw-bolder" id="couponName"></h1>
								<div class="fs-5 mb-5">
									<span class="text-decoration-line-through" id="couponPrice"></span>
									<span id="couponPriceDiscount"></span>
								</div>
								<p class="lead" id="couponInfo"></p>
								<div class="d-flex">
									<input class="form-control text-center me-3" id="inputQuantity"
										type="num" value="1" style="max-width: 3rem" />
									<button class="btn btn-outline-dark flex-shrink-0"
										type="button">
										<i class="bi-cart-fill me-1"></i> Add to cart
									</button>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- Related items section-->
				<section>
					<div class="card">
						<div class="card-header">
							<h2 class="fw-bolder mb-4">Related products</h2>
						</div>
						<div class="card-body">
							<div
								class="
							            row
							            gx-4 gx-lg-5
							            row-cols-2 row-cols-md-3 row-cols-xl-4
							            justify-content-center
							          "
								id="relatedarea"></div>
						</div>
						<div class="card-body"></div>
					</div>
				</section>
				<script>
		                  $(function () {
		                	  
		                	  var url = location.href;
		                	  
		                	  if(url.indexOf('?')!=-1){
		                		  var ary1 = url.split('?');
		                		  var ary2 = ary1[1].split('&');
		                		  var couponId =decodeURI(ary2[0].substr(9));
		                		  var couponName =decodeURI(ary2[1].substr(11));
		                	  }
		              
									$.ajax({
										   type:'GET',
						               	   url:'shopcouponitem.controller',
						               	   dataType:'JSON',
						               	   contentType:'application/json',
						               	   success(res) {
						               	   let coupons=res;
						               	   
						               	   for(let i=0;i<coupons.length;i++){					      
						               		  
						               		   if(couponId==coupons[i].couponId && couponName==coupons[i].couponName){
						               			
						               			   $('#couponId').text("序號:"+coupons[i].couponId);
						               			   $('#couponName').text(coupons[i].couponName);
						               			   $('#couponPrice').text("$"+coupons[i].couponPrice);
						               			   $('#couponPriceDiscount').text("$"+Math.round(coupons[i].couponPrice*0.9));
						               			   $('#couponInfo').text(coupons[i].couponInfo);
						               			   $('#couponImg').attr("src",coupons[i].couponImg);	
						               			  						               						               			
						               		   }						               		   
						               	   }						 			
										}								   
									})											
								});
		                  
		                  $(function () {
		                	  var url = location.href;
		                	  
				                	  if(url.indexOf('?')!=-1){
				                	   var ary1 = url.split('?');
				                       var ary2 = ary1[1].split('&');
				                	   var couponId =decodeURI(ary2[0].substr(9));
				                	   var couponName =decodeURI(ary2[1].substr(11));
				                	   console.log(couponName);
				                		 
				                	  }
				              
									$.ajax({
									 type:'GET',
								     url:'releteCouponItem',
								     dataType:'JSON',
								     data:{"couponName":couponName},
								     contentType:'application/json',
								     success(res) {

								              var json = JSON.stringify(res, null, 3);
         	                                  var parsedObjinArray = JSON.parse(json);
								              var relatedarea = $('#relatedarea');
								               $('#relatedarea').empty("");
								               $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
								            	   
								            	   for(let i=0;i<res.length;i++){					      
								               		  	
										               		  if(couponName==res[i].couponName){
										               												               		
										               				var category=res[i].category;
										               			 console.log(category);
										               			 }
										               	   }
								               
								               if(category==n.category){				            	   
		                	            var item =    
											"<div class='col mb-5'>"+ 
												"<div class='card h-100'>"+ 
													<!-- Product image-->
													"<img class='card-img-top'src='"+n.couponImg+"'/>"+ 
													<!-- Product details-->
													"<div class='card-body p-4'>"+ 
														"<div class='text-center'>"+ 
															<!-- Product name-->
															"<h5 class='fw-bolder'>"+n.couponName+"</h5>"+
															<!-- Product price-->
															"<span class='text-decoration-line-through'id='couponPriceRelete'>$"+n.couponPrice+"</span>" +
															"<span id='couponPriceDiscountRelete'>$"+Math.round(n.couponPrice*0.9)+"</span>" +
														"</div>"+ 
													"</div>"+ 
													<!-- Product actions-->
													"<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>"+ 
														"<div class='text-center'>"+ 
															"<a class='btn btn-outline-dark mt-auto' href='shopCouponItemEntry.controller?couponId="+n.couponId+"&couponName="+n.couponName+"' id='a'>Search</a>"+
														"</div>"+ 
													"</div>"+ 
												"</div>"+ 
											"</div>";
								               }
											 relatedarea.append(item);
								               })
								     },
							         	error: function() {
							         	    console.log("error");
							         	}
									})
		                  })           
						</script>

			</div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
		</div>
	</div>

	<%@include file="../frontcommonpages/shopbottom.jsp"%>

	<script>
		
	</script>
</body>
</html>
