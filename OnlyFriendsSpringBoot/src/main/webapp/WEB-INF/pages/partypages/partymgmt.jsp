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

.img1 {
	weight: 150px;
	height: 150px;
}

.edit a:hover {
	font-size: 130%;
}

.delete a:hover {
	font-size: 130%;
}

.delete {
	cursor: pointer;
}

.insert a img:hover {
	width: 50px;
	height: 50px;
	display: block;
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
					<h1 class="h3 mb-2 text-gray-800">會員活動管理</h1>
					<!--Employee DataTale  -->
					<div class="card shadow mb-4">
						
						<div class="card-body">
							<div class="table-responsive">
							<a href="partyadd.controller"><img
										src="images/smallicon/add.svg" alt=""></a>
							<table id="example" class="table table-striped"
											style="width: 100%">
											<thead>
												<tr>
													<th>Number</th>
													<th>Photo</th>
													<th>Name</th>
													<th>Type</th>
													<th>Time</th>
													<th>Time_UP</th>
													<th class="d-none">Plan</th>
													<th>County</th>
													<th>District</th>
													<th>Zipcode</th>
													<th>Place</th>
													<th>Condition</th>
													<th>Man</th>
													<th>Woman</th>
													<th>See</th>
													<th>edit</th>
													<th>Delete</th>
												</tr>
											</thead>
											<tbody>
												<c:if test='${not empty partyList}'>
													<c:forEach var="party" items="${partyList}">

														<tr id="${party.number}">

															<td id="${party.number}number">${party.number}</td>														
															<td id="${party.number}cover"><img src="${party.cover}" width="160px" height="160px"></td>
															<td id="${party.number}name">${party.name}</td>
															<td id="${party.number}type">${party.type}</td>
															<td id="${party.number}time">${party.time}</td>
															<td id="${party.number}time_up">${party.time_up}</td>
															
															<td class="d-none" id="${party.number}plany">${party.plany}</td>
															<td id="${party.number}conty">${party.county}</td>
															<td id="${party.number}district">${party.district}</td>
															<td id="${party.number}zipcode">${party.zipcode}</td>
															<td id="${party.number}place">${party.place}</td>
															
															<td id="${party.number}condition">${party.condition}</td>
															<td id="${party.number}man">${party.man}</td>
															<td id="${party.number}woman">${party.woman}</td>
															<td id="${party.number}see">${party.see}</td>  
															<td class="edit"><a href="partyupenty.controller?number=${party.number}">
															<i class="fas fa-edit">
															</i></a></td>
															<td class="delete" id="delete"><a> 
															<i class="far fa-trash-alt">
															</i><a></td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>
											<tfoot>
												<tr>
													<th>活動編號</th>
													<th>活動照片</th>
													<th>活動名稱</th>
													<th>活東類型</th>
													<th>活動時間</th>
													<th>截止時間</th>
													<th class="d-none">活動內容</th>
													<th>縣市</th>
													<th>區域</th>
													<th>郵遞區號</th>
													<th>地址</th>
													<th>參加條件</th>
													<th>男生人數</th>
													<th>女生人數</th>
													<th>看過人數</th>
													<th>編輯</th>
													<th>刪除</th>

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
	$(document).ready(function() {
		$('#example').DataTable();
	});
	
	$('.delete').on('click',function(){
	      let id = $(this).closest("tr").attr("id");
	     
	      Swal.fire({
              title: 'Are you sure?',
              text: "You won't be able to revert this!",
              icon: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
              if (result.isConfirmed) {

                $.ajax({
                      type: "POST",
                      url: "deleteparty.controller",
                      data: {"number" : id},
                      success: function(response) {                 
                           Swal.fire(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success'
                          ) } ,
                          error: function (xhr) {
                          Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Something went wrong!'

                          }) },  //error close
                   }); //ajax close
             $(this).closest("tr").remove(); 
             
              } //if close 

            }) //then close 
        }) //delete close
	</script>
 </body>
</html>	
	