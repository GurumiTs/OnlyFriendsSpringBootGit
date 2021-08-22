<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
body{
font-size:1.2rem
}
</style>
</head>
<body>
<body class="layout-2">
	<div id="app">
		<div class="main-wrapper">

			<%@include file="../frontcommonpages/shopheader.jsp"%>

			<%@include file="../frontcommonpages/shopsider.jsp"%>

			<div id="getAccount" value="${personalinfo.memberAccount}"
				class="d-none">${personalinfo.memberAccount}</div>

			<!-- Main Content -->
			<div class="main-content">
				<section class="section">
					<div class="section-header">
						<h1>Profile</h1>
					</div>
					<div class="section-body">
						<div class="row mt-sm-4">
							<!-- edit -->
							<div class="col-12 col-md-12 col-lg-7">
								<div class="card">
									<form id="memberBasicInfo">
										<div class="card-header">
											<h4>Edit Profile</h4>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="form-group col-md-6 col-12">
													<label for="email" class="form-label">Email</label> <input
														type="email" class="form-control" name="email" id="email" />
													<div class="text-danger fst-italic mt-1" id="emailtest"></div>
												</div>
												<div class="form-group col-md-6 col-12">
													<input type="text" class="form-control d-none"
														name="account" id="account"
														value="${personalinfo.memberAccount}" readonly />
													<label for="name" class="form-label">姓名</label> <input
														type="text" class="form-control" id="name" name="name" />
												</div>
											</div>
											<div class="row">
												<div class="form-group col-md-6 col-12">
													<label for="empBday" class="form-label">年齡</label> <input
														type="text" class="form-control" name="age" id="age" />
												</div>
																		
												<div class="form-group col-md-6 col-12">
													<label for="phone" class="form-label">連絡電話</label>
													<input type="text" class="form-control" name="phone"
														id="phone" />
												</div>
											</div>

											<div class="row address" id="twzipcode">
												<div class="form-group col-md-6 col-8">
													<input type="text" class="form-control" name="address"
														id="address" placeholder="addr." />
												</div>
											</div>

											<div class="row">
												<div class="form-group col-md-4 col-12">
													<label for="hobby1" class="form-label">興趣標籤1</label>
													<input type="text" class="form-control" name="hobby1"
														id="hobby1" />
												</div>
												<div class="form-group col-md-4 col-12">
													<label for="hobby2" class="form-label">興趣標籤2</label>
													<input type="text" class="form-control" name="hobby2"
														id="hobby2" />
												</div>
												<div class="form-group col-md-4 col-12">
													<label for="hobby3" class="form-label">興趣標籤3</label>
													<input type="text" class="form-control" name="hobby3"
														id="hobby3" />
												</div>
											</div>

											<div class="row">
												<div class="form-group col-12">
													<label for="exampleFormControlTextarea1" class="form-label">個人簡介</label>
													<textarea class="form-control summernote-simple"
														id="personalInfo" name="personalInfo" rows="3"></textarea>
												</div>
											</div>
										</div>
										<div class="card-footer text-right">
											<button id="updateBasicInfo" type="button"
												class="btn btn-primary">
												Save Changes</button>
										</div>
									</form>
								</div>
							</div>
							<!-- edit -->

							<!-- show profile-->
							<div class="col-12 col-md-12 col-lg-5">
								<div class="card profile-widget">
									<div class="profile-widget-header">
								<i
				                  class="fas fa-edit text-dark btn fs-5"
				                  data-bs-toggle="modal"
				                  data-bs-target="#exampleModal"
				                ></i>
									<img
							              id="showMemberPic"
							              src="${pageContext.request.contextPath}/images/smallicon/nonephoto2.svg"
							              class="rounded-circle profile-widget-picture"
							              alt="..."
							              style="width: 10vw; height: 10vw; object-fit: cover"
							            />
				
										<div class="profile-widget-items">
											<div class="profile-widget-item">
												<div class="profile-widget-item-label">Posts</div>
												<div class="profile-widget-item-value">187</div>
											</div>
											<div class="profile-widget-item">
												<div class="profile-widget-item-label">Followers</div>
												<div class="profile-widget-item-value">6,8K</div>
											</div>
											<div class="profile-widget-item">
												<div class="profile-widget-item-label">Following</div>
												<div class="profile-widget-item-value">2,1K</div>
											</div>
										</div>
									</div>
									<div class="profile-widget-description">
										<div class="profile-widget-name" id="prifleName">
										</div>
										<p id="profileTextarea"></p>
									</div>
									<div class="card-footer text-center" id="tagArea">
										 
									</div>
								</div>
							</div>
							<!-- show profile-->
						</div>
					</div>
				</section>
			</div>
			<!-- main content -->
		<%@include file="../frontcommonpages/shopfooter.jsp"%>	
		</div>
	</div>
  <!-- modal -->
    <div
      class="modal fade"
      id="exampleModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Show me!</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <!-- modal body  -->
          <div class="modal-body">
            <form id="memberPic">
              <div
                class="
                  row
                  d-flex
                  flex-column
                  align-items-center
                  justify-content-center
                "
              >
                <img
                  id="output"
                  src="${pageContext.request.contextPath}/images/smallicon/nonephoto2.svg"
                  alt=""
                  style="width: 250px; height: 250px"
                />

                <div class="col-6 mb-2">
                  <input type="text" id="memberAccount"  name="memberAccount" value="${personalinfo.memberAccount}" class="d-none"></div>
                  <input type="file" class="form-control" name="pic" id="pic" />
                  <div
                    id="pictestsuccess"
                    class="text-success fst-italic"
                  ></div>
                  <div id="pictestbad" class="text-danger fst-italic"></div>
                </div>

                <div class="modal-footer">
                  <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal"
                  >
                    Cancel
                  </button>
                  <button id="updatePic" type="button" class="btn btn-primary">Save</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- end of modal -->	

	<%@include file="../frontcommonpages/shopbottom.jsp"%>
	    <script>
      $("#twzipcode").twzipcode({
        zipcodeIntoDistrict: true,
        css: ["county form-control col", "district form-control col"],
      });
      let flag = false;

      $(function () {
        $("#pic").on("change", function (e) {
          let pic = $(this).val();
          processImageFile(e.target.files[0]);
        });
      });

      function processImageFile(imageObject) {
        var uriBase =
          "https://southcentralus.api.cognitive.microsoft.com/vision/v2.1/analyze";

        var params = {
          visualFeatures: "Faces,Adult,Categories,Description,Color",
          details: "",
          language: "en",
        };

        var sourceImageUrl = URL.createObjectURL(imageObject);
        $("#output").prop("src", sourceImageUrl);
        $.ajax({
          url: uriBase + "?" + $.param(params),
          beforeSend: function (xhrObj) {
            xhrObj.setRequestHeader("Content-Type", "application/octet-stream");
            xhrObj.setRequestHeader(
              "Ocp-Apim-Subscription-Key",
              "e3be3b090eec4cd9946a53e197f37962"
            );
          },
          type: "POST",
          processData: false,
          contentType: false,
          data: imageObject,
        })
          .done(function (data) {
            if (data.faces[0] != null) {
              $("#pictestbad").html("");
              $("#pictestsuccess").html("");
              $("#pictestsuccess").html(
                "<i class='fas fa-check-circle'></i>  Awesome!"
              );
            } else {
              $("#pictestbad").html("");
              $("#pictestsuccess").html("");
              $("#pictestbad").html(
                "<i class='fas fa-times-circle'></i>  Clear face plz!"
              );
            }
          })
          .fail(function (jqXHR, textStatus, errorThrown) {
            console.log(error);
          });
      }
    </script>
    <script>
      $(function () {
        let memberAccount = $("#getAccount").text();
        $.ajax({
          type: "post",
          url: "memberBasicInfoQuery",
          dataType: "json",
          cache: false,
          data: {
            memberAccount: memberAccount,
          },
          success: function (data) {
            $("#email").prop("value", data.memberEmail);
            $("#name").prop("value", data.memberName);
            $("#age").prop("value", data.memberAge);
            $("#phone").prop("value", data.memberPhone);
            $("#address").prop("value", data.memberAddress);
            $("#twzipcode").twzipcode("set", {
              county: data.memberCounty,
              district: data.memberDistrict,
            });
            $("#hobby1").prop("value", data.tagOne);
            $("#hobby2").prop("value", data.tagTwo);
            $("#hobby3").prop("value", data.tagThree);
            $("#personalInfo").prop("value", data.personalInfo);
            $("#showMemberPic").prop("src", data.memberPic);
            $("#output").prop("src", data.memberPic);
            $("#profileName").html(data.memberName);
            $("#profileTextarea").html(data.personalInfo);            
            $('#tagArea').html('')
            if(data.tagOne != ""){           	
            	$('#tagArea').append(
            	$('<a />')
            		.addClass('badge badge-success text-decoration-none text-white fs-6')
            		.attr('id','tag1')
            		.text(data.tagOne)           	
            	)            	
            }
            if(data.tagTwo != ""){           	
            	$('#tagArea').append(
            	$('<a />')
            		.addClass('badge badge-warning text-decoration-none text-white fs-6')
            		.attr('id','tag2')
            		.text(data.tagTwo)           	
            	)            	
            }
            if(data.tagThree != ""){           	
            	$('#tagArea').append(
            	$('<a />')
            		.addClass('badge badge-info text-decoration-none text-white fs-6')
            		.attr('id','tag3')
            		.text(data.tagThree)           	
            	)            	
            }
          
          },
          error: function (data) {
            console.log("無法送出");
          },
        });

        $("#email").on("change", function () {
          let email = $(this).val();
          $.ajax({
            type: "post",
            url: "emailCheck.controller/" + email,
            success: function (data) {
              if (data == "y") {
                console.log("used");
                $("#emailtest").html(
                  "<i class='fas fa-times-circle'></i>  be used"
                );
              } else {
                $("#emailtest").html("");
              }
            },
            error: function (e) {
              console.log(e);
            },
          });
        });

        $("#updateBasicInfo").on("click", function () {
          let formData = new FormData(
            document.getElementById("memberBasicInfo")
          );
          $.ajax({
            type: "post",
            url: "memberUpdateBasicInfo",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
            	$.ajax({
                    type: "post",
                    url: "memberBasicInfoQuery",
                    dataType: "json",
                    cache: false,
                    data: {
                      memberAccount: memberAccount,
                    },
                    success: function (data) {
                      $("#email").prop("value", data.memberEmail);
                      $("#name").prop("value", data.memberName);
                      $("#age").prop("value", data.memberAge);
                      $("#phone").prop("value", data.memberPhone);
                      $("#address").prop("value", data.memberAddress);
                      $("#twzipcode").twzipcode("set", {
                        county: data.memberCounty,
                        district: data.memberDistrict,
                      });
                      $("#hobby1").prop("value", data.tagOne);
                      $("#hobby2").prop("value", data.tagTwo);
                      $("#hobby3").prop("value", data.tagThree);
                      $("#personalInfo").prop("value", data.personalInfo);
                      console.log("memberPic" + data.memberPic);
                      $("#showMemberPic").prop("src", data.memberPic);
                      $("#profileName").html(data.memberName);
                      $("#profileTextarea").html(data.personalInfo);
                      $('#tagArea').html('')
                      if(data.tagOne != ""){           	
                      	$('#tagArea').append(
                      	$('<a />')
                      		.addClass('badge badge-success text-decoration-none text-white fs-6')
                      		.attr('id','tag1')
                      		.text(data.tagOne)           	
                      	)            	
                      }
                      if(data.tagTwo != ""){           	
                      	$('#tagArea').append(
                      	$('<a />')
                      		.addClass('badge badge-warning text-decoration-none text-white fs-6')
                      		.attr('id','tag2')
                      		.text(data.tagTwo)           	
                      	)            	
                      }
                      if(data.tagThree != ""){           	
                      	$('#tagArea').append(
                      	$('<a />')
                      		.addClass('badge badge-info text-decoration-none text-white fs-6')
                      		.attr('id','tag3')
                      		.text(data.tagThree)           	
                      	)            	
                      }
                    },
                    error: function (data) {
                      console.log("無法送出");
                    },
                  });
              Swal.fire("Success!", "", "success");
              
            },
            error: function (e) {
              console.log("error");
            },
          });
        });

        $("#updatePic").on("click", function () {
          let formDataPic = new FormData(document.getElementById("memberPic"));
          $.ajax({
            type: "POST",
            url: "memberUpdatePic",
            data: formDataPic,
            cache: false, //上傳檔案不需要快取
            processData: false, // 不處理發送的資料
            contentType: false, // 不設定Content-Type請求
            encType: "multipart/form-data",
            success: function (data) {
              $.ajax({
                type: "post",
                url: "memberBasicInfoQuery",
                dataType: "json",
                cache: false,
                data: {
                  memberAccount: memberAccount,
                },
                success: function (data) {
                  $("#email").prop("value", data.memberEmail);
                  $("#name").prop("value", data.memberName);
                  $("#age").prop("value", data.memberAge);
                  $("#phone").prop("value", data.memberPhone);
                  $("#address").prop("value", data.memberAddress);
                  $("#twzipcode").twzipcode("set", {
                    county: data.memberCounty,
                    district: data.memberDistrict,
                  });
                  $("#hobby1").prop("value", data.tagOne);
                  $("#hobby2").prop("value", data.tagTwo);
                  $("#hobby3").prop("value", data.tagThree);
                  $("#personalInfo").prop("value", data.personalInfo);
                  console.log("memberPic" + data.memberPic);
                  $("#showMemberPic").prop("src", data.memberPic);
                  $("#profileName").html(data.memberName);
                  $("#profileTextarea").html(data.personalInfo);
                  $('#tagArea').html('')
                  if(data.tagOne != ""){           	
                  	$('#tagArea').append(
                  	$('<a />')
                  		.addClass('badge badge-success text-decoration-none text-white fs-6')
                  		.attr('id','tag1')
                  		.text(data.tagOne)           	
                  	)            	
                  }
                  if(data.tagTwo != ""){           	
                  	$('#tagArea').append(
                  	$('<a />')
                  		.addClass('badge badge-warning text-decoration-none text-white fs-6')
                  		.attr('id','tag2')
                  		.text(data.tagTwo)           	
                  	)            	
                  }
                  if(data.tagThree != ""){           	
                  	$('#tagArea').append(
                  	$('<a />')
                  		.addClass('badge badge-info text-decoration-none text-white fs-6')
                  		.attr('id','tag3')
                  		.text(data.tagThree)           	
                  	)            	
                  }
                },
                error: function (data) {
                  console.log("無法送出");
                },
              });

              Swal.fire("Success!", "", "success");
            },
            error: function (e) {
              console.log("error");
            },
          });
        });
      }); //()
    </script>


	
</body>
</html>
