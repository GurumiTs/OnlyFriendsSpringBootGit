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
				
				 <section class="py-5" >
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" id="proPhoto" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1" id="proId" ></div>
                        <h1 class="display-5 fw-bolder" id="proName" ></h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through" id="proPrice" ></span>
                            <span id="proPriceDiscount"></span>
                        </div>
                        <p class="lead" id="proDescription" ></p>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" id="addchart">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Related products</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
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
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Special Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
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
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
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
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Popular Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
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
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" id="addtocart" href='addtoshopchart?Id=${proId }'>Add to cart</a></div>
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
	<div class="modal" id="shopchartbox" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Shopping List</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <table id="shopitem">
<!-- 				<thead> -->
<!-- 					<td width="40px">編號</td> -->
<!-- 					<td width="60px">名稱</td> -->
<!-- 					<td width="40px">價格</td> -->
<!-- 					<td width="40px">數量</td> -->
<!-- 					<td width="40px">小計</td> -->
<!-- 				</thead> -->
<!-- 				<tbody> -->
<!-- 					<tr> -->
<!-- 						<td id="shopitem"></td> -->
<!-- 					</tr> -->
<!-- 				</tbody> -->
			</table>
			<table>
				<tr>
				<td colspan="3" align="right"><c:forEach var="i"
												begin="1" end="${totalPages}" step="1">
												<button class="btn btn-outline-secondary" id="myPage"
													value="${i}" onclick="change(${i})">${i}</button>
											</c:forEach></td>
				</tr>
			</table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
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
	var indexPage = 1;
    $(function(){
    	load(indexPage);
    })

	function change(page){
	   indexPage = page;
	   load(indexPage);
	}
	$("#shopchartbox").on("click", "#addchart", function () {
		  let proId = $(this).attr("proId");
		  $.ajax({
			  type : "post",
			  url: "shoppage.controller/"+indexPage,   
		      dataType: "json",   
		      cache: false,   
		      data: {"proId":proId}, 
		      success : function(data) 
		        {
		    	  	 var json = JSON.stringify(data, null, 4);
		    	     var parsedObjinArray = JSON.parse(json);
		    	     var shopitem = $('#shopitem');
		    	     $('#shopitem').empty("");
		    	     if(json=null){
		    	    	 $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
		    	     }else{
		    	    	 var table=$('#shopitem')
		    	     	 table.append("<tr value='Shopping List'><th>編號</th><th>商品名稱</th><th>價格</th><th>數量</th><th>小計</th></tr>")
			    	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
			    	     var item = "<tr align='center'>"+
			    	    	 "<td><a href='cart?proId='"+n.proId+"'>"+n.proId+"</a></td>"+
			    	    	 "<td>"+n.prName+"</td>"+
			    	    	 "<td>"+n.proPrice+"</td>"+
			    	    	 "<td>"+n.amount+"</td>"+
			    	    	 "<td><span>$"+n.proPrice*n.amount+"</span></td>";
			    	    	 table.append(tr);
		    	 }); 
		        }
		        },
		        error: function(data) 
		        {
		           console.log('無法送出');
		        }
		  		  
	});
	})
   
	</script>
</body>
</html>
