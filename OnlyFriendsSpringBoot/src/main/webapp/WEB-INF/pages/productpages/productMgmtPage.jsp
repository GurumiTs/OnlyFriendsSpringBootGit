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
								<img
									src="images/smallicon/add-file.png" class="inserticon"
									width="45px" height="45px">
								<table id="example" class="table table-striped"
									style="width: 100%">
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


											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<!--      <tbody> -->
									<%--      <c:if test='${not empty proList }'> --%>
									<%--       <c:forEach items="${proList}" var="product"> --%>
									<!--        <tr> -->
									<%--         <td id="Id">${product.proId }</td> --%>
									<%--         <td><img id="Photo" src="${product.proPhoto}" width="64px" height="64px"></td> --%>
									<%--         <td id="Name">${product.proName }</td> --%>
									<%--         <td id="Price">${product.proPrice }</td> --%>
									<%--         <td id="Item">${product.proItem }</td> --%>
									<%--         <td id="Num">${product.proNum}</td> --%>
									<%--         <td id="Shipping">${product.proShipping}</td> --%>
									<%--         <td id="Description">${product.proDescription}</td> --%>
									<!--         <script> 
     function delConfirm(Name) {
           return confirm("Delete [" + Name
             + "] ?");
          }
         </script> -->

									<!--         <td class="edit"><a -->
									<%--          href="updateentry.controller?editId=${product.proId }"><img --%>
									<!--           src="images/smallicon/edit.png" width="32px" height="32px"></a></td> -->
									<%--         <td class="delete"><a href="deleteentry.controller?delId=${product.proId }" --%>
									<%--          onclick="return delConfirm('${product.proName}');"><img --%>
									<!--           src="images/smallicon/trash.png" width="32px" height="32px"></a></td> -->
									<!--        </tr> -->
									<%--       </c:forEach> --%>
									<%--       </c:if> --%>
									<!--      </tbody> -->
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


											<th>Edit</th>
											<th>Delete</th>

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
		//   $(document).ready(function(){

		/* load data table */
		var table = $('#example').DataTable({
			"ajax" : {
				"url" : "product.controller",
			},
			"columns" : [ {
				"data" : "proId"
			}, {
				"data" : null,
				render : function(data, type, row) {
					return "<img src="+data.proPhoto+" class='img1'>";
				}
			}, {
				"data" : "proName"
			}, {
				"data" : "proPrice"
			}, {
				"data" : "proItem"
			}, {
				"data" : "proNum"
			}, {
				"data" : "proShipping"
			}, {
				"data" : "proDescription"
			}, {
				"data" : null,
				render : function(data, type, row) {
					return "<i class='fas fa-edit edit'></i>";
				}
			}, {
				"data" : null,
				render : function(data, type, row) {
					return "<i class='far fa-trash-alt'></i>";
				}
			} ]
		});
		/* load data table */
		/*direct add page*/
		$("#example tbody").on("click", ".inserticon", function () {
			$.ajax({
				type:"GET",
				url:"insertProdcut.controller"
			})
		}
		
		/*direct add page*/
		
		/*direct edit page*/
		$('.far fa-edit').load("updateentry.controller");
		/*direct edit page*/

		/*show edit employee basic info*/
		//     $("#example tbody").DataTable {
		//      let product = $(this).attr("Id");
		//      $.ajax({
		//       type : "post",
		//       url: "productquery",   
		//          dataType: "json",   
		//          cache: false,   
		//          data: {"product":product}, 
		//          success : function(data) 
		//            {
		//           $('#Id').prop("value",data.Id);
		//           $('#Photo').prop("value",data.Photo);
		//           $('#Name').prop("value",data.Name);
		//           $('#Price').prop("value",data.Price);
		//           $('#Item').prop("value",data.Item);
		//           $('#Num').prop("value",data.Num);
		//           $("#Shipping").prop("value",data.Shipping);
		//              $("#Description").prop("value",data.Description);
		//            },error: function(data) 
		//            {
		//               console.log('無法送出');
		//            }
		//      });     
		//   });
		//   })
		/*show edit employee basic info*/
	</script>
</body>
</html>