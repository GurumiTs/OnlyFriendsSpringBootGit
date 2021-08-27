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
								<div class="small mb-1" id="proId"></div>
								<h1 class="display-5 fw-bolder" id="proName"></h1>
								<div class="fs-5 mb-5">
									<span class="text-decoration-line-through" id="proPrice"></span>
									<span id="proPriceDiscount"></span>
								</div>
								<p class="lead" id="proDescription"></p>
								<div class="d-flex">
									<input class="form-control text-center me-3" id="inputQuantity"
										type="num" value="1" style="max-width: 3rem" />
									<a href='#0' class="btn btn-outline-dark flex-shrink-0 add-to-cart"
										type="button" id="addchart" data-bs-toggle="modal" 
										data-bs-target="#staticBackdrop" >
										<i class="bi-cart-fill me-1"></i> Add to cart
									</a>
									
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- Related items section-->
				<section class="py-5 bg-light">
					<div class="container px-4 px-lg-5 mt-5">
						<h2 class="fw-bolder mb-4">Related products</h2>
						<div
							class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
							<div class="col mb-5">
								<div class="card h-100">
									<!-- Product image-->
									<img class="card-img-top"
										src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
										alt="..." />
									<!-- Product details-->
									<div class="card-body p-4">
										<div class="text-center">
											<!-- Product name-->
											<h5 class="fw-bolder">Fancy Product</h5>
											<!-- Product price-->
											$40.00 - $80.00
										</div>
									</div>
									<!-- Product actions-->
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a class="btn btn-outline-dark mt-auto" href="#">View
												options</a>
										</div>
									</div>
								</div>
							</div>
							<div class="col mb-5">
								<div class="card h-100">
									<!-- Sale badge-->
									<div class="badge bg-dark text-white position-absolute"
										style="top: 0.5rem; right: 0.5rem">Sale</div>
									<!-- Product image-->
									<img class="card-img-top"
										src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
										alt="..." />
									<!-- Product details-->
									<div class="card-body p-4">
										<div class="text-center">
											<!-- Product name-->
											<h5 class="fw-bolder">Special Item</h5>
											<!-- Product reviews-->
											<div
												class="d-flex justify-content-center small text-warning mb-2">
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
											</div>
											<!-- Product price-->
											<span class="text-muted text-decoration-line-through">$20.00</span>
											$18.00
										</div>
									</div>
									<!-- Product actions-->
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a class="btn btn-outline-dark mt-auto" href="#">Add to
												cart</a>
										</div>
									</div>
								</div>
							</div>
							<div class="col mb-5">
								<div class="card h-100">
									<!-- Sale badge-->
									<div class="badge bg-dark text-white position-absolute"
										style="top: 0.5rem; right: 0.5rem">Sale</div>
									<!-- Product image-->
									<img class="card-img-top"
										src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
										alt="..." />
									<!-- Product details-->
									<div class="card-body p-4">
										<div class="text-center">
											<!-- Product name-->
											<h5 class="fw-bolder">Sale Item</h5>
											<!-- Product price-->
											<span class="text-muted text-decoration-line-through">$50.00</span>
											$25.00
										</div>
									</div>
									<!-- Product actions-->
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a class="btn btn-outline-dark mt-auto" href="#">Add to
												cart</a>
										</div>
									</div>
								</div>
							</div>
							<div class="col mb-5">
								<div class="card h-100">
									<!-- Product image-->
									<img class="card-img-top"
										src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
										alt="..." />
									<!-- Product details-->
									<div class="card-body p-4">
										<div class="text-center">
											<!-- Product name-->
											<h5 class="fw-bolder">Popular Item</h5>
											<!-- Product reviews-->
											<div
												class="d-flex justify-content-center small text-warning mb-2">
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
											</div>
											<!-- Product price-->
											$40.00
										</div>
									</div>
									<!-- Product actions-->
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a class="btn btn-outline-dark mt-auto btn-primary" 
												data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="addtocart"
												href='cart?Id=${proId }'>Add to cart</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
		</div>
	</div>

	<%@include file="../frontcommonpages/shopbottom.jsp"%>

	<!-- shoppingchart -->
	<div class="cd-cart-container empty">
