<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
</head>
<body>

	<%@include file="../frontcommonpages/shopheader.jsp"%>

	<!-- tabs section-->
	<div class="container px-4 px-lg-5 my-5">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#">帳號設定</a></li>
			<li class="nav-item"><a class="nav-link" href="#">訂單管理</a></li>
			<li class="nav-item"><a class="nav-link" href="#">個人活動</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Only友</a></li>
			<li class="nav-item"><a class="nav-link" href="#">文章區塊</a></li>
		</ul>
	</div>
	<!-- tabs section-->
	<div id="getAccount" value="${personalinfo.memberAccount}" class="d-none">${personalinfo.memberAccount}</div>

   <!-- main section-->
     <div class="container px-4 px-lg-5 my-5 position-relative">
      <div class="row">
        <!-- form col-4 -->
        <div class="col-4">
          <form
            id="memberBasicInfo"
          >
            <div class="mb-3">
              <label for="email" class="form-label">聯絡信箱</label>
              <input
                type="email"
                class="form-control"
                name="email"
                id="email"
              />
              <div class="text-danger fst-italic mt-1"  id="emailtest"></div>
            </div>

            <div class="mb-3 row">                     
                <input
                  type="text"
                  class="form-control d-none"
                  name="account"
                  id="account"
                  value="${personalinfo.memberAccount}"
                  readonly
                />          
              <div class="col">
                <label for="name" class="form-label">姓名</label>
                <input
                  type="text"
                  class="form-control"
                  id="name"
                  name="name"
                />
                <div class="valid-feedback">Beautiful!</div>
                <div class="invalid-feedback">not empty!</div>
              </div>
            </div>

            <div class="mb-3 row">
              <div class="col">
                <label for="empBday" class="form-label">年齡</label>
                <input
                  type="text"
                  class="form-control"
                  name="age"
                  id="age"
                />
                <div class="invalid-feedback">Choose your Happy Bday!</div>
              </div>
              <div class="col">
                <label for="phone" class="form-label">連絡電話</label>
                <input
                  type="text"
                  class="form-control"
                  name="phone"
                  id="phone"
                />
                <div class="invalid-feedback">Choose your Happy Bday!</div>
              </div>
            </div>

            <div class="mb-3 row address" id="twzipcode">
              <div class="col">
                <input
                  type="text"
                  class="form-control"
                  name="address"
                  id="address"
                  placeholder="addr."
                />
              </div>
            </div>

            <div class="mb-3 row">
              <div class="col">
                <label for="hobby1" class="form-label">興趣標籤1</label>
                <input
                  type="text"
                  class="form-control"
                  name="hobby1"
                  id="hobby1"
                />
              </div>
              <div class="col">
                <label for="hobby2" class="form-label">興趣標籤2</label>
                <input
                  type="text"
                  class="form-control"
                  name="hobby2"
                  id="hobby2"
                />
              </div>
              <div class="col">
                <label for="hobby3" class="form-label">興趣標籤3</label>
                <input
                  type="text"
                  class="form-control"
                  name="hobby3"
                  id="hobby3"
                />
              </div>
            </div>

            <div class="mb-3 row">
              <div class="col">
                <label for="exampleFormControlTextarea1" class="form-label"
                  >個人簡介</label
                >
                <textarea
                  class="form-control"
                  id="personalInfo"
                  name="personalInfo"
                  rows="3"
                ></textarea>
              </div>
            </div>

            <div class="button">
               <button id="updateBasicInfo" type="button" class="btn btn-primary">Save</button>
            </div>
          </form>
        </div>
        <!-- form col-4 -->

        <!-- show circle photo-->
        <div class="col-2 mt-5 mx-4 d-flex flex-column flex-wrap">
          <div class="card text-white border-0 bg-transparent" id="img-card">
            <img
              id="showMemberPic"
              src="${pageContext.request.contextPath}/images/smallicon/nonephoto2.svg"
              class="card-img rounded-circle shadow empPic"
              alt="..."
              style="width: 10vw; height: 10vw; object-fit: cover"
            />
            <div
              class="
                card-img-overlay
                d-flex
                justify-content-center
                align-items-end
              "
            >
              <h3 class="card-title">
                <i
                  class="fas fa-user-edit text-dark btn fs-3"
                  data-bs-toggle="modal"
                  data-bs-target="#exampleModal"
                ></i>
              </h3>
            </div>
          </div>
        </div>
        <!-- show circle photo-->

        <!-- side svg-->
        <div class="col-4 d-flex align-items-end">
          <img src="${pageContext.request.contextPath}/images/smallicon/memberprofiles.svg" alt="" />
        </div>
        <!-- side svg-->
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
              $("#pictestsuccess").html("<i class='fas fa-check-circle'></i>  Awesome!");
            } else {
              $("#pictestbad").html("");
              $("#pictestsuccess").html("");
              $("#pictestbad").html("<i class='fas fa-times-circle'></i>  Clear face plz!");
            }
          })
          .fail(function (jqXHR, textStatus, errorThrown) {
            console.log(error);
          });
      }
    </script>
    <script>
	$(function(){		  
		 let memberAccount = $('#getAccount').text();	  
		 $.ajax({
			  type : "post",
			  url: "memberBasicInfoQuery",   
		      dataType: "json",   
		      cache: false,   
		      data: {"memberAccount":memberAccount}, 
		      success : function(data) 
		        {
		    	  $('#email').prop("value",data.memberEmail);
		    	  $('#name').prop("value",data.memberName);
		    	  $('#age').prop("value",data.memberAge);
		    	  $('#phone').prop("value",data.memberPhone);
		    	  $('#address').prop("value",data.memberAddress);
		    	  $("#twzipcode").twzipcode("set", {
		              county: data.memberCounty,
		              district: data.memberDistrict,
		            });
		    	  $("#hobby1").prop("value",data.tagOne);
		    	  $("#hobby2").prop("value",data.tagTwo);
		    	  $("#hobby3").prop("value",data.tagThree);
		    	  $("#personalInfo").prop("value",data.personalInfo);	
		    	  $('#showMemberPic').prop("src",data.memberPic)
		    	  $('#output').prop("src",data.memberPic)
		        },error: function(data) 
		        {
		           console.log('無法送出');
		        }
		  });			  
		 		 
		$('#email').on("change",function(){
			let email = $(this).val();
			$.ajax({
				type:'post',
				url:'emailCheck.controller/'+email,
				success:function(data){					
					if(data =='y'){
						console.log("used");
						$('#emailtest').html("<i class='fas fa-times-circle'></i>  be used");
					}else{
						$('#emailtest').html("");
					}	
					
				},error:function(e){			
					console.log(e);		
				}
			});
		});
		
		$('#updateBasicInfo').on('click',function(){
			let formData = new FormData(document.getElementById("memberBasicInfo"));
			 $.ajax({
			        type : "post",
			        url:'memberUpdateBasicInfo',
			        data : formData,
			        contentType: false,
			        cache: false,
			        processData: false,
			        success:function(data)
			        {		
			        	
			        	Swal.fire(
	                              'Success!',
	                              '',
	                              'success'
	                            )		        				        	

					},error:function(e){
						console.log("error");
					}
			    });
			});
		
		$('#updatePic').on('click',function(){
			let formDataPic = new FormData(document.getElementById("memberPic"));
			$.ajax({
	            type: "POST",
	            url: "memberUpdatePic",
	            data:formDataPic,
	            cache: false, //上傳檔案不需要快取
	            processData: false,// 不處理發送的資料
	            contentType: false,// 不設定Content-Type請求
	            encType:"multipart/form-data",
	            success:function(data)
		        {	
	            	
	            	$.ajax({
	      			  type : "post",
	      			  url: "memberBasicInfoQuery",   
	      		      dataType: "json",   
	      		      cache: false,   
	      		      data: {"memberAccount":memberAccount}, 
	      		      success : function(data) 
	      		        {
	      		    	  $('#email').prop("value",data.memberEmail);
	      		    	  $('#name').prop("value",data.memberName);
	      		    	  $('#age').prop("value",data.memberAge);
	      		    	  $('#phone').prop("value",data.memberPhone);
	      		    	  $('#address').prop("value",data.memberAddress);
	      		    	  $("#twzipcode").twzipcode("set", {
	      		              county: data.memberCounty,
	      		              district: data.memberDistrict,
	      		            });
	      		    	  $("#hobby1").prop("value",data.tagOne);
	      		    	  $("#hobby2").prop("value",data.tagTwo);
	      		    	  $("#hobby3").prop("value",data.tagThree);
	      		    	  $("#personalInfo").prop("value",data.personalInfo);	
	      		    	  console.log("memberPic"+ data.memberPic)
	      		    	  $('#showMemberPic').prop("src",data.memberPic)
	      		        },error: function(data) 
	      		        {
	      		           console.log('無法送出');
	      		        }
	      		  });			  
	            	
	            	
	            	
	            	
	            	
		        	Swal.fire(
                              'Success!',
                              '',
                              'success'
                            )		        				        	

				},error:function(e){
					console.log("error");
				}
	        });
		});
		
		
				
		
	}); //()
	
	function loadMember(){
		
		
		
		
		
	}
	</script>
   
</body>
</html>
