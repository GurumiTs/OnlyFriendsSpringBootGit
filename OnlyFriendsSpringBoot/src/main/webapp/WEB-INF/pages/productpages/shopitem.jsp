<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
#shoppingCartTable {
	font-size: 15px;
}

</style>
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
								<img class="card-img-top mb-5 mb-md-0" id="proPhoto"
									src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg"
									alt="..." />
							</div>
							<div class="col-md-6">
								<div class="small mb-1 d-none" id="proId"></div>
								<h1 class="display-5 fw-bolder" id="proName"></h1>
								<div class="fs-5 mb-5">
									<span class="text-decoration-line-through" id="proPrice"></span>
									<span id="proPriceDiscount"></span>
								</div>
								<p class="lead" id="proDescription"></p>
								<div class="d-flex">
									<input class="form-control text-center me-3" id="amount"
										name="amount" type="text" value="1" style="max-width: 3rem" />
									<a
										class="btn btn-outline-dark flex-shrink-0 add-to-cart addCart"
										id="addchart" data-bs-toggle="modal"
										data-bs-target="#staticBackdrop"> <i
										class="bi-cart-fill me-1"></i> Add to cart
									</a>

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
			</div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
		</div>
	</div>

	<%@include file="../frontcommonpages/shopbottom.jsp"%>

	<!-- shoppingchart -->



	<!-- Modal -->

	<script>
	$(function () {
	  shopcartnumact();  	  
	 $('#addtocarticon').on('click',findcart)	
  	  $('#addchart').on('click',loadcart)


  	  var url = location.href;
  	  
  	  if(url.indexOf('?')!=-1){
  		  var ary1 = url.split('?');
  		  var ary2 = ary1[1].split('&');
  		  var proId =decodeURI(ary2[0].substr(6));
  		  var proName =decodeURI(ary2[1].substr(8));
  	  }
				$.ajax({
					   type:'GET',
	               	   url:'shopitempage.controller',
	               	   dataType:'JSON',
	               	   contentType:'application/json',
	               	   success(res) {
	               	   let products=res;
	               	   
	               	   for(let i=0;i<products.length;i++){					      
	               		  
	               		   if(proId==products[i].proId && proName==products[i].proName){
	               			   
	               			   $('#proId').text(products[i].proId);
	               			   $('#proName').text(products[i].proName);
	               			   $('#proPrice').text("$"+products[i].proPrice);
	               			   $('#proPriceDiscount').text("$"+Math.round(products[i].proPrice*0.9));
	               			   $('#proDescription').text(products[i].proDescription);
	               			   $('#proPhoto').attr("src",products[i].proPhoto);
	               		   }
	               	   }
					}
				})
		});
	
		//addtocart
			
			function loadcart () {
				let proId=$('#proId').text();
				let amount=$('#amount').val();
			$.ajax({
				type:"post",
				url:"cart",
				dataType: "json",
				data:{ "proId":proId,"amount":amount},
				success:function(data){		     	 
		     	 	shopcartnumact () 
		     	 	shopcartfinaltotal()  
		     	 	findcart()   		     	 	
				},
				error:function(){
					console.log("error");
				}
			})
		}	
		
//findcartlist
			function findcart () {
			$.ajax({
				type:"post",
				url:"getShoppingCars",
				success:function(data){
// 					 console.log(data);
					 var json = JSON.stringify(data,null,4);
		     	     var parsedObjinArray = JSON.parse(json);
		     	     var cartlistitem = $('#cartlistitem');
		     	     $('#cartlistitem').empty("");
		     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
		     	     var item = '<tr id='+n.product.proId+'>'+
		     	     	'<td>'+'<i class="fas fa-times-circle fs-5 deleteitem"></i>'+'</td>'+
		 				'<td class="d-none">'+
		 				'<div class="checkbox">'+
		 				'<label>'+
		 				'<input type="checkbox" id="checkbox'+n.product.proId+'" value="option1" >'+
		 				'</label>'+
		 				'</div>'+
		 				'</td>'+
		 				'<td class="proname">'+n.product.proName+'</td>'+
		 				'<td>'+n.product.proPrice+'</td>'+
		 				'<td>'+'  <button class="btn btn-sm btn-icon btn-light mx-1 minus"><i class="fas fa-minus text-black-50"></i></button>'+'<i id="amount>">'+n.amount+'</i>'+'<button  class="btn btn-sm btn-icon btn-light mx-1 plus"><i class="fas fa-plus text-black-50"></i></button>'+'</td>'+
		 				'<td>'+Math.round(n.product.proPrice*n.amount)+'</td>'+
		 				'</tr>';
		 				cartlistitem.append(item);
		 			if(n.amount == 1){
		 				$('.minus').prop('disabled',true)
		 			}	
		 				
		     	    });
		     	 	$(".minus").on("click",minus)	
		     	 	shopcartfinaltotal()  	
		     	 	$(".deleteitem").on("click",deleteitem)
		     	 	$(".plus").on("click",plus)
				},
				error:function(){
					console.log("error");
				}
			})
		}	
		
		
		function minus(){
			let id = $(this).closest('tr').attr('id')
			$.ajax({
				type:"get",
				url:"minusshopcart",
				data:{"proId":id},
				success:function(data){	
					console.log(data)
		     	 	shopcartnumact ()  
		     	 	findcart()	
	     	 	
				},
				error:function(){
					console.log("error");
				}
			})		
		}
		
		function plus(){
			let id = $(this).closest('tr').attr('id')
			$.ajax({
				type:"get",
				url:"plusshopcart",
				data:{"proId":id},
				success:function(data){	
					console.log(data)
		     	 	shopcartnumact ()  
		     	 	findcart()	
	     	 	
				},
				error:function(){
					console.log("error");
				}
			})		
		}
		
		function deleteitem(){
			let id = $(this).closest('tr').attr('id')
			console.log(id);
			$.ajax({
				type:"get",
				url:"deleteshopcartitem",
				data:{"proId":id},
				success:function(data){	
					console.log(data)
		     	 	shopcartnumact ()  
		     	 	findcart()	   	 	
				},
				error:function(){
					console.log("error");
				}
			})		
		}
		
		
		
		
		
		
		
		
		
