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
					<h1 class="h3 mb-2 text-gray-800">員工基本資料表</h1>
					
					<div class="card shadow mb-4">
					
					<nav >
					  <div class="nav nav-tabs" id="nav-tab" role="tablist">
					    <button class="btn btn-secondary mx-1 my-2" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true"><i class="fas fa-users"></i></button>
					    <button class="btn btn-secondary mx-1 my-2" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false"><i class="far fa-folder-open"></i></button>
						<a href="empsignup" class="mx-1 my-2"><button class="btn btn-primary"><i class="fas fa-user-plus"></i>新增員工</button></a>														  
					  </div>
					</nav>
					<div class="card-body">
							<div class="table-responsive">
							
							<div class="tab-content" id="nav-tabContent">
						  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
						 
						 <table id="example" class="table table-hover text-center text-dark fs-5 hover" style="width: 100%">
									<thead>
										<tr>
											<th>信箱</th>
											<th>帳號</th>
											<th>姓名</th>
											<th>部門代號</th>
											<th>修改</th>	
											<th>刪除</th>					
										</tr>
									</thead>								
								</table>
						 
						 
						  </div>
						  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
						  	 
						  	 <table id="example2" class="table table-hover text-center text-dark fs-5 hover" style="width: 100%">
									<thead>
										<tr>
											<th>信箱</th>
											<th>帳號</th>
											<th>姓名</th>
											<th>部門代號</th>
											<th>復原</th>					
										</tr>
									</thead>								
								</table>
						  
						  
						  </div>
						</div>
							
	
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

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
						<i class="fas fa-pencil-alt"></i><span id="modalHeader">編輯</span>
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="basicInfoForm"
						  class="needs-validation" novalidate>
						<div class="mb-3">
							<label for="empEmail" class="form-label">信箱</label> <input
								type="email" class="form-control" name="empEmail" id="empEmail"
								required readonly />
						</div>

						<div class="mb-3 row">
							<div class="col">
								<label for="empAcc" class="form-label">帳號</label> <input
									type="text" class="form-control" name="empAcc" id="empAcc"
									required readonly />
								<div class="valid-feedback">Looks good!</div>
								<div class="invalid-feedback">should be 6~12 numbers</div>
							</div>
							<div class="col">
								<label for="empName" class="form-label">姓名</label> <input
									type="text" class="form-control" id="empName" name="empName"
									required />
								<div class="valid-feedback">Beautiful!</div>
								<div class="invalid-feedback">english only!</div>
							</div>
						</div>



						<div class="mb-3 row">
							<div class="col">
								<label for="empBday" class="form-label">生日</label> <input
									type="text" class="form-control" name="empBday" id="empBday"
									required />
								<div class="invalid-feedback">Choose your Happy Bday!</div>
							</div>

						</div>

						<div class="mb-3 row address" id="twzipcode">
							<div class="col">
								<input type="text" class="form-control" name="empAddress"
									id="empAddress" placeholder="addr." />
							</div>
						</div>

						<div class="mb-3 row">
							<div class="col">
								<label for="empAuth" class="form-label">權限</label> <select
									id="empAuth" class="form-select form-select-sm" name="empAuth"
									required>
									<option selected disabled value="">請選擇...</option>
									<option value="1">employee</option>
									<option value="2">highest</option>
								</select>
								<div class="invalid-feedback">Choose one!</div>
							</div>

							<div class="col">
								<label for="empDept" class="form-label">部門</label> <select
									id="empDeptNum" class="form-select form-select-sm"
									name="empDeptNum" required>
									<option selected disabled value="">請選擇...</option>
									<option value="7001">活動部</option>
									<option value="7002">公關部</option>
									<option value="7003">論壇管理</option>
									<option value="7004">銷售部</option>
									<option value="7000">資訊部</option>
								</select>
								<div class="invalid-feedback">Choose one!</div>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">關閉</button>
							<button id="updateBasicInfo" type="button" class="btn btn-primary">提交</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>


	<!-- bottom here -->
	<%@include file="../commonpages/dashboardbottom.jsp"%>
	<script>
	$(document).ready(function () {
		/*load zipcode query */
		$("#twzipcode").twzipcode({
	        detect: true,
	        zipcodeIntoDistrict: true,
	        css: ["city form-control col", "town form-control col"],
	      });
		/*load zipcode query */
		
		/* load data table */
		var table = $('#example').DataTable({
		    "ajax": {
		    	"url": "empdeletetojson",
		    	"dataSrc": "notdelete",
		    },
		    "columns": [
		        { "data": "empEmail" },
		        { "data":"empAccount"},
		        { "data": "empName" }, 
		        { "data":"deptNum"},		  
		        {
		            "data": null,
		            render:function(data, type, row)
		            {
		              return "<button id="+data.empEmail+" class='btn btn-success edit' data-bs-toggle='modal' data-bs-target='#exampleModal'><i class='fas fa-user-edit'></i>修改</button>";
		            },
		            "targets": -1
		        },
		        {
		            "data": null,
		            render:function(data, type, row)
		            {
		              return "<button id="+data.empEmail+" class='btn btn-danger delete'><i class='far fa-trash-alt'></i>刪除</button>";
		            },
		            "targets": -1
		        }
		    ],language: {
		    	"lengthMenu": "顯示 _MENU_ 筆資料",
		    	"sProcessing": "處理中...",
		    	"sSearch": "搜尋:",
		    	"sLoadingRecords": "載入資料中...",
		    	"oPaginate": {
		            "sFirst": "首頁",
		            "sPrevious": "上一頁",
		            "sNext": "下一頁",
		            "sLast": "末頁"
		         },
		    }
		});		
		/* load data table */
		
		/* load data table */
		var table2 = $('#example2').DataTable({
		    "ajax": {
		    	"url": "empdeletetojson",
		    	"dataSrc": "delete",
		    },
		    "columns": [
		        { "data": "empEmail" },
		        { "data":"empAccount"},
		        { "data": "empName" }, 
		        { "data":"deptNum"},		  
		        {
		            "data": null,
		            render:function(data, type, row)
		            {
		              return "<button id="+data.empEmail+" class='btn btn-warning return'><i class='fas fa-undo-alt'></i>復原</button>";
		            },
		            "targets": -1
		        }
		    ],language: {
		    	"lengthMenu": "顯示 _MENU_ 筆資料",
		    	"sProcessing": "處理中...",
		    	"sSearch": "搜尋:",
		    	"sLoadingRecords": "載入資料中...",
		    	"oPaginate": {
		            "sFirst": "首頁",
		            "sPrevious": "上一頁",
		            "sNext": "下一頁",
		            "sLast": "末頁"
		         },
		    },
		    columnDefs:[
		    	{
		    		targets: [3],
		    		createdCell: function (td, cellData, rowData, row, col){
		    			$(td).css("width", "60px");
		    		},
		    	}
		    ]
		});		
		/* load data table */
		
		/*show edit employee basic info*/
		  $("#example tbody").on("click", ".edit", function () {
			  let email = $(this).attr("id");
			  $.ajax({
				  type : "post",
				  url: "empquery",   
			      dataType: "json",   
			      cache: false,   
			      data: {"email":email}, 
			      success : function(data) 
			        {
			    	  $('#empEmail').prop("value",data.empEmail);
			    	  $('#empAcc').prop("value",data.empAccount);
			    	  $('#empName').prop("value",data.empName);
			    	  $('#empBday').prop("value",data.empBday);
			    	  $('#empAddress').prop("value",data.empAddress);
			    	  $("#twzipcode").twzipcode("set", {
			              county: data.empCounty,
			              district: data.empDistrict,
			            });
			    	  $("#empAuth").prop("value",data.empAuthority);
			          $("#empDeptNum").prop("value",data.deptNum);
			    	  
			        },error: function(data) 
			        {
			           console.log('無法送出');
			        }
			  });			  
		});
		/*show edit employee basic info*/
		
		/*send edit employee basic info*/
		$('#updateBasicInfo').click(function(){
			var formData = new FormData(document.getElementById("basicInfoForm"));
			    $.ajax({
			        type : "post",
			        url:'empupdatebymanager',
			        data : formData,
			        contentType: false,
			        cache: false,
			        processData: false,
			        dataType:'text',
			        success:function(data)
			        {
			        	Swal.fire(
	                              '修改成功!',
	                              '',
	                              'success'
	                            )		        	
			        	table.ajax.reload();

					},error:function(e){
						console.log("error");
					}
			    });
		});
		/*send edit employee basic info*/		
		$("#example tbody").on("click", ".delete", function () {
			let email = $(this).attr("id");
			let dtr = $(this).closest("tr");
			  Swal.fire({
	                title: '刪除?',
	                text: "確定刪除此員工?",
	                icon: 'warning',
	                showCancelButton: true,
	                confirmButtonColor: '#3085d6',
	                cancelButtonColor: '#d33',
	                cancelButtonText: "取消",
	                confirmButtonText: '刪除'
	              }).then((result) => {
	                if (result.isConfirmed) {
	                  $.ajax({
	                        type: "POST",
	                        url: "empdelete/"+email,
	                        success: function(response) {  
	                        	dtr.remove();	                        	
	                             Swal.fire(
	                              '刪除!',
	                              '成功刪除該員工資料.',
	                              'success'
	                            )
	                            table.ajax.reload();
	         					table2.ajax.reload();
	                            
	                        	} ,
	                            error: function (xhr) {
	                            Swal.fire({
	                              icon: 'error',
	                              title: '失敗...',
	                              text: '刪除失敗，請稍後再試'
	                            }) },  //error close
	                     }); //ajax close          
	                } //if close 

	           }); //then close 
		});
		
		$("#example2 tbody").on("click", ".return", function () {
			let email = $(this).attr("id");
			let dtr = $(this).closest("tr");
			  Swal.fire({
	                title: '復原?',
	                text: "確定復原此員工?",
	                icon: 'warning',
	                showCancelButton: true,
	                confirmButtonColor: '#3085d6',
	                cancelButtonColor: '#d33',
	                cancelButtonText: "取消",
	                confirmButtonText: '復原'
	              }).then((result) => {
	                if (result.isConfirmed) {
	                  $.ajax({
	                        type: "POST",
	                        url: "empdelete/"+email,
	                        success: function(response) {  	                        	
	                             Swal.fire(
	                              '復原!',
	                              '成功復原該員工資料.',
	                              'success'
	                            )
	                            table.ajax.reload();
	         					table2.ajax.reload();
	                            
	                        	} ,
	                            error: function (xhr) {
	                            Swal.fire({
	                              icon: 'error',
	                              title: '失敗...',
	                              text: '刪除失敗，請稍後再試'
	                            }) },  //error close
	                     }); //ajax close          
	                } //if close 

	           }); //then close 
		});
		
		
		
		
		
		
		
		
		
		
	});
