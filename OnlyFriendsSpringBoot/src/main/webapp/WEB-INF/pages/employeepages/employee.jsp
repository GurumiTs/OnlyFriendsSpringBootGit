<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>

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

				<!-- container-fluid  -->
				<div class="container-fluid">

					<h1 class="h3 mb-2 text-gray-800">Dashboards</h1>
				<!-- first row  -->	
				<div class="row my-3">	
				
				<div class="col-4">
                <div class="card border-left-success shadow h-100 py-2">
                  <div class="card-body">
                    <div class="row no-gutters align-items-center">
                      <div class="col mr-2">
                        <div
                          class="
                            text-xs
                            font-weight-bold
                            text-success text-uppercase
                            mb-1
                          "
                        >
                         金幣總銷售額 (Annual)
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="storedannual">
                         
                        </div>
                      </div>
                      <div class="col-auto">
                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>             
            
             </div>   
             <!-- first row  -->	
             
            <!-- second row  -->
            <div class="row my-3">	
				 <div class="col-6">
                <div class="card shadow mb-4">
                  <!-- Card Header - Dropdown -->
                  <div
                    class="
                      card-header
                      py-3
                      d-flex
                      flex-row
                      align-items-center
                      justify-content-between
                    "
                  >
                    <h6 class="m-0 font-weight-bold text-primary">
                      邱比金幣銷售額
                    </h6>
                    <div class="dropdown no-arrow">                                       
                    </div>
                  </div>
                  <!-- Card Body -->
                  <div class="card-body">
                    <div class="chart-pie pt-4 pb-2">
                      <canvas id="myChart"></canvas>
                    </div>
                    <div class="mt-4 text-center small">
                      <span class="mr-2">
                        <i class="fas fa-circle text-primary"></i> 新台幣/月份
                      </span>              
                    </div>
                  </div>
                </div>
              </div> 
					  
		 </div>   	
		 <!-- second row  -->
		 
		 
		 
		 	
				</div>
				<!-- container-fluid -->

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
$(function(){
	storedchart()
	storedannual()
})

function storedchart(){
	 $.ajax({
         type: "post",
         url: "total",
         success: function (data) {
        	 var ctx = document.getElementById('myChart');
        	 var myChart = new Chart(ctx, {
        	     type: 'bar',
        	     data: {
        	         labels: ['1', '2', '3', '4', '5', '6','7','8','9','10','11','12'],
        	         datasets: [{
        	             label: '',
        	             data: data ,
        	             backgroundColor: [
        	                 'rgba(255, 99, 132, 0.2)',
        	                 'rgba(54, 162, 235, 0.2)',
        	                 'rgba(255, 206, 86, 0.2)',
        	                 'rgba(75, 192, 192, 0.2)',
        	                 'rgba(153, 102, 255, 0.2)',
        	                 'rgba(255, 159, 64, 0.2)',
        	                 'rgba(255, 99, 132, 0.2)',
        	                 'rgba(54, 162, 235, 0.2)',
        	                 'rgba(255, 206, 86, 0.2)',
        	                 'rgba(75, 192, 192, 0.2)',
        	                 'rgba(153, 102, 255, 0.2)',
        	                 'rgba(255, 159, 64, 0.2)',
        	             ],
        	             borderColor: [
        	                 'rgba(255, 99, 132, 1)',
        	                 'rgba(54, 162, 235, 1)',
        	                 'rgba(255, 206, 86, 1)',
        	                 'rgba(75, 192, 192, 1)',
        	                 'rgba(153, 102, 255, 1)',
        	                 'rgba(255, 159, 64, 1)',
        	                 'rgba(255, 99, 132, 1)',
        	                 'rgba(54, 162, 235, 1)',
        	                 'rgba(255, 206, 86, 1)',
        	                 'rgba(75, 192, 192, 1)',
        	                 'rgba(153, 102, 255, 1)',
        	                 'rgba(255, 159, 64, 1)'
        	             ],
        	             borderWidth: 1
        	         }]
        	     },
        	     options: {
        	         scales: {
        	             y: {
        	                 beginAtZero: true
        	             }
        	         }
        	     }
        	 });
         },
         error:function(xhr){
        	 console.log("error")
         },
	 });
	
}

function storedannual(){
	 $.ajax({
         type: "post",
         url: "storedannual",
         success: function (data) {
        	 $('#storedannual').text(data)
         },
         error:function(xhr){
        	 console.log("storedannual error")
         },
      });
	
	
	
}

</script>
	
</body>
</html>
