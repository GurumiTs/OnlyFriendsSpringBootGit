<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
#shoppingCartTable{
	font-size:5px;
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
									<input class="form-control text-center me-3" id="amount" name="amount"
										type="text" value="1" style="max-width: 3rem" />
									<a class="btn btn-outline-dark flex-shrink-0 add-to-cart addCart"
										 id="addchart" data-bs-toggle="modal" 
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
			
		

	<!-- Modal -->

	<script>
	$(function () {
  	
  	  findcart()
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
	//addcharticon
// 	var cartcount = document.getElementById("cartcount"); //顯示商品總數量的標籤節點物件
// 	var btns = document.querySelectorAll(".addCart"); //所有的購物車按鈕
// 	//約定好用名稱為datas的cookie來存放購物車裡的資料資訊 datas裡所存放的就是一個json字串
// 	var listStr = session.get("cartlist");
// 	/*判斷一下本地是否有一個購物車（datas），沒有的話，建立一個空的購物車，有的話就直接拿來使用*/
// 	if(!listStr) { //沒有購物車 datas json
// 	session.set({
// 	name: "cartlist",
// 	value: "[]"
// 	});
// 	listStr = cartlist.get("cartlist");
// 	}
// 	var listObj = JSON.parse(listStr); //陣列
// 	/*迴圈遍歷陣列，獲取每一個物件中的pCount值相加總和*/
// 	var totalCount = 0; //預設為0
// 	for(var i = 0, len = listObj.length; i < len; i  ) {
// 	totalCount = listObj[i].amount   totalCount;
// 	}
// 	cartcount.innerHTML = totalCount;
	
		//addtocart
	
			function loadcart () {
				let proId=$('#proId').text();
				console.log(proId)
				let amount=$('#amount').val();
				console.log("stpe1")
				console.log(amount)
			$.ajax({
				type:"post",
				url:"cart",
				dataType: "json",
				data:{ "proId":proId,"amount":amount},
				success:function(data){
					 console.log(data);
					 var json = JSON.stringify(data,null,4);
		     	     var parsedObjinArray = JSON.parse(json);
		     	     var cartlistitem = $('#cartlistitem');
		     	     $('#cartlistitem').empty("");
		     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
		     	     var item = '<tr>'+
		 				'<td>'+
		 				'<div class="checkbox">'+
		 				'<label>'+
		 				'<input type="checkbox" id="checkbox'+n.proId+'" value="option1">'+
		 				'</label>'+
		 				'</div>'+
		 				'</td>'+
		 				'<td>'+n.product.proName+'</td>'+
		 				'<td>'+n.product.proPrice+'</td>'+
		 				'<td>'+n.amount+'</td>'+
		 				'<td>'+Math.round(n.product.proPrice*n.amount)+'</td>'+
		 				'</tr>';
		 				cartlistitem.append(item);
		     	    });
				},
				error:function(){
					console.log("error");
				}
			})
		}	
		

			function findcart () {
				let proId=$('#proId').text();
				console.log(proId)
				let amount=$('#amount').val();
				console.log("stpe1")
				console.log(amount)
			$.ajax({
				type:"post",
				url:"getShoppingCars",
				success:function(data){
					 console.log(data);
					 var json = JSON.stringify(data,null,4);
		     	     var parsedObjinArray = JSON.parse(json);
		     	     var cartlistitem = $('#cartlistitem');
		     	     $('#cartlistitem').empty("");
		     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
		     	     var item = '<tr>'+
		 				'<td>'+
		 				'<div class="checkbox">'+
		 				'<label>'+
		 				'<input type="checkbox" id="checkbox'+n.proId+'" value="option1">'+
		 				'</label>'+
		 				'</div>'+
		 				'</td>'+
		 				'<td class="proname">'+n.product.proName+'</td>'+
		 				'<td>'+n.product.proPrice+'</td>'+
		 				'<td>'+n.amount+'</td>'+
		 				'<td>'+Math.round(n.product.proPrice*n.amount)+'</td>'+
		 				'</tr>';
		 				cartlistitem.append(item);
		     	    });
				},
				error:function(){
					console.log("error");
				}
			})
		}	




	</script>
</body>
</html>
