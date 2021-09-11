<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
body{
font-size:1.2rem
}
.proimg{
weight:100px;
height:100px;
}


#couponarea{display:flex;}
#coupondetail{width:300px;margin-top:6px;}
#couponprice{width:300px;margin-left:auto;text-align: right;font-size:1.4rem;color:red;padding-right:10px;}
</style>
</head>
<body>
 <body class="layout-2">
    <div id="app">
      <div class="main-wrapper">
        
        <%@include file="../frontcommonpages/shopheader.jsp"%>
        
        <%@include file="../frontcommonpages/shopsider.jsp"%>
        
          <div class="main-content" id="first">
        <section class="section" >
          <div class="section-header">
            <h1>購物車</h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><a href="shopentrypage">招桃商城</a></div>
              <div class="breadcrumb-item">購物車</div>
            </div>
          </div>

          <div class="section-body">
            <div class="invoice">
              <div class="invoice-print">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="invoice-title">
                      <h2>訂單摘要</h2>
<!--                       <div class="invoice-number">Order #12345</div> -->
                    </div>
                    <hr>
<!--                     <div class="row"> -->
<!--                       <div class="col-md-6"> -->
<!--                         <address> -->
<!--                           <strong>Billed To:</strong><br> -->
<!--                             Ujang Maman<br> -->
<!--                             1234 Main<br> -->
<!--                             Apt. 4B<br> -->
<!--                             Bogor Barat, Indonesia -->
<!--                         </address> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                     <div class="row"> -->
<!--                       <div class="col-md-6"> -->
<!--                         <address> -->
<!--                           <strong>Payment Method:</strong><br> -->
<!--                           Visa ending **** 4242<br> -->
<!--                           ujang@maman.com -->
<!--                         </address> -->
<!--                       </div> -->
<!--                       <div class="col-md-6 text-md-right"> -->
<!--                         <address> -->
<!--                           <strong>Order Date:</strong><br> -->
<!--                           September 19, 2018<br><br> -->
<!--                         </address> -->
<!--                       </div> -->
<!--                     </div> -->
                  </div>
                </div>

                <div class="row mt-4">
                  <div class="col-md-12" >
<!--                     <div class="section-title">Order Summary</div> -->
<!--                     <p class="section-lead">All items here cannot be deleted.</p> -->
                    <div class="table-responsive">
                      <table class="table table-striped table-hover table-md">
                        
                        <tr>
                          <th data-width="40">刪除</th>
                          <th >商品</th>
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
                      
                       <!-- 優惠券 -->
                        <div id="couponarea">                      
                        <div class="mb-3">                     
                        <select name="" id="coupondetail" >
							<option value="">輸入優惠折扣碼</option>																				
						</select>
                        </div>
                        <div id="couponprice"></div>                     
                        </div>
                       
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
                        <div class="invoice-detail-item">
                          <div class="invoice-detail-name">總計</div>
                          <div class="invoice-detail-value invoice-detail-value-lg">$<span id="ordertotal"></span></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
<!--                         <hr class="mt-2 mb-2"> -->
              <div class="text-md-right">
                <div class="mb-lg-3 mb-7">
                  <i class="fas paypalbutton"></i>
<!--                   <button class="btn btn-danger btn-icon icon-left"><i class="fas fa-times"></i> Cancel</button> -->
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
      <div class="main-content d-none" id="second" style="background-image: url('${pageContext.request.contextPath}/images/smallicon/giphy (5).gif');">
        <section class="section">
<!--           <div class="section-header"> -->
<!--             <h1>購物車</h1> -->
<!--             <div class="section-header-breadcrumb"> -->
<!--               <div class="breadcrumb-item active"><a href="shopentrypage">招桃商城</a></div> -->
<!--               <div class="breadcrumb-item">購物車</div> -->
<!--             </div> -->
<!--           </div> -->
		<div class="row mt-4">
		<div class="col-2 col-lg-2 offset-lg-5">
<!-- 		<div class="wizard-steps"> -->
<!-- 			<div class="wizard-step wizard-step-success"> -->
<!--                             <div class="wizard-step-icon"> -->
<!--                               <i class="fas fa-check"></i> -->
<!--                             </div> -->
<!--                             <div class="wizard-step-label"> -->
<!--                               Order Completed -->
<!--                             </div> -->
<!--                           </div> -->
<!--                           </div> -->
			<img src="${pageContext.request.contextPath}/images/smallicon/order.png" style="weight:100px;height:100px;"/>
                 
                 </div>
              </div>
		<br>
          <div class="section-body col-md-8 offset-lg-2">
          
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
                            <span id="postalCode"></span><br><span id="country"></span><br>
                            <span id="orderline1"></span><br>
                            <span id="orderline2"></span><br>
                        </address>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <address>
                          <strong>信箱:</strong><br>
                          <span id="orderemail"></span>
                        </address>
                      </div>
                      <div class="col-md-6 text-md-right">
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
                      <tbody id="ordercompletelist">
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
              <hr>
              <div class="text-md-right">
                <div class="float-lg-left mb-lg-0 mb-3">
