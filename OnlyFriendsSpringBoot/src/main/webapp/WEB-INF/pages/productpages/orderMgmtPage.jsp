<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>
<style>
.edit {
	cursor: pointer;
	color: green;
}

.delete {
	cursor: pointer;
	color: red;
}

.edit:hover {
	color: green;
}

.delete:hover {
	color: red;
}

.img1 {
	weight: 100px;
	height: 100px;
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
											<th>訂單商品</th>
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
											<th>訂單商品</th>

										</tr>
									</tfoot>
								</table>

							</div>
						</div>
					</div>
					<!-- table end -->

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
			}, {
				"data": "orderAddress"
			}, {
				"data" : "total"
			}, {
				"data": null,
	            render:function(data, type, row)
	            {
	              return data.proName;
	            }
			} ]
		})
		  
// 		$(function(){
// 			getordertable() 
// 		})
// 		function getordertable () {
// 			console.log("hello")
// 			$.ajax({
// 				type:"get",
// 				url:"order.controller",
// 				success:function(data){
// // 					 console.log(data);
// 					 var json = JSON.stringify(data,null,4);
// 		     	     var parsedObjinArray = JSON.parse(json);
// 		     	     var ordertable = $('#ordertable');
// 		     	     $('#ordertable').empty("");
// 		     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
// 		     	     var item = '<tr id='+n.orderDetails.paymentId+'>'+
// 		 				'<td>'+n.orderDetails.memberAccount+'</td>'+
// 		 				'<td>'+n.orderDetails.orderTime+'</td>'+
// 		 				'<td>'+n.orderDetails.orderAddress.line1+'</td>'+
// 		 				'<td>'+n.orderDetails.total+'</td>'+
// 		 				'<td>'+n.orderDetails.proName+'</td>'+
// 		 				'</tr>';
// 		 				ordertable.append(item);
		 				
// 		     	    });
// 				},
// 				error:function(){
// 					console.log("error");
// 				}
// 			})
// 		}	
		/* load data table */
		
		
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