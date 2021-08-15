<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

#delete {
	color: red;
	resize: 64px;
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
							<a href="insertProdcut.controller"><img
					src="images/smallicon/add-file.png" width="45px" height="45px"></a>
				<table id="example" class="table table-striped" style="width: 100%">
					<thead>
						<tr>
							<th>Id</th>
							<th>Photo</th>
							<th>Name</th>
							<th>Price</th>
							<th>Item</th>
							<th>Num</th>
							<th>Shipping</th>
							<th>Description</th>

							<th>Del</th>
							<th>Edit</th>
						</tr>
					</thead>
					<tbody>
					<c:if test='${not empty proList }'>
						<c:forEach items="${proList}" var="product">
							<tr>
								<td id="Id">${product.proId }</td>
								<td id="Photo"><img src="${product.proPhoto}" width="64px" height="64px"></td>
								<td id="Name">${product.proName }</td>
								<td id="Price">${product.proPrice }</td>
								<td id="Item">${product.proItem }</td>
								<td id="Num">${product.proNum}</td>
								<td id="Shipping">${product.proShipping}</td>
								<td id="Description">${product.proDescription}</td>
								<script>
									function delConfirm(Name) {
										return confirm("Delete [" + Name
												+ "] ?");
									}
								</script>

								<td class="delete"><a href="deleteentry.controller?delId=${product.proId }"
									onclick="return delConfirm('${product.proName}');"><img
										src="images/smallicon/trash.png" width="32px" height="32px"></a></td>
								<td class="edit"><a
									href="updateentry.controller?editId=${product.proId }"><img
										src="images/smallicon/edit.png" width="32px" height="32px"></a></td>
							</tr>
						</c:forEach>
						</c:if>
					</tbody>
					<tfoot>
						<tr>
							<th>Id</th>
							<th>Photo</th>
							<th>Name</th>
							<th>Price</th>
							<th>Item</th>
							<th>Num</th>
							<th>Shipping</th>
							<th>Description</th>

							<th>Del</th>
							<th>Edit</th>
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
		$(document).ready(function(){
			
	
		/* load data table */
		var table = $('#example').DataTable({
		    "ajax": {
		    	"url": "productPage.controller",
		    },
		    "columns": [
		        { "data": "Id" },
		        { "data":"Photo"},
		        { "data":"Name" }, 
		        { "data":"Price"},	  
		        { "data":"Item"},	  
		        { "data":"Num"},	  
		        { "data":"Shipping"},	  
		        { "data":"Description"},	  
		        {
		            "data": null,
		            render:function(data, type, row)
		            {
		              return "<i id="+data.Id+" class='fas fa-user-edit edit' data-bs-toggle='modal' data-bs-target='#exampleModal'></i> <span>|</span> <i class='far fa-trash-alt delete' id="+data.Id+"></i>";
		            },
		            "targets": -1
		        }
		    ]
		});		
		/* load data table */
		
		/*direct edit page*/
// 		$('.edit').load("updateentry.controller");
		/*direct edit page*/
	
		/*show edit employee basic info*/
		  $("#example tbody").DataTable {
			  let product = $(this).attr("Id");
			  $.ajax({
				  type : "post",
				  url: "productquery",   
			      dataType: "json",   
			      cache: false,   
			      data: {"product":product}, 
			      success : function(data) 
			        {
			    	  $('#Id').prop("value",data.Id);
			    	  $('#Photo').prop("value",data.Photo);
			    	  $('#Name').prop("value",data.Name);
			    	  $('#Price').prop("value",data.Price);
			    	  $('#Item').prop("value",data.Item);
			    	  $('#Num').prop("value",data.Num);
			    	  $("#Shipping").prop("value",data.Shipping);
			          $("#Description").prop("value",data.Description);
			    	  
			        },error: function(data) 
			        {
			           console.log('無法送出');
			        }
			  });			  
		});
		})
 		/*show edit employee basic info*/
	</script>
 </body>
</html>	
	