<!--                   <button class="btn btn-primary btn-icon icon-left"><i class="fas fa-credit-card"></i> Process Payment</button> -->
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
          Copyright &copy; 2021 <div class="bullet"></div> Design By <a href="https://nauval.in/">OnlyFriends Team</a>
        </div>
        <div class="footer-right">
          2.3.0
        </div>
      </footer>
    </div>
  </div>
    
    <%@include file="../frontcommonpages/shopbottom.jsp"%>
    
    <script src="https://www.paypalobjects.com/api/checkout.js"></script>
    <script >
    let  dtotal;    
    paypal.Button.render({
        style: {
        		 color:'blue',
        		 shape:'rect',
        		 label:'checkout',
        		 size: 'small',
//         		 fundingicons:'true',
        		},
        env: 'sandbox', // Or 'production'
        // Set up the payment:
        // 1. Add a payment callback
        payment: function(data, actions) {
          // 2. Make a request to your server
          return actions.request.post('http://localhost:8080/OnlyFriends/payproduct',{
        	  discounttotal: dtotal
          })
            .then(function(res) {
              // 3. Return res.id from the response
              console.log(res)
              return res.id;
            });
        },
        // Execute the payment:
        // 1. Add an onAuthorize callback
        onAuthorize: function(data, actions) {
        	console.log(data)
          // 2. Make a request to your server
          return actions.request.post('http://localhost:8080/OnlyFriends/pay/success', {
            paymentID: data.paymentID,
            payerID:   data.payerID
          })
            .then(function(res) {
              console.log(res)
              $('#exampleModal').modal('hide')
              Swal.fire(
    	               '感謝'+res.payer.payerInfo.firstName+'已儲值成功!',
    	               '',
    	               'success'
    	                         )
				$("#first").addClass("d-none")
				$("#second").removeClass("d-none")
				let address = res.payer.payerInfo.shippingAddress;
				console.log(address)
				let b = address.line1
				console.log(b)
              	$('#postalCode').text(address.postalCode);
				$('#country').text(address.countryCode);
				$('#orderline1').text(address.line1);
				$('#orderline2').text(address.line2)
				$('#orderemail').text(res.payer.payerInfo.email)
				$('#ordertime').text(res.updateTime)
				$('#orderfinaltotal').text(data.total);
			    	  let json=JSON.stringify(data.orderItem,null,4)
			    	  console.log(json)
					  var parsedObjinArray = JSON.parse(json);
			    	  console.log(parsedObjinArray)
		     	     var ordercompletelist = $('#ordercompletelist');
		     	     $('#ordercompletelist').empty("");
		     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
		     	     var item =  '<tr id='+n.proId+'>'+
		     	    '<td>'+'<img class="proimg" src='+n.proPhoto+'/>'+'</td>'+
	                 '<td>'+n.proName+'</td>'+
	                 '<td class="text-center">'+n.proPrice+'</td>'+
// 	                 '<td class="text-center">'+'<i id="amount">'+n.amount+'</i>'+'</td>'+
// 	                 '<td class="text-right">'+Math.round(n.product.proPrice*n.amount)+'</td>'+
	               	 '</tr>';
				
				showorderlist()
		     	 	 })
            });
        }
      }, '.paypalbutton');
    
    function showorderlist() {
		$.ajax({
			type:"post",
			url:"getShoppingCars",
			success:function(data){
				 var json = JSON.stringify(data,null,4);
	     	     var parsedObjinArray = JSON.parse(json);
	     	     var ordercompletelist = $('#ordercompletelist');
	     	     $('#ordercompletelist').empty("");
	     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
	     	     var item =  '<tr id='+n.product.proId+'>'+
	     	    '<td>'+'<img class="proimg" src='+n.product.proPhoto+'/>'+'</td>'+
                 '<td>'+n.product.proName+'</td>'+
                 '<td class="text-center">'+n.product.proPrice+'</td>'+
                 '<td class="text-center">'+'<i id="amount">'+n.amount+'</i>'+'</td>'+
                 '<td class="text-right">'+Math.round(n.product.proPrice*n.amount)+'</td>'+
               	 '</tr>';
               		ordercompletelist.append(item);
	 				
	     	    });
	     	 	orderfinaltotal()	     	 	
			},
			error:function(error){
				console.log("error");
			}
		})
	}	

    $(function(){
    	findcart()
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
	     	    '<td>'+'<img class="proimg" src='+n.product.proPhoto+'/>'+'</td>'+
                 '<td>'+n.product.proName+'</td>'+
                 '<td class="text-center">'+n.product.proPrice+'</td>'+
                 '<td class="text-center">'+'<button class="btn btn-sm btn-icon btn-light mx-1 minus" id="'+n.product.proId+'minus'+'"><i class="fas fa-minus text-black-50"></i></button>'+'<i id="amount>">'+n.amount+'</i>'+'<button  class="btn btn-sm btn-icon btn-light mx-1 plus"><i class="fas fa-plus text-black-50"></i></button>'+'</td>'+
                 '<td class="text-right">'+Math.round(n.product.proPrice*n.amount)+'</td>'+
               	 '</tr>';
	 				orderlist.append(item);
	 			if(n.amount == 1){
	 				$(''+n.product.proId+'.minus').prop('disabled',true)
	 			}	
	 				
	     	    });
	     	 	$(".minus").on("click",minus)
	     	 	$(".deleteitem").on("click",deleteitem)
	     	 	$(".plus").on("click",plus)
	     	 	shopcartfinaltotal() 
	     	 	
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
				success:function(data){
					$('#ordertotal').empty()
		            $('#ordertotal').text(data)      
		            dtotal =  $('#ordertotal').text() 
				}
				,error: function(error){
					console.log(error);
				}
			})
		}
	  function orderfinaltotal() {						  
			$.ajax({
				type:"get",
				url:"shopcarttotal",
				success:function(data){
					$('#orderfinaltotal').empty()
		            $('#orderfinaltotal').text(data)
				}
				,error: function(error){
					console.log(error);
				}
			})
		}	
	  //優惠券序號判斷 
	  $(function () {
		  $.ajax({
			  type:'GET',
			  url:'usecoupon.controller',
			  dataType:'json',
			  success(data){
				  
				  for(let i=0;i<data.length;i++){
					  if(data[i].category != "異業券" && data[i].category != "運費券"){
						  
				      $("#coupondetail").append('<option value="'+ data[i].couponName +'">' + data[i].couponName + '</option>');					     
			        } 
				  }				  				  			  
			  }			  			  			  			  
		  })		  		  		  		  
	  })
	  
	 //異動折扣
	  $('#orderlist').click(function(){	  
		$('#couponprice').text("");
		$('#coupondetail').val("");
		
	 })
	
	  //扣除優惠券
	  var coupon;
	  function couponclickfinaltotal() {	
			$.ajax({
				type:"get",
				url:"shopcarttotal",
				success:function(data){
					coupon=data;
					if(data>0){
					if(cash!=0 && cashId==1){						
					    $('#ordertotal').empty();
		                $('#ordertotal').text(data-cash); 
		                dtotal = $('#ordertotal').text(); 
					}else if(cash!=0 && cashId!=1){
						if(cashName<=data){
						$('#ordertotal').empty();
			            $('#ordertotal').text(data-cash); 	
			            dtotal = $('#ordertotal').text(); 
						}else{
							$('#couponprice').text("優惠條件不符");
							$('#ordertotal').empty();
				            $('#ordertotal').text(data); 
				            dtotal = data
						}
					
					}else if(discount!=0 && discountId!=9) {
						$('#ordertotal').empty();
			            $('#ordertotal').text(Math.round(data*discount/100)); 
			            dtotal = $('#ordertotal').text(); 
					}else if(discount!=0 && discountId==9) {
						    if(discountName<=data){
							$('#ordertotal').empty();
				            $('#ordertotal').text(Math.round(data*discount/100)); 
				            dtotal = $('#ordertotal').text(); 
							}else{
								$('#couponprice').text("優惠條件不符");
								$('#ordertotal').empty();
					            $('#ordertotal').text(data); 
					            dtotal = data
							}						
					}else{
						$('#ordertotal').empty();
			            $('#ordertotal').text(data);             
			            dtotal = data
			            console.log("dtotal"+dtotal)
					}	
					}else{
						$('#couponprice').text("");
						
					}
				}
				,error: function(error){
					console.log(error);
				}
			})
		}
	  
	  //優惠券選擇
	  var cash=null;
	  var discount=null;
	  var cashId=null;
	  var discountId=null;
	  var cashName=null;
	  var discountName=null;
	  $(function () {
		
		  $('#coupondetail').click(function () {
			  
			  cash=0;
			  discount=0;
			  cashId=0;
			  discountId=0;
			 
			  var couponName=$('#coupondetail').val();

		  $.ajax({
			  type:'GET',
			  url:'usecoupon.controller',
			  dataType:'json',
			  success(data){
  
				  for(let i=0;i<data.length;i++){
					  if(couponName==data[i].couponName && data[i].category =="現金券"){
						  
						  cash=data[i].couponPrice;
						  cashId=data[i].couponId;
						  cn=data[i].couponName;						
						  cashName=cn.split('折')[0].substr(3);					
						 				
						  $('#couponprice').text("-"+data[i].couponPrice);
						  
					  }else if(couponName==data[i].couponName && data[i].category =="折扣券"){
						 
						  discount=data[i].couponPrice;
						  discountId=data[i].couponId;
						  console.log("discountId:"+discountId)
						  dn=data[i].couponName;
						  discountName=dn.split('打')[0].substr(3);
					
						  var c= Math.round(coupon-coupon*data[i].couponPrice/100);
											  
						  $('#couponprice').text("-"+c);
					  }else if(couponName==""){
						  $('#couponprice').text("");
					  }
				  }		
				  console.log("cash:"+cash);
				  console.log("discount:"+discount);
				  console.log("cashId:"+cashId);
				  console.log("discountId:"+discountId);
				  couponclickfinaltotal();
				   
			  }			  			  			  			  
		  })		  		  		  		  
	  })
	})  
    </script>
  </body>
</html>       