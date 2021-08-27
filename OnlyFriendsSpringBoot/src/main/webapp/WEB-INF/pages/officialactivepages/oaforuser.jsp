<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>
<style>
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
					<h1 class="h3 mb-2 text-gray-800">Official Active</h1>
					<!--Employee DataTale  -->
					<div class="card shadow mb-4">
						
						<div class="card-body">
							<div class="table-responsive">
							
								<a href="oaforuserpages.controller" ><img src="images/smallicon/add.svg" alt=""></a>
							
							<table id="example" class="table table-striped" style="width:100%">
            <thead>
                <tr>
                	<th>照片</th>
			       <th>活動名稱</th>
			          <th>活動日期</th>
			          <th>活動類型1</th>
			          <th>活動類型2</th>
			          <th>活動縣市</th>
			          <th>活動行政區</th>
					  <th>即將開始</th>
			          
			          
			          
                </tr>
            </thead>
            <tbody>
     	<c:if test='${not empty alloaMember}'>
			<c:forEach var="oaBean" items="${alloaMember}">
         
          <tr id="${oaBean.active}">
          		   
		           <td id="${oaBean.active}imges"><img src="${oaBean.img}" width=100px height=100px></td>
		           <td id="${oaBean.active}active">${oaBean.active}</td>
		           <td id="${oaBean.date}date">${oaBean.date}</td>
		           <td id="${oaBean.atype}atype">${oaBean.atype}</td>
		           <td id="${oaBean.atype2}atype2">${oaBean.atype2}</td>
		           <td id="${oaBean.county}county">${oaBean.county}</td>
		           <td id="${oaBean.district}district">${oaBean.district}</td>

		           
					
							</c:forEach>
									</c:if>
		           
           
          <!--   <td><a href="updateProductForm.jsp?editId=${row.Id }">Edit</a></td>
           <td><a href="?delId=${row.Id }" onclick="return delConfirm('${row.Name}');">Del</a></td>-->
          </tr>
       
   
             </tbody>
            <tfoot>
                <tr>
               	<th>照片</th>
			       <th>活動名稱</th>
			          <th>活動日期</th>
			          <th>活動類型1</th>
			          <th>活動類型2</th>
			          <th>活動縣市</th>
			          <th>活動行政區</th>
					  <th>即將開始</th>
			        
			          
                </tr>
            </tfoot>
        </table>
				


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
	</script>
 </body>
</html>	
	