<!-- 		<a href="#0" class="cd-cart-trigger"> -->
<!-- 			購物車 -->
<!-- 			<!-- cart items count --> -->
<!-- 			<ul class="count"> -->
<!-- 				<li>0</li> -->
<!-- 				<li>0</li> -->
<!-- 			</ul> -->
<!-- 		</a> -->
		
		<div class="cd-cart">
			<div class="wrapper">
				<header>
					<h2>購物車</h2>
					<span class="undo">已刪除<a href="#0">復原</a></span>
				</header>
				
				<div class="body">
					<ul>
						<li class="product">
							<div class="product-image">
								<a href="#0"><img alt="placeholder" src="images/productPic/S__10068028.jpg"></a>
							</div>
							<div class="product-details">
								<h3><a href="#0">商品名稱</a></h3>
								<span class="price">$400</span>
								<div class="actions">
									<a href="#0" class="delete-item">刪除</a>
									
									<div class="quantity">
										<label for="cd-product-'+proId+'">件數</label>
										<span class="select">
											<span class="select"><i id="cd-product='+proId+'">1</i></span>
										</span>21
									</div>
								</div>
								
							</div>	
						</li>				
					</ul>
				</div>
				<footer>
					<a href="#0" class="checkout"><em>結算 - $<span>0</span></em></a>
				</footer>
			</div>
		</div>
	</div>

	<!-- Modal -->