//related item
	                   $(function () {
		                	  var url = location.href;
		                	  
				                	  if(url.indexOf('?')!=-1){
				                	   var ary1 = url.split('?');
				                       var ary2 = ary1[1].split('&');
				                	   var proId =decodeURI(ary2[0].substr(6));
				                	   var proName =decodeURI(ary2[1].substr(8));
				                	   
				                		 
				                	  }
				              
									$.ajax({
									 type:'GET',
								     url:'releteproductItem',
								     dataType:'JSON',
								     data:{"proName":proName},
								     contentType:'application/json',
								     success(res) {
								             //    let coupons=res;
								               
								               var json = JSON.stringify(res, null, 3);
         	                                   var parsedObjinArray = JSON.parse(json);
								              var relatedarea = $('#relatedarea');
								               $('#relatedarea').empty("");
								               $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
		                	            
								            	   
								          var item =   
								    	 
											"<div class='col mb-5'>"+ 
												"<div class='card h-100'>"+ 
													<!-- Product image-->
													"<img class='card-img-top'src='"+n.proPhoto+"'/>"+ 
													<!-- Product details-->
													"<div class='card-body p-4'>"+ 
														"<div class='text-center'>"+ 
															<!-- Product name-->
															"<h5 class='fw-bolder'>"+n.proName+"</h5>"+
															<!-- Product price-->
															"<span class='text-decoration-line-through'id='couponPriceRelete'>$"+n.proPrice+"</span>" +
															"<span id='couponPriceDiscountRelete'>$"+Math.round(n.proPrice*0.9)+"</span>" +
														"</div>"+ 
													"</div>"+ 
													<!-- Product actions-->
													"<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>"+ 
														"<div class='text-center'>"+ 
															"<a class='btn btn-outline-dark mt-auto' href='shopitementrypage?proId="+n.proId+"&proName="+n.proName+"'>Viewoptions</a>"+ 
														"</div>"+ 
													"</div>"+ 
												"</div>"+ 
											"</div>";

										
											 relatedarea.append(item);
								               })
								     },
							         	error: function() {
							         	    console.log("error");
							         	}
									})
		                	  
		                	  
		                	  
		                  })

//shoppingcartnumber
		                  
							
	                   function shopcartnumact () {
							$.ajax({
								type:"post",
								url:"shoppingcartnumber",
								success:function(data){
// 									console.log(data);
									var cartcount = $('#cartcount');
						            $('#cartcount').empty("");
									var cartnum=data;
									cartcount.html(cartnum)
								}
								,error: function(error){
									console.log(error);
								}
							})
						}
// 		shoppingcartfinaltotal
					  function shopcartfinaltotal () {						  
							$.ajax({
								type:"get",
								url:"shopcarttotal",
								dataType: "json",
								success:function(data){
									console.log(data);
									var json = JSON.stringify(data,null,4);
						     	    var parsedObjinArray = JSON.parse(json);
									var finaltotal = $('#finaltotal');
						            $('#finaltotal').empty("");
									var finaltotals=data;
									finaltotal.html(finaltotals)
//				 					 
								}
								,error: function(error){
									console.log(error);
								}
							})
						}
						
		//			
						
						

		
	</script>
</body>
</html>
