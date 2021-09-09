<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../commonpages/dashboardtop.jsp"%>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
#area {
	width: 30%;
	height: 30%;
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
					<div id="area">
						<canvas id="myChart" width="400" height="400"></canvas>
					</div>

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
	 var couponRecord=[];
	 
	 var cash1;//現金券
	 var company1=0;//異業券
	 var discount1=0;//折價券
	 var freight1=0;//運費券
	//console.log(couponRecord)
		                  $(function () {
		                	  
		                	 
									$.ajax({
										type:'POST',
										url:'couponAnalyzeUserEntry.controller',
										
										dataType:'json',
										
										success:function(res){ 
											//console.log(data)
											  var json = JSON.stringify(res, null, 3);
                                              var parsedObjinArray = JSON.parse(json);
                                              $.each(parsedObjinArray,function(i,n){
										//for(let i=0;i<data.length;i++){
											//console.log(data[i].couponRecord)
											//var couponRecord = data[i].couponRecord.split(",");	
											//console.log("couponRecord:"+couponRecord)
											//console.log(data[i].couponRecord[0])
											//couponRecord+=","+data[i].couponRecord;											
											couponRecord.push(n.couponRecord);											
										})
										}		                	   		                	   
									 })						
		                  })
		                  $(function () {
		                	  
		                	 
									$.ajax({
										type:'GET',
										url:'couponDetail.controller',
										
										dataType:'json',
										
										success:function(data){ 
											
										
											console.log(data)
											console.log(couponRecord[0]);
											console.log(couponRecord[2]);
											
											var cr="";
											for(let i=0;i<couponRecord.length;i++){
												//console.log("couponRecord:"+couponRecord[i]);
												cr+=","+couponRecord[i];
											
											}
											console.log(cr);
											var cr1=cr.split(",");
											console.log(cr1);
											
											for(let i=0;i<cr1.length;i++){
												console.log(cr1[0]);
												console.log(cr1[2]);
											
												var cash=0;//現金券
												var company=0;//異業券
												var discount=0;//折價券
												var freight=0;//運費券
										for(let j=0;j<data.length;j++){
											//console.log("a:"+data[j].couponId)
											//console.log("b:"+cr1[i])
											//console.log("c:"+data[j].category)
											if(data[j].couponId == cr1[i] && data[j].category=="現金券"){//找出分類為現金券的數量~												
											    cash++;
										        console.log("cash:"+cash);
										        
											}else if(data[j].couponId == cr1[i] && data[j].category=="異業券"){
												company++;
												
												console.log("company:"+company);
											}else if(data[j].couponId == cr1[i] && data[j].category=="折扣券"){
												discount++;
												console.log("company:"+discount);
										    }else if(data[j].couponId == cr1[i] && data[j].category=="運費券"){
										    	freight++;
										    	console.log("freight:"+freight);
										    }
										}
										}
										}
		                	   
									 })
		                   
		                  })

						</script>
							<script>
var ctx = document.getElementById('myChart').getContext('2d');
console.log("cash123:"+cash1);	
var myChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: ['現金券', '折扣券', '運費券', '異業券'],
        datasets: [{
            label: '# of Votes',
            data: [cash1, discount, freight, company],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)'            
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)'   
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
</script>
</body>
</html>