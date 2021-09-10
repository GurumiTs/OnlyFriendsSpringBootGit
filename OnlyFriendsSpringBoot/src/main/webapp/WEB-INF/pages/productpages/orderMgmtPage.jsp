<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>
<style>
.information {
	cursor: pointer;
	color: purple;
}


.information:hover {
	color: purple;
}


.img1 {
	weight: 100px;
	height: 100px;
}
.proimg{
    weight: 60px;
	height: 60px;
}
</style>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@include file="../commonpages/dashboardsidebar.jsp"%>


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@include file="../commonpages/dashboardheader.jsp"%>

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- ************************** your content*************************** -->
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Product Tables</h1>
					<!--Employee DataTale  -->
					<div class="card shadow mb-4">

						<div class="card-body">
							<div class="table-responsive">
								<table id="ordertable" class="table table-striped"
									style="width: 100%">
									<thead>
										<tr>
											<th>Id</th>
											<th>會員編號</th>
											<th>訂單時間</th>
											<th>訂單地址</th>
											<th>訂單總金額</th>
											<th>訂單資訊</th>
										</tr>
									</thead>
<!-- 									<tbody id="ordertable"></tbody> -->
									<tfoot>
										<tr>
											<th>Id</th>
											<th>會員編號</th>
											<th>訂單時間</th>
											<th>訂單地址</th>
											<th>訂單總金額</th>
											<th>訂單資訊</th>

										</tr>
									</tfoot>
								</table>

							</div>
						</div>
					</div>
					<!-- table end -->

					<!-- model -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-scrollable modal-lg">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">訂單明細</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					       <div class="invoice" >
				              <div class="invoice-print">
				                <div class="row">
				                  <div class="col-lg-12">
				                    <div class="invoice-title">
				                      <h2>訂單完成</h2>
				<!--                       <div class="invoice-number">Order #12345</div> -->
				                    </div>
				                    <hr>
					        <div class="row">
                      <div class="col-md-6">
                        <address>
                          <strong>訂單地址:</strong><br>
                            <span id="postalCode"></span><span id="country"></span>
                            <span id="orderline1"></span>
                            <span id="orderline2"></span>
                        </address>
                      </div>
                    </div>
                    <div class="row">
<!--                       <div class="col-md-6"> -->
<!--                         <address> -->
<!--                           <strong>信箱:</strong><br> -->
<!--                           <span id="orderemail"></span> -->
<!--                         </address> -->
<!--                       </div> -->
                      <div class="col-md-6">
                        <address>
                          <strong>訂購時間:</strong><br>
                          <span id="ordertime"></span><br><br>
                        </address>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row mt-4">
                  <div class="col-md-12">
<!--                     <div class="section-title">Order Summary</div> -->
<!--                     <p class="section-lead">All items here cannot be deleted.</p> -->
                    <div class="table-responsive">
                      <table class="table table-sm">
                      <thead>
                        <tr>
                          <th class="text-left">商品</th>
                          <th class="text-left">名稱</th>
                          <th class="text-center">單價</th>
                          <th class="text-center">數量</th>
                          <th class="text-center">小計</th>
                        </tr>
                      </thead>
                      <tbody id="customerorderlist">
                      </tbody>
                    </table>
                    </div>
                    <div class="row mt-4">
                      <div class="col-lg-8">
<!--                         <div class="section-title">Payment Method</div> -->
<!--                         <p class="section-lead">The payment method that we provide is to make it easier for you to pay invoices.</p> -->
                        <div class="d-flex">
                          <div class="mr-2 bg-visa" data-width="61" data-height="38"></div>
                          <div class="mr-2 bg-jcb" data-width="61" data-height="38"></div>
                          <div class="mr-2 bg-mastercard" data-width="61" data-height="38"></div>
                          <div class="bg-paypal" data-width="61" data-height="38"></div>
                        </div>
                      </div>
                      <div class="col-lg-4 text-right" >
<!--                         <div class="invoice-detail-item"> -->
<!--                           <div class="invoice-detail-name">總計</div> -->
<!--                           <div class="invoice-detail-value" id="finaltotal"></div> -->
<!--                         </div> -->
<!--                         <div class="invoice-detail-item"> -->
<!--                           <div class="invoice-detail-name">Shipping</div> -->
<!--                           <div class="invoice-detail-value">$15</div> -->
<!--                         </div> -->
                        <hr class="mt-2 mb-2">
                        <div class="invoice-detail-item">
                          <div class="invoice-detail-name">總計</div>
                          <div class="invoice-detail-value invoice-detail-value-lg">$<span id="orderfinaltotal"></span></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
