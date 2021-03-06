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

.data:hover {
	color: white;
	background-color: rgba(92, 92, 92, 0.637);
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
					<h1 class="h3 mb-2 text-gray-800">Employee Info Tables</h1>
					<!--Employee DataTale  -->
					<div class="card shadow mb-4">
					<!--  
						<div class="card-header py-3 d-none" id="successHeader">
							<div class="alert alert-success alert-dismissible fade show"
										role="alert">
										update success
										<button type="button" class="btn-close"
											data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
						</div>-->
						<div class="card-body">
							<div class="table-responsive">
								<table id="example" class="table  text-center fs-5 bg-linear2"
									style="width: 100%">
									<thead>
										<tr>
											<th>Email</th>
											<th>Account</th>
											<th>Name</th>
											<th>Dept</th>
											<th>edit</th>
										
										</tr>
									</thead>

									<tfoot>
										<tr>
											<th>Email</th>
											<th>Account</th>
											<th>Name</th>
											<th>Dept</th>
											<th>edit</th>
											
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

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
						<i class="fas fa-pencil-alt"></i><span id="modalHeader">Edit</span>
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="basicInfoForm"
						  class="needs-validation" novalidate>
						<div class="mb-3">
							<label for="empEmail" class="form-label">Email</label> <input
								type="email" class="form-control" name="empEmail" id="empEmail"
								required readonly />
						</div>

						<div class="mb-3 row">
							<div class="col">
								<label for="empAcc" class="form-label">Account</label> <input
									type="text" class="form-control" name="empAcc" id="empAcc"
									required readonly />
								<div class="valid-feedback">Looks good!</div>
								<div class="invalid-feedback">should be 6~12 numbers</div>
							</div>
							<div class="col">
								<label for="empName" class="form-label">Name</label> <input
									type="text" class="form-control" id="empName" name="empName"
									required />
								<div class="valid-feedback">Beautiful!</div>
								<div class="invalid-feedback">english only!</div>
							</div>
						</div>



						<div class="mb-3 row">
							<div class="col">
								<label for="empBday" class="form-label">Birthday</label> <input
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
								<label for="empAuth" class="form-label">Authority</label> <select
									id="empAuth" class="form-select form-select-sm" name="empAuth"
									required>
									<option selected disabled value="">Choose...</option>
									<option value="1">employee</option>
									<option value="2">highest</option>
								</select>
								<div class="invalid-feedback">Choose one!</div>
							</div>

							<div class="col">
								<label for="empDept" class="form-label">Department</label> <select
									id="empDeptNum" class="form-select form-select-sm"
									name="empDeptNum" required>
									<option selected disabled value="">Choose...</option>
									<option value="7001">?????????</option>
									<option value="7002">?????????</option>
									<option value="7003">????????????</option>
									<option value="7004">?????????</option>
									<option value="7000">?????????</option>
								</select>
								<div class="invalid-feedback">Choose one!</div>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button id="updateBasicInfo" type="button" class="btn btn-primary">Submit</button>
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
		    	"url": "empalltojson",
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
		              return "<i id="+data.empEmail+" class='fas fa-user-edit edit' data-bs-toggle='modal' data-bs-target='#exampleModal'></i> <span>|</span> <i class='far fa-trash-alt delete' id="+data.empEmail+"></i>";
		            },
		            "targets": -1
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
			           console.log('????????????');
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
	                              'Success!',
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
			console.log($(this).closest("tr"));
			let dtr = $(this).closest("tr");
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
	                        url: "empdelete/"+email,
	                        success: function(response) {  
	                        	dtr.remove();
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
