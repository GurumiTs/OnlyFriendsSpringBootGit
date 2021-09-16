<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0; // remove the gap so it doesn't close
  }
body{
font-size:1.2rem
}
.proimg{
weight:100px;
height:100px;
}
.information {
	cursor: pointer;
	color: purple;
	font-size:20px;
}


.information:hover {
	color: purple;
	font-size:20px;
}
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
                      <h2>歷史訂單</h2>
                    </div>
                    <hr>
                  </div>
                </div>
               <div class="card">
                  <div class="card-body p-0">
                    <div class="table-responsive">
                      <table class="table table-striped table-md" id="userorder">
                        <thead><tr>
                          <th>#</th>
                          <th>訂單時間</th>
                          <th>訂單總額</th>
                          <th>查看更多</th>
                          <th>訂單狀態</th>
                          <th>取消訂單</th>
                        </tr>
                        </thead>
                        <tbody id="userorderlist">
<!--                         <tr> -->
<!--                           <td>1</td> -->
<!--                           <td>Irwansyah Saputra</td> -->
<!--                           <td>2017-01-09</td> -->
<!--                           <td><div class="badge badge-success">Active</div></td> -->
<!--                           <td><a href="#" class="btn btn-secondary">Detail</a></td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                           <td>2</td> -->
<!--                           <td>Hasan Basri</td> -->
<!--                           <td>2017-01-09</td> -->
<!--                           <td><div class="badge badge-success">Active</div></td> -->
<!--                           <td><a href="#" class="btn btn-secondary">Detail</a></td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                           <td>3</td> -->
<!--                           <td>Kusnadi</td> -->
<!--                           <td>2017-01-11</td> -->
<!--                           <td><div class="badge badge-danger">Not Active</div></td> -->
<!--                           <td><a href="#" class="btn btn-secondary">Detail</a></td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                           <td>4</td> -->
<!--                           <td>Rizal Fakhri</td> -->
<!--                           <td>2017-01-11</td> -->
<!--                           <td><div class="badge badge-success">Active</div></td> -->
<!--                           <td><a href="#" class="btn btn-secondary">Detail</a></td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                           <td>5</td> -->
<!--                           <td>Isnap Kiswandi</td> -->
<!--                           <td>2017-01-17</td> -->
<!--                           <td><div class="badge badge-success">Active</div></td> -->
<!--                           <td><a href="#" class="btn btn-secondary">Detail</a></td> -->
<!--                         </tr> -->
                      </tbody>
                      <tfoot class="d-none">
                      	<tr>
                          <th>#</th>
                          <th>訂單時間</th>
                          <th>訂單總額</th>
                          <th>查看更多</th>
                          <th>訂單狀態</th>
                          <th>取消訂單</th>
                        </tr>
                      </tfoot>
                      </table>
                    </div>
                  </div>
<!--                   <div class="card-footer text-right"> -->
<!--                     <nav class="d-inline-block"> -->
<!--                       <ul class="pagination mb-0"> -->
<!--                         <li class="page-item disabled"> -->
<!--                           <a class="page-link" href="#" tabindex="-1"><i class="fas fa-chevron-left"></i></a> -->
<!--                         </li> -->
<!--                         <li class="page-item active"><a class="page-link" href="#">1 <span class="sr-only">(current)</span></a></li> -->
<!--                         <li class="page-item"> -->
<!--                           <a class="page-link" href="#">2</a> -->
<!--                         </li> -->
<!--                         <li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!--                         <li class="page-item"> -->
<!--                           <a class="page-link" href="#"><i class="fas fa-chevron-right"></i></a> -->
<!--                         </li> -->
<!--                       </ul> -->
<!--                     </nav> -->
<!--                   </div> -->
                </div>
              </div>