<!-- 					        <button type="button" class="btn btn-primary">Save changes</button> -->
					      </div>
					    </div>
					  </div>
					</div>
					
					
					
					<!-- model end -->


					<!-- **************************end of your content*************************** -->
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<%@include file="../commonpages/dashboardfooter.jsp"%>

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<%@include file="../commonpages/dashboardlogoutmodal.jsp"%>




	<!-- bottom here -->
	<%@include file="../commonpages/dashboardbottom.jsp"%>
	<script>
// 		  $(document).ready(function(){

		/* load data table */
		var table = $('#ordertable').DataTable({
			"ajax" : {
				"url" : "order.controller",
			},
			"columns" : [ {
				"data": "paymentId"
			}, {
				"data" : "memberAccount"
			}, {
				"data" : "orderTime"
			},
			 { 
	        	"data": null,
	            render:function(data, type, row)
	            {
	             	let a =  JSON.parse(data.orderAddress);
// 	             	console.log(a)
	            	return a.line1+a.line2;
	            }
	        },			
			
			{
				"data" : "total"
			}, {
	            "data": null,
	            render:function(data, type, row)
	            {
	              return "<a class='details' id="+data.paymentId+">&nbsp&nbsp&nbsp<i class='fas fa-info-circle information' data-bs-toggle='modal' data-bs-target='#exampleModal'></i>";
	            }
	        }]
		})
		  
		/* load data table */
		
		$("#ordertable tbody").on("click", ".details", function () {
			let paymentId=$(this).attr("id");
// 			console.log(paymentId);
			let dtr = $(this).closest("th");
			 $.ajax({
				  type : "post",
				  url: "emporderquery", 
				  dataType: "json",   
			      cache: false,  
			      data: {"paymentId":paymentId}, 
			      success: function(data) 
			        {
// 						console.log(data)
			    	  let address =  JSON.parse(data.orderAddress);
// 			         	console.log(address)
			    	  $('#postalCode').text(address.postal_code);
			    	  $('#country').text(address.country_code);
			    	  $('#orderline1').text(address.line1);
			    	  $('#orderline2').text(address.line2);
			    	  $('#ordertime').text(data.orderTime);
			    	  let json=JSON.stringify(data.orderItem,null,4)
			    	  console.log(json)
					  var parsedObjinArray = JSON.parse(json);
			    	  console.log(parsedObjinArray)
		     	     var customerorderlist = $('#customerorderlist');
		     	     $('#customerorderlist').empty("");
		     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
		     	     var item =  '<tr id='+n.proId+'>'+
		     	    '<td>'+'<img class="proimg" src='+n.proPhoto+'/>'+'</td>'+
	                 '<td>'+n.proName+'</td>'+
	                 '<td class="text-center">'+n.proPrice+'</td>'+
// 	                 '<td class="text-center">'+'<i id="amount">'+n.amount+'</i>'+'</td>'+
// 	                 '<td class="text-right">'+Math.round(n.product.proPrice*n.amount)+'</td>'+
	               	 '</tr>';
	               		customerorderlist.append(item);
		     	 	});
			        },
			      error: function(data) 
			        {
			           console.log('無法送出');
			        }
			  });			  
		});
		
// 		function customerorderlist() {
// 			let paymentId=$(this).attr("id");
// 			console.log(paymentId);
// 			let dtr = $(this).closest("th");
// 			$.ajax({
// 				type:"get",
// 				url:"orderIdItem",
// 				dataType: "json",   
// 			    cache: false,  
// 			    data: {"paymentId":paymentId},
// 				success:function(data){
// 					console.log(data) 
// 					var json = JSON.stringify(data,null,4);
// 		     	     var parsedObjinArray = JSON.parse(json);
// 		     	     var customerorderlist = $('#customerorderlist');
// 		     	     $('#customerorderlist').empty("");
// 		     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
// 		     	     var item =  '<tr id='+n.product.proId+'>'+
// 		     	    '<td>'+'<img class="proimg" src='+n.product.proPhoto+'/>'+'</td>'+
// 	                 '<td>'+n.product.proName+'</td>'+
// 	                 '<td class="text-center">'+n.product.proPrice+'</td>'+
// 	                 '<td class="text-center">'+'<i id="amount">'+n.amount+'</i>'+'</td>'+
// 	                 '<td class="text-right">'+Math.round(n.product.proPrice*n.amount)+'</td>'+
// 	               	 '</tr>';
// 	               		customerorderlist.append(item);
		 				
// 		     	    });
// 		     	 	orderfinaltotal()	     	 	
// 				},
// 				error:function(error){
// 					console.log("error");
// 				}
// 			})
// 		}	
		
// 		function getorderaddress() {
			
// 		console.log("hello")
// 		$.ajax({
// 			type:"post",
// 			url:"getorderaddress",
// 			success:function(data){
// 				let address=JSON.stringify(data);
// 				console.log(address);
// 				let line=address.line1;
// 				console.log(line);
// 				$('#orderaddress').text(line);
// 			},error(){
// 				error
// 			}
// 		})
// 		}
	</script>
</body>
</html>