<!-- 	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" -->
<!-- 		data-bs-keyboard="false" tabindex="-1" -->
<!-- 		aria-labelledby="staticBackdropLabel" aria-hidden="true"> -->
<!-- 		<div class="modal-dialog"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="modal-header"> -->
<!-- 					<h5 class="modal-title" id="staticBackdropLabel">Shopping Item</h5> -->
<!-- 					<button type="button" class="btn-close" data-bs-dismiss="modal" -->
<!-- 						aria-label="Close"></button> -->
<!-- 				</div> -->
<%-- 				<div class="modal-body">您購買的商品為:<span id="proId">${proId}</span></div> --%>
<!-- 				<div class="modal-footer"> -->
<!-- 					<button type="button" class="btn btn-secondary" -->
<!-- 						data-bs-dismiss="modal">Close</button> -->
<!-- 					<button type="button" class="btn btn-primary">Send</button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<script>
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
	               	   url:'shopitempage.controller',
	               	   dataType:'JSON',
	               	   contentType:'application/json',
	               	   success(res) {
	               	   let products=res;
	               	   
	               	   for(let i=0;i<products.length;i++){					      
	               		  
	               		   if(proId==products[i].proId && proName==products[i].proName){
	               			   
	               			   $('#proId').text("序號:"+products[i].proId);
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
	//addcharticon
	$(document).ready(function() {
	var count = 0;
	$("a.add-to-cart").click(function(event) {
		count++;
		$("a.add-to-cart").addClass("size");
		setTimeout(function() {
			$("a.add-to-cart").addClass("hover");
		}, 200);
		setTimeout(function() {
			$("a.cart > span").addClass("counter");
			$("a.cart > span.counter").text(count);
		}, 400);
		setTimeout(function() {
			$("a.add-to-cart").removeClass("hover");
			$("a.add-to-cart").removeClass("size");
		}, 600);
		event.preventDefault();
	});
});
	
// addtocart
// function addProduct(proName,proId,proPrice,proPhoto) {
//  var quantity = $("#cd-product-"+proId).text();
//  var select='',productAdded='';
 
//  if(quantity==''){
//   var select = '<span class="select">x<i id="cd-product-'+proId+'">1</i></span>';
//   var productAdded = $('<li class="product"><div class="product-image"><a href="#0"><img src="'+proPhoto+'" alt="placeholder"></a></div><div class="product-details"><h3><a href="#0">'+proName+'</a></h3><span class="price">￥'+proPrice+'</span><div class="actions"><a href="#0" class="delete-item">删除</a><div class="quantity"><label for="cd-product-'+ proId +'">件数</label>'+select+'</div></div></div></li>');
//   cartList.prepend(productAdded);
//  }else{
//   quantity = parseInt(quantity);
//   $("#cd-product-"+proId).html(quantity+1);
//  }
// }
// jQuery(document).ready(function($){
//  var cartWrapper = $('.cd-cart-container');
//  //product id - you don't need a counter in your real project but you can use your real product id
//  var productId = 0;
 
//  if( cartWrapper.length > 0 ) {
//   //store jQuery objects
//   var cartBody = cartWrapper.find('.body')
//   var cartList = cartBody.find('ul').eq(0);
//   var cartTotal = cartWrapper.find('.checkout').find('span');
//   var cartTrigger = cartWrapper.children('.cd-cart-trigger');
//   var cartCount = cartTrigger.children('.count')
//   //var addToCartBtn = $('.cd-add-to-cart');
//   var addToCartBtn = $('.add-button');
//   var undo = cartWrapper.find('.undo');
//   var undoTimeoutId;
 
//   //add product to cart
//   addToCartBtn.on('click', function(event){
//    event.preventDefault();
//    addToCart($(this));
//   });
 
//   //open/close cart
//   cartTrigger.on('click', function(event){
//    event.preventDefault();
//    toggleCart();
//   });
 
//   //close cart when clicking on the .cd-cart-container::before (bg layer)
//   cartWrapper.on('click', function(event){
//    if( $(event.target).is($(this)) ) toggleCart(true);
//   });
 
//   //delete an item from the cart
//   cartList.on('click', '.delete-item', function(event){
//    event.preventDefault();
//    removeProduct($(event.target).parents('.product'));
//   });
 
//   //update item quantity
//   cartList.on('change', 'select', function(event){
//    quickUpdateCart();
//   });
 
//   //reinsert item deleted from the cart
//   undo.on('click', 'a', function(event){
//    clearInterval(undoTimeoutId);
//    event.preventDefault();
//    cartList.find('.deleted').addClass('undo-deleted').one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function(){
//     $(this).off('webkitAnimationEnd oanimationend msAnimationEnd animationend').removeClass('deleted undo-deleted').removeAttr('style');
//     quickUpdateCart();
//    });
//    undo.removeClass('visible');
//   });
//  }
 
//  function toggleCart(bool) {
//   var cartIsOpen = ( typeof bool === 'undefined' ) ? cartWrapper.hasClass('cart-open') : bool;
  
//   if( cartIsOpen ) {
//    cartWrapper.removeClass('cart-open');
//    //reset undo
//    clearInterval(undoTimeoutId);
//    undo.removeClass('visible');
//    cartList.find('.deleted').remove();
 
//    setTimeout(function(){
//     cartBody.scrollTop(0);
//     //check if cart empty to hide it
//     if( Number(cartCount.find('li').eq(0).text()) == 0) cartWrapper.addClass('empty');
//    }, 500);
//   } else {
//    cartWrapper.addClass('cart-open');
//   }
//  }
 
//  function addToCart(trigger) {
//   var cartIsEmpty = cartWrapper.hasClass('empty');
//   //update cart product list
//   var proprice = trigger.data('proPrice'),
//    proName = trigger.data('proName'),
//    proId = trigger.data('proId'),
//    proPhoto = trigger.data('proPhoto');
//   addProduct(proName,proId,proPrice,proPhoto);
//   //console.log();
  
//   //update number of items 
//   updateCartCount(cartIsEmpty);
//   //update total price
//   updateCartTotal(trigger.data('proPrice'), true);
//   //show cart
//   cartWrapper.removeClass('empty');
//  }
 
//  function addProduct(proName,proId,proPrice,proPhoto) {
//   //this is just a product placeholder
//   //you should insert an item with the selected product info
//   //replace productId, productName, price and url with your real product info
//   productId = productId + 1;
  
//   var quantity = $("#cd-product-"+proId).text();
//   var select='',productAdded='';
  
//   //console.log(Number(quantity));
//   //console.log(quantity);
  
//   if(quantity==''){
//    var select = '<span class="select">x<i id="cd-product-'+proId+'">1</i></span>';
//    var productAdded = $('<li class="product"><div class="product-image"><a href="#0"><img src="'+proPhoto+'" alt="placeholder"></a></div><div class="product-details"><h3><a href="#0">'+proName+'</a></h3><span class="price">￥'+proPrice+'</span><div class="actions"><a href="#0" class="delete-item">删除</a><div class="quantity"><label for="cd-product-'+ proId +'">件数</label>'+select+'</div></div></div></li>');
//    cartList.prepend(productAdded);
//   }else{
//    quantity = parseInt(quantity);
//    //var select = '<span class="select">x<i id="cd-product-'+proid+'">'+quantity+'</i></span>';
//    $("#cd-product-"+proId).html(quantity+1);
//   }
  
  
//   //var productAdded = $('<li class="product"><div class="product-image"><a href="#0"><img src="img/product-preview.png" alt="placeholder"></a></div><div class="product-details"><h3><a href="#0">'+proname+'</a></h3><span class="price">￥'+price+'</span><div class="actions"><a href="#0" class="delete-item">删除</a><div class="quantity"><label for="cd-product-'+ proid +'">件数x</label><span class="select"><select id="cd-product-'+ proid +'" name="quantity"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option></select></span></div></div></div></li>');
//   //cartList.prepend(productAdded);
//  }
 
//  function removeProduct(product) {
//   clearInterval(undoTimeoutId);
//   cartList.find('.deleted').remove();
  
//   var topPosition = product.offset().top - cartBody.children('ul').offset().top ,
//    productQuantity = Number(product.find('.quantity').find('.select').find('i').text()),
//    productTotPrice = Number(product.find('.proPrice').text().replace('$', '')) * productQuantity;
  
//   product.css('top', topPosition+'px').addClass('deleted');
 
//   //update items count + total price
//   updateCartTotal(productTotPrice, false);
//   updateCartCount(true, -productQuantity);
//   undo.addClass('visible');
 
//   //wait 8sec before completely remove the item
//   undoTimeoutId = setTimeout(function(){
//    undo.removeClass('visible');
//    cartList.find('.deleted').remove();
//   }, 8000);
//  }
 
//  function quickUpdateCart() {
//   var quantity = 0;
//   var price = 0;
  
//   cartList.children('li:not(.deleted)').each(function(){
//    var singleQuantity = Number($(this).find('.select').find('i').text());
//    quantity = quantity + singleQuantity;
//    price = price + singleQuantity*Number($(this).find('.proPrice').text().replace('￥', ''));
//   });
 
//   cartTotal.text(price.toFixed(2));
//   cartCount.find('li').eq(0).text(quantity);
//   cartCount.find('li').eq(1).text(quantity+1);
//  }
 
//  function updateCartCount(emptyCart, quantity) {
//   if( typeof quantity === 'undefined' ) {
//    var actual = Number(cartCount.find('li').eq(0).text()) + 1;
//    var next = actual + 1;
   
//    if( emptyCart ) {
//     cartCount.find('li').eq(0).text(actual);
//     cartCount.find('li').eq(1).text(next);
//    } else {
//     cartCount.addClass('update-count');
 
//     setTimeout(function() {
//      cartCount.find('li').eq(0).text(actual);
//     }, 150);
 
//     setTimeout(function() {
//      cartCount.removeClass('update-count');
//     }, 200);
 
//     setTimeout(function() {
//      cartCount.find('li').eq(1).text(next);
//     }, 230);
//    }
//   } else {
//    var actual = Number(cartCount.find('li').eq(0).text()) + quantity;
//    var next = actual + 1;
   
//    cartCount.find('li').eq(0).text(actual);
//    cartCount.find('li').eq(1).text(next);
//   }
//  }
 
//  function updateCartTotal(proPrice, bool) {
//   bool ? cartTotal.text( (Number(cartTotal.text()) + Number(proPrice)).toFixed(2) )  : cartTotal.text( (Number(cartTotal.text()) - Number(price)).toFixed(2) );
//  }
// });

	</script>
</body>
</html>
