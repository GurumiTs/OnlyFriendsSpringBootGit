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
	<div id="getAccount" value="${personalinfo.memberAccount}" class="d-none"></div>

   <!-- main section-->
    <div class="container px-4 px-lg-5 my-5 position-relative">
      <div class="row">
        <div class="col-4">
          <form
            action="empsignup.controller"
            method="post"
            enctype="multipart/form-data"
            class="needs-validation"
            novalidate
          >
            <div class="mb-3">
              <label for="empEmail" class="form-label">聯絡信箱</label>
              <input
                type="email"
                class="form-control"
                name="empEmail"
                id="empEmail"
                required
              />
              <div class="valid-feedback">Looks good!</div>
              <div class="invalid-feedback" id="emailInvalid"></div>
            </div>

            <div class="mb-3 row">
              <div class="col">
                <label for="empAcc" class="form-label">用戶名稱</label>
                <input
                  type="text"
                  class="form-control"
                  name="empAcc"
                  id="empAcc"
                  value="${personalinfo.memberAccount}"
                  required
                />
                <div class="valid-feedback">Looks good!</div>
                <div class="invalid-feedback">should be 6~12 numbers</div>
              </div>
              <div class="col">
                <label for="empName" class="form-label">姓名</label>
                <input
                  type="text"
                  class="form-control"
                  id="empName"
                  name="empName"
                  required
                />
                <div class="valid-feedback">Beautiful!</div>
                <div class="invalid-feedback">english only!</div>
              </div>
            </div>

            <div class="mb-3 row">
              <div class="col">
                <label for="empBday" class="form-label">生日</label>
                <input
                  type="text"
                  class="form-control"
                  name="empBday"
                  id="empBday"
                  required
                />
                <div class="invalid-feedback">Choose your Happy Bday!</div>
              </div>
              <div class="col">
                <label for="empBday" class="form-label">連絡電話</label>
                <input
                  type="text"
                  class="form-control"
                  name="empBday"
                  id="empBday"
                  required
                />
                <div class="invalid-feedback">Choose your Happy Bday!</div>
              </div>
            </div>
            <div class="mb-3 row address" id="twzipcode">
              <div class="col">
                <input
                  type="text"
                  class="form-control"
                  name="empAddress"
                  id="empAddress"
                  placeholder="addr."
                />
              </div>
            </div>

            <div class="mb-3 row">
              <div class="col">
                <label for="empPwd1" class="form-label">興趣標籤1</label>
                <input
                  type="password"
                  class="form-control"
                  name="empPwd1"
                  id="empPwd1"
                  required
                />
              </div>
              <div class="col">
                <label for="empPwd2" class="form-label">興趣標籤2</label>
                <input
                  type="password"
                  class="form-control"
                  name="empPwd2"
                  id="empPwd2"
                  required
                />
              </div>
              <div class="col">
                <label for="empPwd2" class="form-label">興趣標籤3</label>
                <input
                  type="password"
                  class="form-control"
                  name="empPwd2"
                  id="empPwd2"
                  required
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
                  id="exampleFormControlTextarea1"
                  rows="3"
                ></textarea>
              </div>
            </div>

            <div class="button">
              <button type="submit" class="btn btn-primary">Submit</button>
            </div>
          </form>
        </div>
        <div class="col-2 mt-5 mx-4 d-flex flex-column flex-wrap">
          <div class="card text-white border-0 bg-transparent" id="img-card">
            <img
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
        <div class="col-4 d-flex align-items-end">
          <img src="${pageContext.request.contextPath}/images/smallicon/memberprofiles.svg" alt="" />
        </div>
      </div>
    </div>
    <!-- main section-->
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
            <form
              action="emppicupdate.controller"
              method="post"
              enctype="multipart/form-data"
              class="needs-validation"
              novalidate
            >
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

                <div class="col mb-2">
                  <input
                    type="text"
                    class="form-control d-none"
                    name="empEmail"
                    id="empEmail"
                    value=""
                    readonly
                    required
                  />
                </div>

                <div class="col-6 mb-2">
                  <input
                    type="file"
                    class="form-control"
                    name="empPic"
                    id="empPic"
                    onchange="loadfile(event)"
                    required
                  />
                  <div class="valid-feedback">Awesome!</div>
                  <div class="invalid-feedback">JPG only</div>
                </div>

                <div class="modal-footer">
                  <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal"
                  >
                    Cancel
                  </button>
                  <button type="submit" class="btn btn-primary">Save</button>
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
		let loadfile = function(event) {
			let output = document.getElementById("output");
			output.src = URL.createObjectURL(event.target.files[0]);
			output.onload = function() {
				URL.revokeObjectURL(output.src);
			};
		};
		$("#twzipcode").twzipcode({
			detect : true,
			zipcodeIntoDistrict : true,
			css : [ "city form-control col", "town form-control col" ],
		});
	</script>
</body>
</html>