<!--                         <hr class="mt-2 mb-2"> -->
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
					        <div class="row">
                      <div class="col-md-6 ">
                        <address>
                          <span><i class="fas fa-map-marked-alt mx-2"></i></span><strong>訂單地址:</strong><br>
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
                          <span><i class="far fa-calendar-alt mx-2"></i></span><strong>訂購時間:</strong><br>
                          <span id="ordertime"></span><br><br>
                        </address>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row mt-4">
                  <div class="col-md-11 mx-auto">
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
                      <tbody id="userlist">
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
        
    
    <%@include file="../frontcommonpages/shopbottom.jsp"%>
    
    <script src="https://www.paypalobjects.com/api/checkout.js"></script>
    <script >
    $(function(){		
		userorderlist()
		cancelstatus()
    })
    function userorderlist() {
		$.ajax({
			type:"post",
			url:"userorderquery",
			success:function(data){
// 				console.log(data)
				 var json = JSON.stringify(data,null,4);
	     	     var parsedObjinArray = JSON.parse(json);
	     	     var userorderlist = $('#userorderlist');
	     	     $('#userorderlist').empty("");
	     	     let a =1;
	     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
	     	     let number = a++;
	     	     var item =  '<tr id='+n.memberAccount+'>'+
	     	     '<td>'+number+'</td>'+
	     	     '<td>'+n.orderTime+'</td>'+
                 '<td>'+n.total+'</td>'+
                 '<td>'+"<a class='details' id="+n.paymentId+">&nbsp&nbsp&nbsp<i class='fas fa-info-circle information' data-bs-toggle='modal' data-bs-target='#exampleModal'></i>"+'</td>'+
                 '<td>'+'<div class="badge badge-primary orderstatus" id="'+n.paymentId+'status">'+n.orderStatus+'</div>'+'</td>'+
                 '<td>'+'<a href="#" class="btn btn-dark b '+n.paymentId+'cancelbtn" id='+n.paymentId+'>'+'<i class="fas fa-exclamation-triangle"></i>'+'取消訂單'+'</a>'+'</td>'+
               	 '</tr>';
               		userorderlist.append(item);
               		console.log(n.orderStatus)
//                		if(n.orderStatus=="取消訂單"){
//                			$('.'+n.paymentId+'cancelbtn').addClass('disabled')
//                		}
					if(n.orderStatus=="待出貨"){
						$("#"+n.paymentId+"status").text("待出貨")
					}else{
						$('.'+n.paymentId+'cancelbtn').addClass('disabled')
						$('.'+n.paymentId+'cancelbtn').html('<i class="fas fa-ban"></i>'+'取消訂單')
						if(n.orderStatus=="取消訂單"){
							$("#"+n.paymentId+"status").removeClass('badge-primary')
							$("#"+n.paymentId+"status").addClass('badge-warning')
						}else if(n.orderStatus=="已取消"){
							$("#"+n.paymentId+"status").removeClass('badge-primary')
							$("#"+n.paymentId+"status").addClass('badge-danger')
						}else{
							$("#"+n.paymentId+"status").removeClass('badge-primary')
							$("#"+n.paymentId+"status").addClass('badge-success')
						}
					}
					
// 					orderstatus()
// 					$(".cancelorder").on("click",cancelstatus)
					
	 				
	     	    });
// 	     	 	orderfinaltotal()	
			},
			error:function(error){
				console.log("error");
			}
		})
	}	
    
    $("#userorderlist").on("click", ".details", function () {
		let paymentId=$(this).attr("id");
// 			console.log(paymentId);
		let dtr = $(this).closest("th");
		 $.ajax({
			  type : "post",
			  url: "orderquery", 
		      data: {"paymentId":paymentId}, 
		      success: function(data) 
		        {
// 						console.log(data)
		    	  let address = JSON.parse(data.orderAddress);
// 			         	console.log(address)
		    	  $('#postalCode').text(address.postal_code);
		    	  $('#country').text(address.country_code);
		    	  $('#orderline1').text(address.line1);
		    	  $('#orderline2').text(address.line2);
		    	  $('#ordertime').text(data.orderTime);
		    	  $('#orderfinaltotal').text(data.total);
		    	  let json=JSON.stringify(data.orderItem,null,4)
// 		    	  console.log(json)
				  var parsedObjinArray = JSON.parse(json);
// 		    	  console.log(parsedObjinArray)
	     	     var userlist = $('#userlist');
	     	     $('#userlist').empty("");
	     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
	     	     var item =  '<tr id='+n.proId+'>'+
	     	    '<td>'+'<img class="proimg" src='+n.proPhoto+'/>'+'</td>'+
                 '<td>'+n.proName+'</td>'+
                 '<td class="text-center">'+n.proPrice+'</td>'+
                 '<td class="text-center" id="'+n.proId+'orderamount"></td>'+
	             '<td class="text-center" id="'+n.proId+'ordertotal"></td>'+
               	 '</tr>';
               	 console.log("111111");
               		userlist.append(item);
               	 $.ajax({
      			      url:"findorderamount",				
      			      method:"get",
      			      data:{"paymentId":paymentId,"proId":n.proId},
      			      success:function(data){
//       			    	console.log("test")
      			    	$("#"+n.proId+"orderamount").text(data);
      			    	$("#"+n.proId+"ordertotal").text(Math.round(data*n.proPrice));
      			    	  }
      			      
             		 })
	     	 	});
		        },
		      error: function(data) 
		        {
		           console.log('無法送出');
		        }
		  });			  
	});
    
    
    $("#userorderlist").on("click", ".b", function () {
		let paymentId=$(this).attr("id");
			console.log(paymentId);
		let dtr = $(this).closest("th");
		$.ajax({
			type:"get",
			url:"cancelstatus",
			data:{"paymentId":paymentId},
			success:function(data){	
	     	 	userorderlist()
     	 	
			},
			error:function(){
				console.log("error");
			}
		})		
	})
    
    
    
	
// 	$("#userorderlist").on("click", "#cancelorder", function () {
// 		let paymentId = $(this).attr("id");
// 		console.log($(this).closest("tr"));
// 		let dtr = $(this).closest("tr");
// 		  Swal.fire({
//                 title: '確定要取消訂單嗎?',
//                 text: "取消訂單後需等候管理員確認",
//                 icon: 'warning',
//                 showCancelButton: true,
//                 confirmButtonColor: '#3085d6',
//                 cancelButtonColor: '#d33',
//                 confirmButtonText: '確定取消!'
//               }).then((result) => {
//                 if (result.isConfirmed) {
//                   $.ajax({
//                         type: "GET",
//                         url: "cancelstatus",
//                         data:{"paymentId":paymentId}
//                         success: function(response) {  
//                         	dtr.remove();
//                              Swal.fire(
//                               '已取消訂單!',
//                               '請耐心等候管理員確認',
//                               'success'
//                             ) } ,
//                             error: function (xhr) {
//                             Swal.fire({
//                               icon: 'error',
//                               title: 'Oops...',
//                               text: 'Something went wrong!'
//                             }) },  //error close
//                      }); //ajax close          
//                 } //if close 

//            }); //then close 
// 	});
    
    </script>
  </body>
</html>       