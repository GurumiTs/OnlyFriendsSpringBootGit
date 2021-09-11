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
#char2{width:70%;margin:auto;padding-right:3%;}
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
					
					<div id="title"><h4>現金券</h4></div>
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

						success : function (data) {

							console.log(data)
							//console.log(couponRecord[0]);
							//console.log(couponRecord[2]);

							var cr = "";
							for (let i = 0; i < couponRecord.length; i++) {
								//console.log("couponRecord:"+couponRecord[i]);
								cr += "," + couponRecord[i];

							}
							//console.log(cr);
							var cr1 = cr.split(",");
							console.log(cr1);

							for (let i = 0; i < cr1.length; i++) {
								//console.log(cr1[0]);
								//console.log(cr1[2]);

								for (let j = 0; j < data.length; j++) {
									//console.log("a:"+data[j].couponId)
									//console.log("b:"+cr1[i])
									//console.log("c:"+data[j].category)
									if (data[j].couponId == cr1[i] && data[j].category == "現金券") {//找出分類為現金券的數量~												
										cash++;										
										//  console.log("cash:"+cash);
									} else if (data[j].couponId == cr1[i] && data[j].category == "異業券") {
										company++;
										//console.log("company:"+company);
									} else if (data[j].couponId == cr1[i] && data[j].category == "折扣券") {
										discount++;
										//console.log("company:"+discount);
									} else if (data[j].couponId == cr1[i] && data[j].category == "運費券") {
										freight++;
										//console.log("freight:"+freight);
									}
								}

							}
							//console.log("cash:" + cash);
							//console.log("company:" + company);
							//console.log("company:" + discount);
							//console.log("freight:" + freight);

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
	                              	//現金券
	                             	var cash1 = 0;
	                            	var cash2 = 0;
	                             	var cash3 = 0;
	                            	var cash4 = 0;
	                      	$(function() {

			

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
													
														if (data[j].couponId == cr1[i] && data[j].couponName == "新會員歡迎禮") {//找出分類為現金券的數量~												
															cash1++;														
														   // console.log("cash1:"+cash1);
														} else if (data[j].couponId == cr1[i] && data[j].couponName == "全站滿5000折600") {
															cash2++;
															//console.log("cash2:"+cash2);
														} else if (data[j].couponId == cr1[i] && data[j].couponName == "全站滿4000折500") {
															cash3++;
															//console.log("cash3:"+cash3);
														} else if (data[j].couponId == cr1[i] && data[j].couponName == "全站滿3000折400") {
															cash4++;
															//console.log("cash4:"+cash4);
														}
													}

												}
												console.log("cash1:" + cash1);
												console.log("cash2:"+ cash2);
												console.log("cash3:"+ cash3);
												console.log("cash4:"+ cash4);

												var ctx2 = document.getElementById('myChart2').getContext('2d');

												var myChart2 = new Chart(ctx2,{
															type : 'bar',
															data : {
																labels : ['新會員歡迎禮','全站滿5000折600','全站滿4000折500','全站滿3000折400' ],
																datasets : [ {
																	label : '現金券',
																	data : [cash1,cash2,cash3,cash4],
																	backgroundColor : [
																		    'rgba(271, 94, 77, 0.7)',
																		    'rgba(255, 206, 86, 0.7)' ,
																		    'rgba(97, 105, 218, 0.7)',
																			'rgba(255, 135, 255, 0.7)' ],
																	borderColor : [
																		     'rgba(271, 94, 77, 1)',
																		     'rgba(255, 206, 86, 1)',
																		     'rgba(97, 105, 218, 1)',
																			 'rgba(255, 135, 255, 1)' ],
																	borderWidth : 1
																} ]
															},
															options : {
																scales: {
													                yAxes : [{
													                    ticks : {													                         
													                    	beginAtZero:true,
													                    	stepSize: 1
													                    }
													                }]
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
		
		//折扣券
		var discount1 = 0;
		var discount2 = 0;
		var discount3 = 0;
		$(function() {

			$('#discountButton').click(function() {

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
													
														if (data[j].couponId == cr1[i] && data[j].couponName == "秋日購物全館九折") {//找出分類為現金券的數量~												
															discount1++;														
														   // console.log("cash1:"+cash1);
														} else if (data[j].couponId == cr1[i] && data[j].couponName == "全站滿萬打八折") {
															discount2++;
															//console.log("cash2:"+cash2);
														} else if (data[j].couponId == cr1[i] && data[j].couponName == "招桃小物全館九折") {
															discount3++;
															//console.log("cash3:"+cash3);
														}
													}

												}
												console.log("discount1:" + discount1);
												console.log("discount2:"+ discount2);
												console.log("discount3:"+ discount3);
												

												var ctx2 = document.getElementById('myChart2').getContext('2d');

												var myChart2 = new Chart(ctx2,{
															type : 'bar',
															data : {
																labels : ['秋日購物全館九折','全站滿萬打八折','招桃小物全館九折' ],
																datasets : [ {
																	label : '折扣券',
																	data : [discount1,discount2,discount3],
																	backgroundColor : [
																			'rgba(255, 99, 132, 0.5)',
																			'rgba(54, 162, 235, 0.5)',
																			'rgba(255, 206, 86, 0.5)'],
																	borderColor : [
																			'rgba(255, 99, 132, 1)',
																			'rgba(54, 162, 235, 1)',
																			'rgba(255, 206, 86, 1)'],
																	borderWidth : 1
																} ]
															},
															options : {
																scales: {
													                yAxes : [{
													                    ticks : {													                         
													                    	beginAtZero:true,
													                    	stepSize: 1
													                    }
													                }]
													            }

															}
														});
											}
										})
							})
		})
		
		//運費券
		var freight1 = 0;
		var freight2 = 0;
		var freight3 = 0;
		$(function() {

			$('#freightButton').click(function() {

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
													
														if (data[j].couponId == cr1[i] && data[j].couponName == "秋日購物免運費") {//找出分類為現金券的數量~												
															freight1++;														
														   // console.log("cash1:"+cash1);
														} else if (data[j].couponId == cr1[i] && data[j].couponName == "購物滿899免運費") {
															freight2++;
															//console.log("cash2:"+cash2);
														} else if (data[j].couponId == cr1[i] && data[j].couponName == "購物滿699運費折半") {
															freight3++;
															//console.log("cash3:"+cash3);
														}
													}

												}
												console.log("freight1:" + freight1);
												console.log("freight2:"+ freight2);
												console.log("freight3:"+ freight3);
												

												var ctx2 = document.getElementById('myChart2').getContext('2d');

												var myChart2 = new Chart(ctx2,{
															type : 'bar',
															data : {
																labels : ['秋日購物免運費','購物滿899免運費','購物滿699運費折半' ],
																datasets : [ {
																	label : '運費券',
																	data : [freight1,freight2,freight3],
																	backgroundColor : [
																			'rgba(255, 99, 132, 0.5)',
																			'rgba(54, 162, 235, 0.5)',
																			'rgba(255, 206, 86, 0.5)'],
																	borderColor : [
																			'rgba(255, 99, 132, 1)',
																			'rgba(54, 162, 235, 1)',
																			'rgba(255, 206, 86, 1)'],
																	borderWidth : 1
																} ]
															},
															options : {
																scales: {
													                yAxes : [{
													                    ticks : {													                         
													                    	beginAtZero:true,
													                    	stepSize: 1
													                    }
													                }]
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

			$('#companyButton').click(function() {

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
														   // console.log("cash1:"+cash1);
														} else if (data[j].couponId == cr1[i] && data[j].couponName == "風車House包套式露營車租借優惠券") {
															company2++;
															//console.log("cash2:"+cash2);
														} else if (data[j].couponId == cr1[i] && data[j].couponName == "露營車日租優惠券") {
															company3++;
															//console.log("cash3:"+cash3);
														}
													}

												}
												console.log("company1:" + company1);
												console.log("company2:"+ company2);
												console.log("company3:"+ company3);
												

												var ctx2 = document.getElementById('myChart2').getContext('2d');

												var myChart2 = new Chart(ctx2,{
															type : 'bar',
															data : {
																labels : ['野餐風格包租借優惠券','風車House包套式露營車租借優惠券','露營車日租優惠券' ],
																datasets : [ {
																	label : '異業券',
																	data : [company1,company2,company3],
																	backgroundColor : [
																			'rgba(255, 99, 132, 0.5)',
																			'rgba(54, 162, 235, 0.5)',
																			'rgba(255, 206, 86, 0.5)'],
																	borderColor : [
																			'rgba(255, 99, 132, 1)',
																			'rgba(54, 162, 235, 1)',
																			'rgba(255, 206, 86, 1)'],
																	borderWidth : 1
																} ]
															},
															options : {
																scales: {
													                yAxes : [{
													                    ticks : {													                         
													                    	beginAtZero:true,
													                    	stepSize: 1
													                    }
													                }]
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