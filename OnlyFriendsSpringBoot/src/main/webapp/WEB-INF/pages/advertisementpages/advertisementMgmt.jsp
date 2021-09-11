<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AD</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@include file="../commonpages/dashboardtop.jsp"%>
<style>
.img {
	width: 80px;
	height: 70px;
}

#top {
	display: flex;
	width: 50%;
	padding-right: 100px;
}

#main {
	width: 50%;
	color: black;
}

#topright {
	margin-left: auto;
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

#right {
	height: 500px;
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
.card-body{border: 3px solid #555;}
table{

　　word-break:break-all;

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
					<h1 class="h3 mb-2 text-gray-800">AD Tables</h1>
					
					<div class="card shadow mb-4">

						<div class="card-body" style="width: 100%">
							<div class="table-responsive">
								<a data-bs-toggle="modal" data-bs-target="#insert"><img
									src='images/couponPic/fileplus.JPG' style="width: 3%" id="insertpic"></a>
							
							<table id="ad" class="table" style="width: 100%;text-align:center;">
								<thead>
									<tr>
										<th>案件編號</th>
										<th>廠商名稱</th>
										<th>連絡電話</th>
										<!--  <th>電子郵件</th>-->
										<th>廣告名稱</th>
										<th>上架日</th>
										<th>下架日</th>
										<th>狀態</th>
										<th>圖片1</th>
										<th>圖片2</th>
										<th>修改</th>
										<th>刪除</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>
							</div>
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

	<!---------------------------------------- 新增-------------------------------------------- -->
	<div class="modal fade" id="insert" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-dialog-scrollable"
				style="width: 650px; margin: 50px auto;">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">
						新增 <img src='images/couponPic/fileplus.JPG' class="fileplus">
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form class="container" action="empinsertAdvertisement.controller"
						method="post" enctype="multipart/form-data">
						<div id="all">
							<div id="top">
								<div id="topleft">
									<div id="topImg">
										<img id="imgInsert" name="img" src="images/couponPic/pic.JPG"
											style="width: 100%; height: 50%;"><br> <input
											type="file" name="adImg" accept="image/*"
											onchange="loadFile(event)" required>
									</div>
									<div id="buttomImg">
										<img id="imgInsert2" name="img" src="images/couponPic/pic.JPG"
											style="width: 100%; height: 50%;"> <input type="file"
											name="adImg" accept="image/*" onchange="loadFile2(event)"
											required>
									</div>
								</div>
							</div>
							<script>
								var loadFile = function(event) {
									var output = document
											.getElementById('imgInsert');
									output.src = URL
											.createObjectURL(event.target.files[0]);
									output.onload = function() {
										URL.revokeObjectURL(output.src)
									}

								};

								var loadFile2 = function(event) {
									var output = document
											.getElementById('imgInsert2');
									output.src = URL
											.createObjectURL(event.target.files[0]);
									output.onload = function() {
										URL.revokeObjectURL(output.src)
									}

								};
							</script>							
							<div id="main">
								<div class="mb-3">
									<label for="adCompanyName" class="formName form-label">廠商名稱</label>
									<div class="line">
										<input placeholder="請輸入廠商名稱" type="text" name="adCompanyName"
											id="adCompanyNameInsert" class="form-control" required>
									</div>
									<br> <label for="adCompanyPhone;" class="formName form-label">連絡電話</label>
									<div class="line">
										<input placeholder="請輸入連絡電話" type="text" name="adCompanyPhone"
											id="adCompanyPhoneInsert" class="form-control" required>
									</div>
									<br> <label for="adCompanyEmail" class="formName form-label">電子郵件</label>
									<div class="line">
										<input placeholder="請輸入電子郵件" type="text" name="adCompanyEmail"
											id="adCompanyEmailInsert" class="form-control" required>
									</div>
									<br> <label for="adName" class="formName form-label">廣告名稱</label>
									<div class="line">
										<input placeholder="請輸入廣告名稱" type="text" id="adNameInsert"
											name="adName" class="form-control" required>
									</div>
									<br> <label for="adStartDate" class="formName form-label">上架日</label>
									<div class="line">
										<input type="date" name="adStartDate" id="adStartDateInsert" class="form-control">
									</div>
									<br> <label for="adEndDate" class="formName form-label">下架日</label>
									<div class="line">
										<input type="date" name="adEndDate" id="adEndDateInsert" class="form-control">
									</div>
									<br> <label for="adCondition" class="formName form-label">分類名稱</label>
									<div class="line">
										<select name="adCondition" id="adConditionInsert" class="form-control" required style="background-color:white;">
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
							<input type="reset" class="btn btn-secondary" value="清除">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			console.log("ad")
			                 $('#ad').DataTable(
			                	
							   {

								"ajax" : {
									"url" : "AdvertisementAll.controller",
									"dataSrc" : "adAll"
								},
								"columns" : [
										{
											"data" : "adId"
										},
										{
											"data" : "adCompanyName"
										},
										{
											"data" : "adCompanyPhone"
										},
										//{
										//	"data" : "adCompanyEmail"
									//	},
										{
											"data" : "adName"
										},
										{
											"data" : "adStartDate"
										},
										{
											"data" : "adEndDate"
										},
										{
											"data" : "adCondition"
										},
										{
											"data" : null,
											render : function(data, type, row) {
												var adImg = data.adImg
														.split(",");
												return "<img src="+adImg[0]+" class='img'>";
											}
										},
										{
											"data" : null,
											render : function(data, type, row) {
												var adImg = data.adImg
														.split(",");
												return "<img src="+adImg[1]+" class='img' >";
											}
										},
										{
											"data" : null,
											render : function(data, type, row) {
												return "<a href='adDetailEntry.controller?adId="
														+ data.adId
														+ "'><img src='images/couponPic/edit.JPG' style='width:60%;padding-top:17px'></a>";
											}
										},
										{
											"data" : null,
											render : function(data, type, row) {
												return "<i class='fas fa-trash-alt delete' id="+data.adId+" style='font-size: 1.5em;padding-top:20px'></i>";
											}
										} ]
							});

		})
		
		                      $(function () {
		                    	  $("#ad tbody").on("click", ".delete", function () {
		                    	 
		                    	      var adId = $(this).attr("id");
		                
		                    	      let tr = $(this).closest("tr");
		                    		  
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
		              	                        type: 'POST',
		              	                        url: 'empdeleteAdvertisement.controller',
		              	                        data:{"adId":adId},		              	                    
		              	                        success(data) { 		              	                        	
		              	                        	tr.remove();
		              	                             Swal.fire(
		              	                              'Deleted!',
		              	                              'Your file has been deleted.',
		              	                              'success'
		              	                            ),location.reload() } ,
		              	                            error: function (response) {
		              	                            Swal.fire({
		              	                              icon: 'error',
		              	                              title: 'Oops...',
		              	                              text: 'Something went wrong!'
		              	                            }) },  
		              	                     });        
		              	                } 

		              	           }); 
		              		});
		              	});
		
	</script>
	 <script>
	
	$(function () {
		
		$('#insertpic').click(function(){
		 $.ajax({
			 type: "POST",
             url: "showAd.controller",
          	dataType:'json',			
			success:function(data){ 
				
				var op1= $('#op1').val();
				var op2= $('#op2').val();
					console.log(op1)
					console.log(op2)
				for(let i=0;i<data.length;i++){
					console.log(data[i].adCondition)
					
					if(data[i].adCondition==op1 ){
						
						$("option[value='已上架1']").attr("disabled", "disabled");
						
					}else if(data[i].adCondition==op2){
						$("option[value='已上架2']").attr("disabled", "disabled");
						
					}
				}		
			}
		 })
		
		})
	})
	</script> 


</body>
</html>