</script>



	<script>
      (function () {
        "use strict";
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll(".needs-validation");
        // Loop over them and prevent submission
        Array.prototype.slice.call(forms).forEach(function (form) {
          form.addEventListener(
            "click",
            function (event) {
              if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
              }

              form.classList.add("was-validated");
            },
            false
          );
        });
      })();

      const empAccCheckR = /^\d{6,12}$/;
      document.getElementById("empAcc").addEventListener("blur", accCheck);
      function accCheck() {
        let empAcc = document.getElementById("empAcc");
        let empAccVal = empAcc.value;
        console.log(empAccCheckR.test(empAccVal));
        if (empAccVal == "") {
          empAcc.setCustomValidity("input 6~12 number");
        } else if (empAccCheckR.test(empAccVal) == false) {
          empAcc.setCustomValidity("format incorrect");
        } else {
          empAcc.setCustomValidity("");
        }
      }

      const empNameCheckR = /[a-zA-z]/;
      document.getElementById("empName").addEventListener("blur", nameCheck);
      function nameCheck() {
        let empName = document.getElementById("empName");
        let empNameVal = empName.value;
        if (empNameVal == "") empName.setCustomValidity("can't be empty");
        else if (empNameCheckR.test(empNameVal) == false)
          empName.setCustomValidity("english only");
        else empName.setCustomValidity("");
      }

      //bday
      document.getElementById("empBday").addEventListener("blur", bdayCheck);
      function bdayCheck() {
        function bdayECheck(bdayObjVal) {
          let splitDate = bdayObjVal.split("/");
          //console.log(splitDate);
          let date = new Date(splitDate[0], splitDate[1] - 1, splitDate[2]);
          // console.log(date);
          let year = date.getFullYear();
          let month = date.getMonth() + 1;
          let day = date.getDate();
          let status = false;
          if (
            year == splitDate[0] &&
            month == splitDate[1] &&
            day == splitDate[2]
          ) {
            return (status = true);
          } else return false;
        }

        let empBday = document.getElementById("empBday");
        let empBdayVal = empBday.value;

        const bdayCheckR = /\d{4}\/\d{1,2}\/\d{1,2}/;
        if (empBdayVal == "") empBday.setCustomValidity("can't be empty");
        else if (bdayCheckR.test(empBdayVal) == false)
          empBday.setCustomValidity("format incorrect");
        else if (bdayECheck(empBdayVal) == false)
          empBday.setCustomValidity("date not exist");

        if (
          bdayCheckR.test(empBdayVal) == true &&
          bdayECheck(empBdayVal) == true
        ) {
          empBday.setCustomValidity("");
        }
      }

      function authorityCheck() {
        let authority = document.getElementById("authority");
        let authorityVal = authority.value;
        if (authorityVal == "--------")
          authority.setCustomValidity("can't be empty");
        else authority.setCustomValidity("");
      }

      function deptCheck() {
        let dept = document.getElementById("dept");
        let deptVal = dept.value;
        if (deptVal == "--------") dept.setCustomValidity("can't be empty");
        else dept.setCustomValidity("");
      }
    </script>
	
</body>
</html>
