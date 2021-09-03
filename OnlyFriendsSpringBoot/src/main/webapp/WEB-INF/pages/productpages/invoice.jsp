<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
body{
font-size:1.2rem
}
</style>
</head>
<body>
 <body class="layout-2">
    <div id="app">
      <div class="main-wrapper">
        
        <%@include file="../frontcommonpages/shopheader.jsp"%>
        
        <%@include file="../frontcommonpages/shopsider.jsp"%>
        
          <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>Invoice</h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
              <div class="breadcrumb-item">Invoice</div>
            </div>
          </div>

          <div class="section-body">
            <div class="invoice">
              <div class="invoice-print">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="invoice-title">
                      <h2>Invoice</h2>
                      <div class="invoice-number">Order #12345</div>
                    </div>
                    <hr>
                    <div class="row">
                      <div class="col-md-6">
                        <address>
                          <strong>Billed To:</strong><br>
                            Ujang Maman<br>
                            1234 Main<br>
                            Apt. 4B<br>
                            Bogor Barat, Indonesia
                        </address>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <address>
                          <strong>Payment Method:</strong><br>
                          Visa ending **** 4242<br>
                          ujang@maman.com
                        </address>
                      </div>
                      <div class="col-md-6 text-md-right">
                        <address>
                          <strong>Order Date:</strong><br>
                          September 19, 2018<br><br>
                        </address>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row mt-4">
                  <div class="col-md-12">
                    <div class="section-title">Order Summary</div>
                    <p class="section-lead">All items here cannot be deleted.</p>
                    <div class="table-responsive">
                      <table class="table table-striped table-hover table-md">
                        
                        <tr>
                          <th data-width="40">刪除</th>
                          <th>名稱</th>
                          <th class="text-center">單價</th>
                          <th class="text-center">數量</th>
                          <th class="text-right">小計</th>
                        </tr>
                       	<tbody  id="orderlist"></tbody>
<!--                         <tr> -->
<!--                           <td>2</td> -->
<!--                           <td>Keyboard Wireless</td> -->
<!--                           <td class="text-center">$20.00</td> -->
<!--                           <td class="text-center">3</td> -->
<!--                           <td class="text-right">$60.00</td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                           <td>3</td> -->
<!--                           <td>Headphone Blitz TDR-3000</td> -->
<!--                           <td class="text-center">$600.00</td> -->
<!--                           <td class="text-center">1</td> -->
<!--                           <td class="text-right">$600.00</td> -->
<!--                         </tr> -->
                      </table>
                    </div>
                    <div class="row mt-4">
                      <div class="col-lg-8">
                        <div class="section-title">Payment Method</div>
                        <p class="section-lead">The payment method that we provide is to make it easier for you to pay invoices.</p>
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
                          <div class="invoice-detail-value invoice-detail-value-lg">$<span id="finaltotal"></span></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <hr>
              <div class="text-md-right">
                <div class="float-lg-left mb-lg-0 mb-3">
                  <button class="btn btn-primary btn-icon icon-left"><i class="fas fa-credit-card"></i> Process Payment</button>
                  <button class="btn btn-danger btn-icon icon-left"><i class="fas fa-times"></i> Cancel</button>
                </div>
                <button class="btn btn-warning btn-icon icon-left"><i class="fas fa-print"></i> Print</button>
              </div>
            </div>
          </div>
        </section>
      </div>
      <footer class="main-footer">
        <div class="footer-left">
          Copyright &copy; 2018 <div class="bullet"></div> Design By <a href="https://nauval.in/">Muhamad Nauval Azhar</a>
        </div>
        <div class="footer-right">
          2.3.0
        </div>
      </footer>
    </div>
  </div>


        
    
    <%@include file="../frontcommonpages/shopbottom.jsp"%>
    
    
    <script >  
    $(function(){
    	findcart()
    	shopcartfinaltotal()
    	$(".minus").on("click",minus)	
	    $(".deleteitem").on("click",deleteitem)
	    $(".plus").on("click",plus)
    })
    
    //showshopcartlist
    function findcart () {
		$.ajax({
			type:"post",
			url:"getShoppingCars",
			success:function(data){
// 				 console.log(data);
				 var json = JSON.stringify(data,null,4);
	     	     var parsedObjinArray = JSON.parse(json);
	     	     var orderlist = $('#orderlist');
	     	     $('#orderlist').empty("");
	     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
	     	     var item =  '<tr id='+n.product.proId+'>'+
	     	    '<td>'+'<i class="fas fa-times-circle fs-5 deleteitem"></i>'+'</td>'+
                 '<td>'+n.product.proName+'</td>'+
                 '<td class="text-center">'+n.product.proPrice+'</td>'+
                 '<td class="text-center">'+'<button class="btn btn-sm btn-icon btn-light mx-1 minus"><i class="fas fa-minus text-black-50"></i></button>'+'<i id="amount>">'+n.amount+'</i>'+'<button  class="btn btn-sm btn-icon btn-light mx-1 plus"><i class="fas fa-plus text-black-50"></i></button>'+'</td>'+
                 '<td class="text-right">'+Math.round(n.product.proPrice*n.amount)+'</td>'+
               	 '</tr>';
	 				orderlist.append(item);
	 			if(n.amount == 1){
	 				$('.minus').prop('disabled',true)
	 			}	
	 				
	     	    });
	     	 	$(".minus").on("click",minus)
	     	 	shopcartfinaltotal() 
	     	 	$(".deleteitem").on("click",deleteitem)
	     	 	$(".plus").on("click",plus)
			},
			error:function(error){
				console.log("error");
			}
		})
	}	
    
    //minus
    function minus(){
		let id = $(this).closest('tr').attr('id')
		$.ajax({
			type:"get",
			url:"minusshopcart",
			data:{"proId":id},
			success:function(data){	
// 				console.log(data)
	     	 	findcart()	
     	 	
			},
			error:function(){
				console.log("error");
			}
		})		
	}
	
    //plus
	function plus(){
		let id = $(this).closest('tr').attr('id')
		$.ajax({
			type:"get",
			url:"plusshopcart",
			data:{"proId":id},
			success:function(data){	
// 				console.log(data)
	     	 	findcart()	
     	 	
			},
			error:function(){
				console.log("error");
			}
		})		
	}
	
    //delete shopcartitem
	function deleteitem(){
		let id = $(this).closest('tr').attr('id')
		console.log(id);
		$.ajax({
			type:"get",
			url:"deleteshopcartitem",
			data:{"proId":id},
			success:function(data){	
// 				console.log(data)
	     	 	findcart()	   	 	
			},
			error:function(){
				console.log("error");
			}
		})		
	}
    
//		shoppingcartfinaltotal
	  function shopcartfinaltotal() {						  
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
					console.log(finaltotals)
					finaltotal.html(finaltotals)
					console.log(finaltotals)
				}
				,error: function(error){
					console.log(error);
				}
			})
		}
   
    </script>
  </body>
</html>       