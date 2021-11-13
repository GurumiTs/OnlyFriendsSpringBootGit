<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../commonpages/dashboardtop.jsp"%>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
.container{display:flex;margin-top:5%;}
#char1{width:40%;padding-top:2%;}
#rightarea{width:60%;margin:auto;background-color:#FDFFFF;height:100%}
#nar{justify-content: center; padding-left:22%;width:79%;font-size:1.2em;}
#title{text-align:center;margin-top:2%;}
#char2{width:70%;margin:auto;padding-right:50px;}
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
				<div class="container" style="height: 550px">								
						<div id="char1">
							<canvas id="myChart" width="400" height="400"></canvas>
						</div>
					<div id="rightarea">	
					<div id="nar">	
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link " aria-current="page"
							href="couponAnalyzeEntry.controller" id="cashButton">現金券</a></li>
						<li class="nav-item"><a class="nav-link"
							href="couponAnalyzeEntry2.controller" id="discountButton">折扣券</a></li>
						<li class="nav-item"><a class="nav-link"
							href="couponAnalyzeEntry3.controller" id="freightButton">運費券</a></li>
						<li class="nav-item"><a class="nav-link"
							href="couponAnalyzeEntry4.controller" id="companyButton">異業券</a></li>
					</ul>
					</div>
					
					<div id="title"><h4>異業券</h4></div>
						<div id="char2">
							<canvas id="myChart2" width="400" height="400"></canvas>
						</div>
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
		var couponRecord = [];
		var cash = 0;//現金券
		var company = 0;//異業券
		var discount = 0;//折價券
		var freight = 0;//運費券

		$(function() {

			$.ajax({
				type : 'POST',
				url : 'couponAnalyzeUserEntry.controller',

				dataType : 'json',

				success : function(res) {
					//console.log(data)
					var json = JSON.stringify(res, null, 3);
					var parsedObjinArray = JSON.parse(json);
					$.each(parsedObjinArray, function(i, n) {

						couponRecord.push(n.couponRecord);
					})
				}
			})
		})
		$(function() {

			function sleep (time) {
				  return new Promise((resolve) => setTimeout(resolve, time));
				}
			sleep(500).then(() => {
			$.ajax({
				type : 'GET',
				url : 'couponDetail.controller',

				dataType : 'json',

				success : function a(data) {

					var cr = "";
					for (let i = 0; i < couponRecord.length; i++) {
						
						cr += "," + couponRecord[i];
					}
				
					var cr1 = cr.split(",");

					for (let i = 0; i < cr1.length; i++) {						
						for (let j = 0; j < data.length; j++) {
							
							if (data[j].couponId == cr1[i] && data[j].category == "現金券") {//找出分類為現金券的數量~												
								cash++;								
							} else if (data[j].couponId == cr1[i] && data[j].category == "異業券") {
								company++;								
							} else if (data[j].couponId == cr1[i] && data[j].category == "折扣券") {
								discount++;
							} else if (data[j].couponId == cr1[i] && data[j].category == "運費券") {
								freight++;
							}
						}

					}
				
					var ctx = document.getElementById('myChart').getContext('2d');

					var myChart = new Chart(ctx, {
						type : 'doughnut',
						data : {
							labels : [ '現金券', '折扣券', '運費券', '異業券' ],
							datasets : [ {
								label : '# of Votes',
								data : [ cash, discount, freight, company ],
								backgroundColor : [ 'rgba(255, 99, 132, 0.5)',
										'rgba(54, 162, 235, 0.5)',
										'rgba(249, 230, 21, 0.5)',
										'rgba(75, 192, 192, 0.5)' ],
								borderColor : [ 'rgba(255, 99, 132, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(249, 230, 21, 1)',
										'rgba(75, 192, 192, 1)' ],
								borderWidth : 1
							} ]
						},
						options : {
							scales : {
								y : {
									beginAtZero : true
								}
							}

						}
					});
				}
			})
		})
		})
		//異業券
		var company1 = 0;
		var company2 = 0;
		var company3 = 0;
		$(function() {

			function sleep (time) {
				  return new Promise((resolve) => setTimeout(resolve, time));
				}
			sleep(500).then(() => {
			
					$.ajax({
						type : 'GET',
						url : 'couponDetail.controller',

						dataType : 'json',

						success : function a(data) {

							var cr = "";
							for (let i = 0; i < couponRecord.length; i++) {

								cr += "," + couponRecord[i];
							}

							var cr1 = cr.split(",");

							for (let i = 0; i < cr1.length; i++) {

								for (let j = 0; j < data.length; j++) {

									if (data[j].couponId == cr1[i] && data[j].couponName == "野餐風格包租借優惠券") {//找出分類為現金券的數量~												
										company1++;
									} else if (data[j].couponId == cr1[i] && data[j].couponName == "風車House包套式露營車租借優惠券") {
										company2++;										
									} else if (data[j].couponId == cr1[i] && data[j].couponName == "露營車日租優惠券") {
										company3++;									
									}
								}

							}						

							var ctx2 = document.getElementById('myChart2').getContext('2d');

							var myChart2 = new Chart(ctx2,{
										type : 'bar',
										data : {
											labels : [ '野餐風格包租借優惠券','風車House包套式露營車租借優惠券','露營車日租優惠券' ],
											datasets : [ {
												label : '',
												data : [ company1, company2,company3 ],
												backgroundColor : [
														'rgba(271, 94, 77, 0.7)',
														'rgba(255, 206, 86, 0.7)' ,
														'rgba(255, 135, 255, 0.7)'
														],
												borderColor : [
														'rgba(271, 94, 77, 1)',
														'rgba(255, 206, 86, 1)',
														'rgba(255, 135, 255, 1)'
														 ],
												borderWidth : 1
											} ]
										},
										options : {
											scales : {
												yAxes : [ {
													ticks : {
														beginAtZero : true,
														stepSize : 1
													}
												} ]
											}, legend: {
										        display: false
										    },
										    tooltips: {
										        callbacks: {
										           label: function(tooltipItem) {
										                  return tooltipItem.yLabel;
										           }
										        }
										    }
										}
									});
						}
					})

		})
		})
	</script>

</body>
</html>