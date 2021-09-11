<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../commonpages/dashboardtop.jsp"%>
<style>
#top {
	display: flex;
	width: 50%;
	padding-right: 100px;
}

#main {
	width: 50%;
	color: black;
}

input[type=text], [type=date], #adConditionInsert, #adConditionUpdate {
	width: 100%;
	box-sizing: border-box;
	border: 3px solid #555;
	color: black;
}

.line {
	margin-bottom: -10px;
}

.formName {
	margin-bottom: -10px;
}

#topImg {
	height: 50%;
	width: 70%;
	margin: 7% 0 0 6%;
}

#buttomImg {
	height: 50%;
	width: 70%;
	margin: -5% 0 0 6%;
}

#all {
	display: flex;
}

.fileplus {
	width: 30%;
}

#mainpage {
	width: 60%;
	margin: auto;
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
					<h4>廣告</h4>
					<div class="modal-content modal-dialog-scrollable" id="mainpage">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">
								修改 <img src='images/couponPic/fileplus.JPG' class="fileplus">
							</h5>

						</div>
						<div class="modal-body">

							<form class="container"
								action="empupdateAdvertisement.controller" method="post"
								enctype="multipart/form-data">
								<div id="all">
									<div id="top">
										<div id="topleft">
											<div id="topImg">
												<img id="imgUpdate" name="img"
													src="images/couponPic/pic.JPG"
													style="width: 100%; height: 50%;"><br> <input
													type="file" name="adImg" accept="image/*"
													onchange="loadFile(event)" required>
											</div>
											<div id="buttomImg">
												<img id="imgUpdate2" name="img"
													src="images/couponPic/pic.JPG"
													style="width: 100%; height: 50%;"> <input type="file"
													name="adImg" accept="image/*" onchange="loadFile2(event)"
													required>
											</div>
										</div>
									</div>
									<script>
										var loadFile = function(event) {
											var output = document
													.getElementById('imgUpdate');
											output.src = URL
													.createObjectURL(event.target.files[0]);
											output.onload = function() {
												URL.revokeObjectURL(output.src)
											}

										};

										var loadFile2 = function(event) {
											var output = document
													.getElementById('imgUpdate2');
											output.src = URL
													.createObjectURL(event.target.files[0]);
											output.onload = function() {
												URL.revokeObjectURL(output.src)
											}

										};
									</script>
									<div id="main">

										<div class="mb-3">
											<label for="adId" class="formName form-label">案件編號</label>
											<div class="line">
												<input placeholder="請輸入案件編號" type="text" name="adId"
													id="adIdUpdate" class="form-control" required>
											</div>
											<br> <label for="adCompanyName"
												class="formName form-label">廠商名稱</label>
											<div class="line">
												<input placeholder="請輸入廠商名稱" type="text"
													name="adCompanyName" id="adCompanyNameUpdate"
													class="form-control" required>
											</div>
											<br> <label for="adCompanyPhone;"
												class="formName form-label">連絡電話</label>
											<div class="line">
												<input placeholder="請輸入連絡電話" type="text"
													name="adCompanyPhone" id="adCompanyPhoneUpdate"
													class="form-control" required>
											</div>
											<br> <label for="adCompanyEmail"
												class="formName form-label">電子郵件</label>
											<div class="line">
												<input placeholder="請輸入電子郵件" type="text"
													name="adCompanyEmail" id="adCompanyEmailUpdate"
													class="form-control" required>
											</div>
											<br> <label for="adName" class="formName form-label">廣告名稱</label>
											<div class="line">
												<input placeholder="請輸入廣告名稱" type="text" id="adNameUpdate"
													name="adName" class="form-control" required>
											</div>
											<br> <label for="adStartDate"
												class="formName form-label">上架日</label>
											<div class="line">
												<input type="date" name="adStartDate" id="adStartDateUpdate"
													class="form-control">
											</div>
											<br> <label for="adEndDate" class="formName form-label">下架日</label>
											<div class="line">
												<input type="date" name="adEndDate" id="adEndDateUpdate"
													class="form-control">
											</div>
											<br> <label for="adCondition" class="formName">分類名稱</label>
											<div class="line">
												<select name="adCondition" id="adConditionUpdate"
													class="form-control" required>
													<option value="">請選擇</option>
													<option value="未上架">未上架</option>
													<option value="已上架1" id="op1">已上架1</option>
													<option value="已上架2" id="op2">已上架2</option>
													<option value="已下架">已下架</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<br> <br>
								<div class="modal-footer">
									<input type="submit" class="btn btn-primary" value="送出">
									<a href="Advertisement.controller" class="btn btn-secondary">首頁</a>
								</div>
							</form>
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
                                  $(function () {
                                       var url_String = location.href;
                                       var url = new URL(url_String);
                                       var adId = url.searchParams.get("adId");
                                       console.log(adId)

                                       var op1= $('#op1').val();
			                           var op2= $('#op2').val();

                                     $.ajax({
										   type:'POST',
						               	   url:'showAd.controller',
						               	   dataType:'JSON',
						               	   contentType:'application/json',
						               	   success(data) {
						               	   console.log(data)
						               	 for(let i=0;i<data.length;i++){					      
						               		 console.log(data[i].adId)
						               			 console.log(data[i].adCondition)
						               			if(data[i].adCondition==op1 && adId!=data[i].adId){
						    						//console.log()
						    						$("option[value='已上架1']").attr("disabled", "disabled");
						    						
						    					}else if(data[i].adCondition==op2 && adId!=data[i].adId){
						    						$("option[value='已上架2']").attr("disabled", "disabled");
						    					}	
						    					
						    					if(adId==data[i].adId){
						               			 console.log(data[i].adImg[0])
						               			 var adImg = data[i].adImg.split(",");	
						               			 
					                            $('#imgUpdate').attr("src",adImg[0]);	
						               			$('#imgUpdate2').attr("src",adImg[1]);	
												$('#adCompanyNameUpdate').val(data[i].adCompanyName);
												$('#adCompanyPhoneUpdate').val(data[i].adCompanyPhone);
												$('#adCompanyEmailUpdate').val(data[i].adCompanyEmail);
												$('#adNameUpdate').val(data[i].adName);
												$('#adStartDateUpdate').val(data[i].adStartDate);																					
												$('#adEndDateUpdate').val(data[i].adEndDate);	
												$('#adConditionUpdate').val(data[i].adCondition);
												$('#adIdUpdate').val(data[i].adId);
												
						               		   }
						               	   }
						               	   
						               	   }

						               	})
})
</script>

</body>
</html>