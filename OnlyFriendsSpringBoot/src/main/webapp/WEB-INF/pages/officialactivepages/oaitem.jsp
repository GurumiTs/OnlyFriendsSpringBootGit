<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>

</head>
<body>
<body class="layout-2">
	<div id="app">
		<div class="main-wrapper">

			<%@include file="../frontcommonpages/shopheader.jsp"%>



			<!-- Page content-->
			<div class="container mt-5">
				
				 <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." id="img" /></div>
                    <div class="col-md-6">
                        <div class="small mb-1" id = "anum"></div>
                        <h1 class="display-5 fw-bolder" id= "active"></h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through">$45.00</span>
                            <span>$40.00</span>
                        </div>
                        <p class="lead" id="conditions"></p>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i id = "joinoa" name="account" class="bi-cart-fill me-1"></i>
                                我要報名
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Related products</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Fancy Product</h5>
                                    <!-- Product price-->
                                    $40.00 - $80.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Special Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." id= "img" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Sale Item</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Popular Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $40.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        </div>
        
        
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
								data-bs-dismiss="modal">Close</button>
							<button id="updateBasicInfo" type="button" class="btn btn-primary">Submit</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
        
		
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
</div>
	<%@include file="../frontcommonpages/shopbottom.jsp"%>
	</div>
	
	
	
	
	
	
	
	
	<script>

		$(function(){
			var url = location.href;
			
			if(url.indexOf('?')!=-1){
				var ary1 = url.split('?');
				var ary2 = ary1[1].split('&')
				var anum = decodeURI(ary2[0].substr(5));
				var active = decodeURI(ary2[1].substr(7))
			}
			
			$.ajax({
				type:'GET',
				url:'oaitem.controller',
				dataType:'JSON',
				contentType:'application/json',
				success(res){
				let oa = res;
				
				for(let i=0;i<oa.length;i++){
					if (anum==oa[i].anum && active== oa[i].active){
						
					$('#active').text(oa[i].active);
					$('#img').attr("src",oa[i].img);
					$('#conditions').text(oa[i].conditions);
					
					
					}
				}
				}
			
			})
		});
		  $("#joinoa").on("click", function () {
			  
			  $.ajax({
				  type : "post",
				  url: "memquery",   
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
	
	
	
	
	
	</script>
</body>
</html>
