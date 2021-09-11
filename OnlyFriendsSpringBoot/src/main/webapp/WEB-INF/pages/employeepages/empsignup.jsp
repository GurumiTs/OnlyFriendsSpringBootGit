<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>
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
					<h1 class="h3 mb-2 text-gray-800">建立員工帳號</h1>
					<!-- signup section  -->
					<div class="container">
						<div class="row mt-5">
							<!-- form col-6 -->
							<div class="col-6">
								<%--show signup status  --%>

								<c:if test="${not empty successMsg}">
									<div class="alert alert-success alert-dismissible fade show"
										role="alert">
										${successMsg}
										<button type="button" class="btn-close"
											data-bs-dismiss="alert" aria-label="Close"></button>
									</div>
									<c:remove var="successMsg" scope="session" />
								</c:if>


								<c:if test="${not empty errorMsg}">
									<div class="alert alert-warning alert-dismissible fade show"
										role="alert">
										${errorMsg}
										<button type="button" class="btn-close"
											data-bs-dismiss="alert" aria-label="Close"></button>
									</div>
									<c:remove var="errorMsg" scope="session" />
								</c:if>

								<%--show signup status  --%>


								<form action="empsignup.controller" method="post"
									enctype="multipart/form-data" class="needs-validation"
									novalidate>
									<div class="mb-3">
										<label for="empEmail" class="form-label">信箱</label> <input
											type="email" class="form-control" name="empEmail"
											id="empEmail" required />
										<div class="valid-feedback">Looks good!</div>
										<div class="invalid-feedback" id="emailInvalid"></div>	
									</div>

									<div class="mb-3 row">
										<div class="col">
											<label for="empAcc" class="form-label">帳號</label> <input
												type="text" class="form-control" name="empAcc" id="empAcc"
												required />
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
											<label for="empPwd1" class="form-label">密碼</label> <input
												type="password" class="form-control" name="empPwd1"
												id="empPwd1" required />
										</div>
										<div class="col">
											<label for="empPwd2" class="form-label">確認密碼</label> <input
												type="password" class="form-control" name="empPwd2"
												id="empPwd2" required />
										</div>
										<div class="invalid-feedback">First letter should be
											uppercase,mix number and eng letters(8~12)</div>
									</div>

									<div class="mb-3 row">
										<div class="col">
											<label for="empBday" class="form-label">生日</label> <input
												type="text" class="form-control" name="empBday" id="empBday"
												required />
											<div class="invalid-feedback">Choose your Happy Bday!</div>
										</div>
										<div class="col">
											<label for="empPic" class="form-label">個人照</label> <input
												type="file" class="form-control" name="empPic" id="empPic"
												required />
											<div class="valid-feedback">Awesome!</div>
											<div class="invalid-feedback" id="picInvalid"></div>
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
												id="empAuth" class="form-select form-select-sm"
												name="empAuth" required>
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

									<div class="mb-3 row">
										<div class="col showPwd mx-4">
											<input class="form-check-input" type="checkbox"
												name="showPwd" id="showPwd" onclick="pwdType()" /><label
												for="showPwd">顯示密碼</label>
										</div>
									</div>

									<div class="button">
										<button type="submit" class="btn btn-primary">提交</button>
									</div>
								</form>
							</div>
							<!-- form col-6 -->
							<!-- side pic  -->
							<div class="col-6">
								<style>
svg#freepik_stories-hello:not(.animated) .animable {
	opacity: 0;
}

svg#freepik_stories-hello.animated
                    #freepik--background-simple--inject-66 {
	animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38) slideUp;
	animation-delay: 0s;
}

svg#freepik_stories-hello.animated
                    #freepik--Shadow--inject-66 {
	animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38) slideUp;
	animation-delay: 0s;
}

svg#freepik_stories-hello.animated
                    #freepik--character-2--inject-66 {
	animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38)
		lightSpeedRight;
	animation-delay: 0s;
}

svg#freepik_stories-hello.animated
                    #freepik--Hello--inject-66 {
	animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38) slideLeft;
	animation-delay: 0s;
}

svg#freepik_stories-hello.animated
                    #freepik--character-1--inject-66 {
	animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38) slideRight;
	animation-delay: 0s;
}

@
keyframes slideUp { 0% {
	opacity: 0;
	transform: translateY(30px);
}

100






%
{
opacity






:






1




;
transform






:






inherit




;
}
}
@
keyframes lightSpeedRight {from { transform:translate3d(50%, 0, 0)skewX(-20deg);
	opacity: 0;
}

60






%
{
transform






:






skewX




(






10deg






)




;
opacity






:






1




;
}
80






%
{
transform






:






skewX




(






-2deg






)




;
}
to {
	opacity: 1;
	transform: translate3d(0, 0, 0);
}

}
@
keyframes slideLeft { 0% {
	opacity: 0;
	transform: translateX(-30px);
}

100






%
{
opacity






:






1




;
transform






:






translateX




(






0






)




;
}
}
@
keyframes slideRight { 0% {
	opacity: 0;
	transform: translateX(30px);
}
100






%
{
opacity






:






1




;
transform






:






translateX




(






0






)




;
}
}
</style>
								<svg class="animated" id="freepik_stories-hello"
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 500"
									version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink"
									xmlns:svgjs="http://svgjs.com/svgjs">
                  <g id="freepik--background-simple--inject-66"
										class="animable" style="transform-origin: 255.62px 168.334px">
                    <path
										d="M232.34,111.65c-38.57-2.25-78.93-25-116.76-3.06C87.19,125.06,83,157.38,91.35,187.65c21.84,79.51,144.13,93,213,73C375.75,240,456.28,169.29,410.12,97.34c-19-29.65-52.17-34.88-88.34-25C291.05,80.64,262.57,113.41,232.34,111.65Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 255.62px 168.334px;
                      "
										id="el14dx87e3xing" class="animable"></path>
                    <g id="elgw908p3oets">
                      <path
										d="M232.34,111.65c-38.57-2.25-78.93-25-116.76-3.06C87.19,125.06,83,157.38,91.35,187.65c21.84,79.51,144.13,93,213,73C375.75,240,456.28,169.29,410.12,97.34c-19-29.65-52.17-34.88-88.34-25C291.05,80.64,262.57,113.41,232.34,111.65Z"
										style="
                          fill: rgb(255, 255, 255);
                          opacity: 0.9;
                          transform-origin: 255.62px 168.334px;
                        "
										class="animable"></path>
                    </g>
                  </g>
                  <g id="freepik--Shadow--inject-66" class="animable"
										style="transform-origin: 250px 416.24px">
                    <ellipse id="freepik--path--inject-66" cx="250"
										cy="416.24" rx="193.89" ry="11.32"
										style="
                        fill: rgb(245, 245, 245);
                        transform-origin: 250px 416.24px;
                      "
										class="animable"></ellipse>
                  </g>
                  <g id="freepik--character-2--inject-66"
										class="animable" style="transform-origin: 347.975px 255.02px">
                    <path
										d="M348.15,115.36c-2.13-2.13-6.23-10.2-2.3-14s7.43-.35,7.7,1.5S353.1,120.3,348.15,115.36Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 348.905px 107.986px;
                      "
										id="elxkucpoydqe" class="animable"></path>
                    <polygon
										points="347.25 405.65 338.32 405.73 335.89 385.09 344.81 385.01 347.25 405.65"
										style="
                        fill: rgb(255, 139, 123);
                        transform-origin: 341.57px 395.37px;
                      "
										id="elfh4t67impri" class="animable"></polygon>
                    <path
										d="M338.31,404.7l9.74-.09a.85.85,0,0,1,.8.6l2.36,7.91a1.21,1.21,0,0,1-1.17,1.6c-3.51,0-8.61-.19-13-.15-5.16,0-7.46.36-13.52.42-3.66,0-5-3.66-3.45-4,6.87-1.59,10.42-1.8,16.17-5.57A3.83,3.83,0,0,1,338.31,404.7Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 335.355px 409.8px;
                      "
										id="elwusvf19gnqk" class="animable"></path>
                    <g id="ele1vgtu78lem">
                      <polygon
										points="335.89 385.1 337.15 395.74 346.07 395.66 344.82 385.02 335.89 385.1"
										style="
                          opacity: 0.2;
                          transform-origin: 340.98px 390.38px;
                        "
										class="animable"></polygon>
                    </g>
                    <path
										d="M334.62,406.29a13.89,13.89,0,0,0,2.86-.35.2.2,0,0,0,.17-.18.21.21,0,0,0-.12-.21c-.42-.21-4.17-2-5.2-1.37a.65.65,0,0,0-.3.57,1.25,1.25,0,0,0,.48,1A3.41,3.41,0,0,0,334.62,406.29Zm2.14-.64c-1.93.34-3.4.27-4-.21a.81.81,0,0,1-.31-.69.21.21,0,0,1,.1-.21C333.11,404.2,335.23,405,336.76,405.65Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 334.84px 405.173px;
                      "
										id="elcwp10se2i3t" class="animable"></path>
                    <path
										d="M337.44,406a.24.24,0,0,0,.13-.05.19.19,0,0,0,.07-.2c0-.16-.7-4-2.82-3.76-.56.06-.72.35-.75.57-.15,1,2.14,2.94,3.28,3.42Zm-2.44-3.6c1.28,0,1.92,2.09,2.14,3-1.18-.66-2.74-2.18-2.65-2.78,0,0,0-.17.38-.21Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 335.855px 403.99px;
                      "
										id="el49gyyot3ib8" class="animable"></path>
                    <path
										d="M340.94,160.43l-.92,1-.86.85c-.57.56-1.16,1.09-1.75,1.61q-1.76,1.58-3.6,3a70,70,0,0,1-7.8,5.38c-1.37.81-2.78,1.58-4.21,2.31s-2.94,1.36-4.46,2a44.75,44.75,0,0,1-9.68,2.65l-.74.11a11,11,0,0,1-1.45.09,9,9,0,0,1-3.25-.64,8.85,8.85,0,0,1-2.77-1.77,10.13,10.13,0,0,1-1.66-2.06,13.57,13.57,0,0,1-1.43-3.51,21.61,21.61,0,0,1-.53-2.9,32.76,32.76,0,0,1-.15-5.09c.07-1.62.2-3.18.38-4.71.38-3.07.92-6,1.58-9s1.41-5.77,2.38-8.67l6.57,1.3c-.24,5.62-.51,11.38-.33,16.82a40.71,40.71,0,0,0,.8,7.52,8.3,8.3,0,0,0,.41,1.34c.14.34.31.55.3.46a1.06,1.06,0,0,0-.27-.4,3.05,3.05,0,0,0-.94-.62,3.57,3.57,0,0,0-1.13-.27c-.18,0-.26,0-.37,0l.11,0,.21-.06a37.75,37.75,0,0,0,6.88-2.5,59.41,59.41,0,0,0,6.69-3.78c2.17-1.44,4.31-3,6.37-4.65,1-.82,2.05-1.68,3-2.55l1.46-1.32.7-.65.61-.58Z"
										style="
                        fill: rgb(255, 139, 123);
                        transform-origin: 318.291px 160.255px;
                      "
										id="el1tbcqb25p7r" class="animable"></path>
                    <path
										d="M346.23,156.9c-.34-9.43-8.08-12.71-17.78-6.28a132.1,132.1,0,0,0-12.33,8.85l6.27,20.14s12-3.81,18.94-11.29C346,163.24,346.35,160.11,346.23,156.9Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 331.184px 163.447px;
                      "
										id="el2flt24d28x5" class="animable"></path>
                    <g id="el4veuus2336p">
                      <path
										d="M334.42,160.92s-5.79,8.28-7.84,17.08a56.71,56.71,0,0,0,8.2-4.32Z"
										style="
                          opacity: 0.2;
                          transform-origin: 330.68px 169.46px;
                        "
										class="animable"></path>
                    </g>
                    <path
										d="M306.26,145.37l3.36-7.59L300.11,135s-1.63,3.63-.7,9.86Z"
										style="
                        fill: rgb(255, 139, 123);
                        transform-origin: 304.372px 140.185px;
                      "
										id="eliwhimmdwqt" class="animable"></path>
                    <polygon
										points="310.63 128.88 302.36 129.87 300.11 135 309.62 137.78 310.63 128.88"
										style="
                        fill: rgb(255, 139, 123);
                        transform-origin: 305.37px 133.33px;
                      "
										id="elas3dgw22dff" class="animable"></polygon>
                    <path
										d="M334.48,225.26s-6.14,51.46-6.82,79c-.7,28.61,4.91,86.32,4.91,86.32l16.11-.34s1.94-61.78,4.28-90.09c2.54-30.86,8.94-75.45,8.94-75.45Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 344.75px 307.64px;
                      "
										id="eldv207r7ebje" class="animable"></path>
                    <g id="el4cibetbytvj">
                      <path
										d="M334.48,225.26s-6.14,51.46-6.82,79c-.7,28.61,4.91,86.32,4.91,86.32l16.11-.34s1.94-61.78,4.28-90.09c2.54-30.86,8.94-75.45,8.94-75.45Z"
										style="
                          fill: rgb(255, 255, 255);
                          opacity: 0.6;
                          transform-origin: 344.75px 307.64px;
                        "
										class="animable"></path>
                    </g>
                    <g id="elbobou5m5a1">
                      <path
										d="M353.67,239.83c-7.2,15.87-5.27,51.32-1.18,66.52.15-2.21.31-4.3.47-6.23,1.67-20.34,5-46.63,7.11-62.2C358.11,235.08,355.92,234.86,353.67,239.83Z"
										style="
                          opacity: 0.2;
                          transform-origin: 354.456px 271.131px;
                        "
										class="animable"></path>
                    </g>
                    <polygon
										points="350.66 390.93 331.72 391.31 330.32 385.02 350.43 384.97 350.66 390.93"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 340.49px 388.14px;
                      "
										id="elrq7wtzm30js" class="animable"></polygon>
                    <polygon
										points="387.04 405.65 378.12 405.73 375.69 385.09 384.61 385.01 387.04 405.65"
										style="
                        fill: rgb(255, 139, 123);
                        transform-origin: 381.365px 395.37px;
                      "
										id="eljy85o9kqe2e" class="animable"></polygon>
                    <path
										d="M378.1,404.7l9.75-.09a.86.86,0,0,1,.8.6l2.36,7.91a1.22,1.22,0,0,1-1.17,1.6c-3.52,0-8.61-.19-13-.15-5.16,0-7.47.36-13.52.42-3.66,0-5-3.66-3.45-4,6.86-1.59,10.41-1.8,16.17-5.57A3.8,3.8,0,0,1,378.1,404.7Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 375.153px 409.8px;
                      "
										id="elterj5a4m1vh" class="animable"></path>
                    <g id="el18obdae2fih">
                      <polygon
										points="375.69 385.1 376.94 395.74 385.87 395.66 384.62 385.02 375.69 385.1"
										style="
                          opacity: 0.2;
                          transform-origin: 380.78px 390.38px;
                        "
										class="animable"></polygon>
                    </g>
                    <path
										d="M374.42,406.29a14.07,14.07,0,0,0,2.86-.35.19.19,0,0,0,.16-.18.2.2,0,0,0-.11-.21c-.43-.21-4.18-2-5.2-1.37a.63.63,0,0,0-.3.57,1.27,1.27,0,0,0,.47,1A3.46,3.46,0,0,0,374.42,406.29Zm2.14-.64c-1.93.34-3.4.27-4-.21a.85.85,0,0,1-.32-.69.21.21,0,0,1,.1-.21C372.9,404.2,375,405,376.56,405.65Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 374.636px 405.173px;
                      "
										id="elrec46duq5" class="animable"></path>
                    <path
										d="M377.23,406a.22.22,0,0,0,.21-.25c0-.16-.7-4-2.82-3.76-.56.06-.72.35-.76.57-.14,1,2.15,2.94,3.29,3.42Zm-2.43-3.6c1.27,0,1.92,2.09,2.14,3-1.18-.66-2.75-2.18-2.66-2.78,0,0,0-.17.38-.21Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 375.648px 403.99px;
                      "
										id="elerek3gq0oqo" class="animable"></path>
                    <path
										d="M350.2,224.92s4.45,55.37,7.7,82.69c3.37,28.42,14.47,82.94,14.47,82.94l16.11-.34s-4.42-61.9-6.13-90.26C380.48,269,380,224.24,380,224.24Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 369.34px 307.395px;
                      "
										id="elnbc3ozdccd" class="animable"></path>
                    <g id="eln459urgj6g">
                      <path
										d="M350.2,224.92s4.45,55.37,7.7,82.69c3.37,28.42,14.47,82.94,14.47,82.94l16.11-.34s-4.42-61.9-6.13-90.26C380.48,269,380,224.24,380,224.24Z"
										style="
                          fill: rgb(255, 255, 255);
                          opacity: 0.6;
                          transform-origin: 369.34px 307.395px;
                        "
										class="animable"></path>
                    </g>
                    <polygon
										points="390.46 390.93 371.51 391.31 370.12 385.02 390.23 384.97 390.46 390.93"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 380.29px 388.14px;
                      "
										id="el98ftsdia0tf" class="animable"></polygon>
                    <path
										d="M333.37,148.15s-6.59,24.46,1.11,77.11c14.38-.31,38.53-.87,45.52-1,.18-7.33-5.23-43.27,1.1-77.92A93.57,93.57,0,0,0,367.32,145a174.4,174.4,0,0,0-20.28.44A89.49,89.49,0,0,0,333.37,148.15Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 355.922px 185.072px;
                      "
										id="el5y94zfram1s" class="animable"></path>
                    <g id="el888lhfoqays">
                      <path
										d="M378.34,171l-7.45-6.17c.49,4.82,4.85,16.63,7.15,22.61C378,182.2,378.05,176.67,378.34,171Z"
										style="
                          opacity: 0.2;
                          transform-origin: 374.615px 176.135px;
                        "
										class="animable"></path>
                    </g>
                    <path
										d="M351.69,162.33l-8.13,16.09a1.79,1.79,0,0,0,2.42,2.4l5.31-2.92a1.75,1.75,0,0,1,1.85.12l5.23,3.77a1.73,1.73,0,0,0,2.64-2l-6.11-17.18A1.75,1.75,0,0,0,351.69,162.33Z"
										style="
                        fill: rgb(255, 255, 255);
                        transform-origin: 352.242px 171.761px;
                      "
										id="el74bbae8ptj5" class="animable"></path>
                    <path
										d="M364.82,122.16c-1.14,6.56-2.16,18.54,2.5,22.79,0,0-1.36,5.94-13.77,8-8.34-2.68-6.51-7.52-6.51-7.52,7.24-1.9,6.93-7.29,5.56-12.33Z"
										style="
                        fill: rgb(255, 139, 123);
                        transform-origin: 357.095px 137.555px;
                      "
										id="elpy7jp5mqry9" class="animable"></path>
                    <g id="elnmrl0khq9a">
                      <path
										d="M359.84,126.61l-7.24,6.44a21.06,21.06,0,0,1,.7,3.59c2.78-.46,6.53-3.6,6.76-6.51A9.73,9.73,0,0,0,359.84,126.61Z"
										style="
                          opacity: 0.2;
                          transform-origin: 356.365px 131.625px;
                        "
										class="animable"></path>
                    </g>
                    <path
										d="M368.79,114.09c-2.41,8.52-3.38,13.63-8.7,17.12-8,5.24-17.81-1-18-10.09-.18-8.16,3.78-20.73,13-22.33A12.08,12.08,0,0,1,368.79,114.09Z"
										style="
                        fill: rgb(255, 139, 123);
                        transform-origin: 355.682px 115.863px;
                      "
										id="ell63nafn08v" class="animable"></path>
                    <path
										d="M363.66,119.31c-1.12-2.72-1.93-11.68,2.74-13.88s9.52,3.17,8.29,5.71C372.8,115.08,366.26,125.61,363.66,119.31Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 368.839px 113.093px;
                      "
										id="el09fmu8glk4gw" class="animable"></path>
                    <path
										d="M366.45,108.59c-1.15-3-14.86-4.7-16.78-7.93-2.28-3.84,7.07-4.3,13.5-2.35,5.65,1.72,9.42,3.38,8.76,7.58C371.56,108.27,366.45,108.59,366.45,108.59Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 360.662px 102.887px;
                      "
										id="els0r4ziryeg" class="animable"></path>
                    <path
										d="M369.43,105.5s3,.82,4.64-1.38C373.55,106.3,371,108.5,369.43,105.5Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 371.75px 105.541px;
                      "
										id="el4hsgnwbb03d" class="animable"></path>
                    <path
										d="M355.7,96.25c-4.12-3.2-9.73.56-9.2,4.73s14.42,7.34,14.42,7.34S361.17,100.5,355.7,96.25Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 353.693px 101.685px;
                      "
										id="el15xrny6j8xuj" class="animable"></path>
                    <path
										d="M346.51,101c.63,2.92,2.76,5.21,7.07,6.91a15.65,15.65,0,0,1-5.43-7.31Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 350.045px 104.255px;
                      "
										id="el21ttqizg1if" class="animable"></path>
                    <path
										d="M355.16,113.66c-.15.71-.64,1.2-1.1,1.1s-.71-.76-.56-1.46.65-1.19,1.11-1.09S355.32,113,355.16,113.66Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 354.332px 113.485px;
                      "
										id="eljqzidl1sanc" class="animable"></path>
                    <path
										d="M347.22,111.94c-.16.7-.65,1.19-1.11,1.09s-.71-.75-.56-1.45.65-1.19,1.11-1.1S347.37,111.24,347.22,111.94Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 346.385px 111.756px;
                      "
										id="el09zvwxzeduyx" class="animable"></path>
                    <path
										d="M349.67,112.84a25.57,25.57,0,0,1-4.67,5.28c1,1.43,3.23,1.36,3.23,1.36Z"
										style="
                        fill: rgb(255, 86, 82);
                        transform-origin: 347.335px 116.16px;
                      "
										id="el2zt9pnpp83h" class="animable"></path>
                    <path
										d="M349.85,121.87h0a6,6,0,0,0,5.4-1.31.21.21,0,0,0,0-.3.22.22,0,0,0-.3,0,5.72,5.72,0,0,1-5,1.19.21.21,0,0,0-.09.42Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 352.502px 121.124px;
                      "
										id="el0bbjd56rnpwn" class="animable"></path>
                    <path
										d="M358.11,111.62a.43.43,0,0,0,.48-.59,4.23,4.23,0,0,0-3-2.44.43.43,0,0,0-.48.36.42.42,0,0,0,.35.48h0a3.33,3.33,0,0,1,2.35,1.95A.43.43,0,0,0,358.11,111.62Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 356.865px 110.107px;
                      "
										id="el6c70lrk9jze" class="animable"></path>
                    <path
										d="M344.32,108.45a.4.4,0,0,0,.43-.15,3.38,3.38,0,0,1,2.73-1.36.42.42,0,1,0,.08-.84,4.17,4.17,0,0,0-3.47,1.68.41.41,0,0,0,.07.59A.35.35,0,0,0,344.32,108.45Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 345.969px 107.281px;
                      "
										id="el97l6s12gzpg" class="animable"></path>
                    <path
										d="M383.28,153.16c1.82,3.18,3.34,6.26,4.92,9.43s3,6.36,4.35,9.62,2.66,6.57,3.8,10a101.49,101.49,0,0,1,3,10.43l.61,2.73a16.6,16.6,0,0,1,.34,3.9,19.5,19.5,0,0,1-1.59,7.06,31.78,31.78,0,0,1-7.11,10,58.5,58.5,0,0,1-8.7,6.93c-1.51,1-3.07,1.92-4.64,2.8s-3.13,1.69-4.88,2.46l-3.32-5.81c1.21-1,2.54-2,3.78-3.08s2.45-2.18,3.65-3.28a62.08,62.08,0,0,0,6.43-6.95,23.2,23.2,0,0,0,4-7.14,8,8,0,0,0,.36-3,5.2,5.2,0,0,0-.23-1.2l-.68-2.24a157.78,157.78,0,0,0-7.2-18.21c-1.37-3-2.83-6-4.29-9s-3-6-4.49-8.85Z"
										style="
                        fill: rgb(255, 139, 123);
                        transform-origin: 385.184px 190.84px;
                      "
										id="els9bdkgk2yp" class="animable"></path>
                    <path
										d="M381.44,146.39c8.34,1.8,14.14,23.56,14.14,23.56l-14.91,13.53a57.76,57.76,0,0,1-11-18C365.72,154.59,372.52,144.45,381.44,146.39Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 382.05px 164.815px;
                      "
										id="ely01ppvzrbed" class="animable"></path>
                    <path
										d="M371.87,221.68l-9.59.1,6,9.67s6.83-1.69,7.44-5.12Z"
										style="
                        fill: rgb(255, 139, 123);
                        transform-origin: 369px 226.565px;
                      "
										id="els7kd9q3ag6a" class="animable"></path>
                    <polygon
										points="356.31 227.49 361.6 235.25 368.23 231.45 362.28 221.78 356.31 227.49"
										style="
                        fill: rgb(255, 139, 123);
                        transform-origin: 362.27px 228.515px;
                      "
										id="el4u170dlwi0g" class="animable"></polygon>
                    <path
										d="M371.41,121.89a8.45,8.45,0,0,1-5,4.06c-2.84.83-4.29-1.7-3.53-4.39.69-2.42,3-5.77,5.84-5.42S372.68,119.48,371.41,121.89Z"
										style="
                        fill: rgb(255, 139, 123);
                        transform-origin: 367.305px 121.113px;
                      "
										id="elzg3pqfhitn" class="animable"></path>
                  </g>
                  <g id="freepik--Hello--inject-66" class="animable"
										style="transform-origin: 257.725px 240.444px">
                    <g id="eli6d8kymjl9e">
                      <rect x="275.75" y="287.76" width="10.69"
										height="1"
										style="
                          fill: rgb(186, 104, 200);
                          transform-origin: 281.095px 288.26px;
                          transform: rotate(-4.15deg);
                        "
										class="animable"></rect>
                    </g>
                    <g id="elohmpo4ijukp">
                      <rect x="290.77" y="286.87" width="5.25"
										height="1"
										style="
                          fill: rgb(186, 104, 200);
                          transform-origin: 293.395px 287.37px;
                          transform: rotate(-4.15deg);
                        "
										class="animable"></rect>
                    </g>
                    <path
										d="M342,169.27,165.44,182a14,14,0,0,0-12.88,14.89l6,83.22A14,14,0,0,0,173.47,293l10-.72a2.75,2.75,0,0,1,2.94,2.54l1.12,15.42a1.5,1.5,0,0,0,2.64.88l16.74-19.35a4.07,4.07,0,0,1,2.77-1.39L350,280.27a14,14,0,0,0,12.89-14.89l-6-83.22A14,14,0,0,0,342,169.27Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 257.725px 240.444px;
                      "
										id="eluh5sjm7522" class="animable"></path>
                    <path
										d="M191.23,220.2l9.54-.69.78,10.8,10.42-.75-.78-10.8,9.58-.7L223,248.92l-9.58.69-.9-12.48-10.42.76.9,12.48-9.53.69Z"
										style="
                        fill: rgb(255, 255, 255);
                        transform-origin: 207.115px 234.56px;
                      "
										id="elehurmg03xug" class="animable"></path>
                    <g id="elez3vzvj22ki">
                      <path
										d="M165.44,182a14,14,0,0,0-12.88,14.89l6,83.22A14,14,0,0,0,173.47,293l1.47-.11a11.12,11.12,0,0,0,10.12-9l20.11-104.76Z"
										style="
                          opacity: 0.2;
                          transform-origin: 178.849px 236.081px;
                        "
										class="animable"></path>
                    </g>
                    <path
										d="M252.93,237.66l-17.18,1.24a5.52,5.52,0,0,0,1.34,3,4,4,0,0,0,3.34,1.22,4.93,4.93,0,0,0,2.36-.8,5.69,5.69,0,0,0,1.39-1.52l8.5.17a12.08,12.08,0,0,1-4.33,5.16q-2.62,1.66-7.74,2a16.21,16.21,0,0,1-7.08-.75,10.32,10.32,0,0,1-4.51-3.67,12.06,12.06,0,0,1-2.13-6.29,11.28,11.28,0,0,1,2.74-8.73q3.12-3.48,9-3.91a16.61,16.61,0,0,1,7.68.9,9.86,9.86,0,0,1,4.53,3.91,15.51,15.51,0,0,1,2,7.07Zm-9-3.48a5.75,5.75,0,0,0-1.59-3.46,4.21,4.21,0,0,0-6.07,1,6,6,0,0,0-.78,3.09Z"
										style="
                        fill: rgb(255, 255, 255);
                        transform-origin: 239.874px 236.451px;
                      "
										id="elyidzmmgwo7" class="animable"></path>
                    <path
										d="M255.58,215.55l8.59-.62,2.23,30.85-8.59.62Z"
										style="
                        fill: rgb(255, 255, 255);
                        transform-origin: 260.99px 230.665px;
                      "
										id="elwc4cbo4zk69" class="animable"></path>
                    <path
										d="M269.93,214.51l8.59-.62,2.23,30.85-8.58.62Z"
										style="
                        fill: rgb(255, 255, 255);
                        transform-origin: 275.34px 229.625px;
                      "
										id="elamsy860jfw5" class="animable"></path>
                    <path
										d="M284.37,233.31a11.21,11.21,0,0,1,2.84-8.68q3.21-3.57,9.09-4,6.7-.48,10.42,3.16a12.21,12.21,0,0,1,.51,16.23q-3.18,3.54-9.22,4a13.34,13.34,0,0,1-8.92-2.1A11,11,0,0,1,284.37,233.31Zm8.59-.64a6.7,6.7,0,0,0,1.53,4.33,4,4,0,0,0,6.08-.42,7,7,0,0,0,.86-4.61,6.59,6.59,0,0,0-1.51-4.24,3.72,3.72,0,0,0-3.07-1.2,3.87,3.87,0,0,0-3,1.66A6.61,6.61,0,0,0,293,232.67Z"
										style="
                        fill: rgb(255, 255, 255);
                        transform-origin: 297.19px 232.345px;
                      "
										id="el2pw7udd2q9w" class="animable"></path>
                    <path
										d="M312.77,211.41l9.15-.66.51,7L321.68,232l-5.66.41-2.75-14Zm2,23.28,8.54-.62.55,7.56-8.55.61Z"
										style="
                        fill: rgb(255, 255, 255);
                        transform-origin: 318.315px 226.495px;
                      "
										id="elqx4k6ij20s" class="animable"></path>
                  </g>
                  <g id="freepik--character-1--inject-66"
										class="animable" style="transform-origin: 147.159px 267.763px">
                    <path
										d="M163,154.6a26.44,26.44,0,0,0,.23,4.38,58.62,58.62,0,0,1-28.15,2.23,25.73,25.73,0,0,0,.82-5.23,15.75,15.75,0,0,1-1.83,5.06c-1.78-.34-2.78-.63-2.78-.63s1.82-9.84-1.46-17-1.64-11.16.84-12.29c4.6-14.14,21.89-11.91,27.74-6.17,7.42,7.28,7.46,27.79,8.78,32.48-1.09.47-2.16.9-3.23,1.28A13.35,13.35,0,0,1,163,154.6Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 147.592px 141.252px;
                      "
										id="el8e4xk6mo1gg" class="animable"></path>
                    <path
										d="M170.15,176.61l.9,2.85c.33,1,.66,2,1,2.95.67,2,1.37,4,2.12,5.92s1.47,3.94,2.25,5.9l1.16,3,.29.74.07.17v0s0,0,0,0a1.35,1.35,0,0,0-.42-.25c-.22-.08-.31,0-.17,0a2.41,2.41,0,0,0,.71-.11,10.88,10.88,0,0,0,2.24-1,40.76,40.76,0,0,0,4.88-3.34c1.62-1.26,3.21-2.61,4.77-4s3.13-2.84,4.64-4.26l3.07,2.6c-1.28,1.84-2.63,3.52-4,5.23s-2.91,3.31-4.49,4.9a39.35,39.35,0,0,1-5.29,4.52,18,18,0,0,1-3.47,1.9,9.59,9.59,0,0,1-2.42.62,6.55,6.55,0,0,1-3.32-.45,6.31,6.31,0,0,1-2.8-2.34c-.15-.23-.29-.46-.4-.67l-.27-.54-.36-.73c-.47-1-1-2-1.41-2.94-.91-2-1.82-4-2.65-6s-1.64-4.06-2.41-6.12c-.36-1-.72-2.09-1.06-3.14s-.67-2.08-1-3.31Z"
										style="
                        fill: rgb(255, 195, 189);
                        transform-origin: 179.985px 190.805px;
                      "
										id="el1tcp18bgvvr" class="animable"></path>
                    <path
										d="M167.78,167.73c3.45.88,5.86,15.06,5.86,15.06l-9.5,6.46s-9.1-14.31-6.45-18.1C160.45,167.21,162.75,166.45,167.78,167.73Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 165.423px 178.204px;
                      "
										id="elylqih9c471q" class="animable"></path>
                    <path
										d="M167.78,167.73c3.45.88,5.86,15.06,5.86,15.06l-9.5,6.46s-9.1-14.31-6.45-18.1C160.45,167.21,162.75,166.45,167.78,167.73Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 165.423px 178.204px;
                      "
										id="elxf4jv1ksup" class="animable"></path>
                    <g id="el8o85f49xt79">
                      <path
										d="M167.78,167.73c3.45.88,5.86,15.06,5.86,15.06l-9.5,6.46s-9.1-14.31-6.45-18.1C160.45,167.21,162.75,166.45,167.78,167.73Z"
										style="
                          fill: rgb(255, 255, 255);
                          opacity: 0.4;
                          transform-origin: 165.423px 178.204px;
                        "
										class="animable"></path>
                    </g>
                    <g id="el7v0woqlps3n">
                      <polygon
										points="167.47 170.9 170.12 185.19 164.78 188.81 167.47 170.9"
										style="
                          opacity: 0.3;
                          transform-origin: 167.45px 179.855px;
                        "
										class="animable"></polygon>
                    </g>
                    <path
										d="M194.43,185.52l3.17-7.64,3.91,7.64s-2.54,3.8-5.89,2.87Z"
										style="
                        fill: rgb(255, 195, 189);
                        transform-origin: 197.97px 183.208px;
                      "
										id="el5kc39t2nuti" class="animable"></path>
                    <polygon
										points="201.09 177.09 206.11 179.11 201.51 185.52 197.59 177.88 201.09 177.09"
										style="
                        fill: rgb(255, 195, 189);
                        transform-origin: 201.85px 181.305px;
                      "
										id="eljesck3edsf" class="animable"></polygon>
                    <polygon
										points="149.13 406.45 157.5 406.45 158.06 387.08 149.69 387.08 149.13 406.45"
										style="
                        fill: rgb(255, 195, 189);
                        transform-origin: 153.595px 396.765px;
                      "
										id="el8104re5yxlm" class="animable"></polygon>
                    <polygon
										points="93.01 381.5 100.7 384.78 110.77 368.02 103.07 364.74 93.01 381.5"
										style="
                        fill: rgb(255, 195, 189);
                        transform-origin: 101.89px 374.76px;
                      "
										id="el0l8ozq6685m" class="animable"></polygon>
                    <path
										d="M102.18,383.64l-8-4.92a.66.66,0,0,0-.87.14l-4.81,5.77a1.35,1.35,0,0,0,.37,2c2.82,1.67,4.26,2.33,7.78,4.49,2.17,1.34,5.19,3.5,8.18,5.34s5-1,3.89-2.05c-4.85-4.63-4.71-6.83-5.62-9.57A2.15,2.15,0,0,0,102.18,383.64Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 98.6188px 387.84px;
                      "
										id="elre50o1m9glp" class="animable"></path>
                    <path
										d="M157.78,405.48h-9.39a.67.67,0,0,0-.67.57l-1.07,7.44A1.33,1.33,0,0,0,148,415c3.28-.05,4.86-.25,9-.25,2.54,0,7.8.27,11.31.27s3.69-3.47,2.23-3.79c-6.55-1.41-9.13-3.35-11.34-5.2A2.17,2.17,0,0,0,157.78,405.48Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 159.02px 410.25px;
                      "
										id="ell3wsg2lbumf" class="animable"></path>
                    <g id="el2roek2vv7s8">
                      <polygon
										points="158.05 387.09 157.77 397.07 149.4 397.07 149.69 387.09 158.05 387.09"
										style="
                          opacity: 0.2;
                          transform-origin: 153.725px 392.08px;
                        "
										class="animable"></polygon>
                    </g>
                    <g id="el9c07wm0fbw">
                      <polygon
										points="103.07 364.75 110.76 368.02 105.57 376.66 97.88 373.38 103.07 364.75"
										style="
                          opacity: 0.2;
                          transform-origin: 104.32px 370.705px;
                        "
										class="animable"></polygon>
                    </g>
                    <path
										d="M167.78,167.73s4,1.4-4,50.47h-34c.57-13.82.59-22.34-6-50.71a100,100,0,0,1,14.42-1.9,107.26,107.26,0,0,1,15.43,0C160.27,166.19,167.78,167.73,167.78,167.73Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 146.28px 191.756px;
                      "
										id="elvmondwcclf" class="animable"></path>
                    <g id="ela6p7ll9gvdg">
                      <path
										d="M167.78,167.73s4,1.4-4,50.47h-34c.57-13.82.59-22.34-6-50.71a100,100,0,0,1,14.42-1.9,107.26,107.26,0,0,1,15.43,0C160.27,166.19,167.78,167.73,167.78,167.73Z"
										style="
                          fill: rgb(255, 255, 255);
                          opacity: 0.4;
                          transform-origin: 146.28px 191.756px;
                        "
										class="animable"></path>
                    </g>
                    <path
										d="M138.22,165.58a110.17,110.17,0,0,1,15.43,0c.83.08,1.68.17,2.52.27a4.12,4.12,0,0,1,.47,3.61c-1.09,2.69-5,3-7.84,3-10.51,0-12.29-6.14-12.36-6.4l-.1-.37Z"
										style="
                        fill: rgb(255, 255, 255);
                        transform-origin: 146.6px 168.885px;
                      "
										id="el0datz3wi8oto" class="animable"></path>
                    <path
										d="M139.75,148.22c1,5,1.95,14.06-1.53,17.37,0,0,1.36,5,10.58,5,10.14,0,4.85-5,4.85-5-5.54-1.32-5.39-5.43-4.43-9.28Z"
										style="
                        fill: rgb(255, 195, 189);
                        transform-origin: 146.625px 159.405px;
                      "
										id="el1u7ju4ibh61" class="animable"></path>
                    <path
										d="M140.76,144.69c-1.19,3.93.46,13.23,2.91,16.83-4.83-2.77-6.46-11.21-6.46-11.21Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 140.44px 153.105px;
                      "
										id="elbwuexbtr8p" class="animable"></path>
                    <g id="elszr30118d7n">
                      <path
										d="M143.61,151.52l5.61,4.78a14.72,14.72,0,0,0-.48,2.74c-2.11-.31-5-2.63-5.24-4.84A7.52,7.52,0,0,1,143.61,151.52Z"
										style="
                          opacity: 0.2;
                          transform-origin: 146.324px 155.28px;
                        "
										class="animable"></path>
                    </g>
                    <path
										d="M135.17,139.36c1.94,8.07,2.58,11.53,7.44,15,7.31,5.21,16.8,1.07,17.31-7.42.46-7.64-2.78-19.55-11.33-21.39A11.32,11.32,0,0,0,135.17,139.36Z"
										style="
                        fill: rgb(255, 195, 189);
                        transform-origin: 147.396px 140.972px;
                      "
										id="ela0s6c84n6fj" class="animable"></path>
                    <path
										d="M163.79,218.2s6.59,64.42,6,89.92c-.57,26.52-10.29,87-10.29,87h-11.3s1.79-58.95.79-85c-1.09-28.4-10.11-91.94-10.11-91.94Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 154.354px 306.65px;
                      "
										id="elmw60544nazk" class="animable"></path>
                    <g id="eltvoq78lu1s">
                      <path
										d="M163.79,218.2s6.59,64.42,6,89.92c-.57,26.52-10.29,87-10.29,87h-11.3s1.79-58.95.79-85c-1.09-28.4-10.11-91.94-10.11-91.94Z"
										style="
                          opacity: 0.4;
                          transform-origin: 154.354px 306.65px;
                        "
										class="animable"></path>
                    </g>
                    <polygon
										points="147.26 395.54 160.52 395.54 161.5 391.31 146.64 390.79 147.26 395.54"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 154.07px 393.165px;
                      "
										id="elqxe1cbsg67" class="animable"></polygon>
                    <g id="el66ry3dqyao7">
                      <path
										d="M149.14,234.23c8.34,16.78,1.67,47.39-1.28,58.78-1.51-17.1-4.06-38-6.05-53.37C143.07,231,145.29,226.49,149.14,234.23Z"
										style="
                          opacity: 0.2;
                          transform-origin: 147.498px 261.632px;
                        "
										class="animable"></path>
                    </g>
                    <path
										d="M154.82,218.2s-7.7,67-13.51,88.47c-6.89,25.53-33.12,69-33.12,69L97.7,371.21s16.23-49.36,21.51-62.81c11.25-28.7,1.62-71.47,10.61-90.2Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 126.26px 296.935px;
                      "
										id="eli4fr3o0bx7m" class="animable"></path>
                    <g id="elo37pu5w4rwl">
                      <path
										d="M154.82,218.2s-7.7,67-13.51,88.47c-6.89,25.53-33.12,69-33.12,69L97.7,371.21s16.23-49.36,21.51-62.81c11.25-28.7,1.62-71.47,10.61-90.2Z"
										style="
                          opacity: 0.4;
                          transform-origin: 126.26px 296.935px;
                        "
										class="animable"></path>
                    </g>
                    <polygon
										points="96.25 371.24 109.27 376.78 112.4 373.28 97.38 366.07 96.25 371.24"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 104.325px 371.425px;
                      "
										id="el4gy9b3tlpej" class="animable"></polygon>
                    <path
										d="M148,139.47c.12.66.56,1.14,1,1.06s.69-.68.57-1.34-.56-1.14-1-1.07S147.83,138.8,148,139.47Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 148.776px 139.326px;
                      "
										id="elp8dpt913u6" class="animable"></path>
                    <path
										d="M155.46,138.15c.11.66.56,1.14,1,1.06s.7-.68.58-1.34-.56-1.14-1-1.07S155.34,137.48,155.46,138.15Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 156.25px 138.006px;
                      "
										id="elkv3t5nruybe" class="animable"></path>
                    <path
										d="M155.85,136.88l1.51-.75S156.76,137.52,155.85,136.88Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 156.605px 136.589px;
                      "
										id="el7uv9afi4287" class="animable"></path>
                    <path
										d="M153.67,139.64a17.88,17.88,0,0,0,3.12,3.82,2.92,2.92,0,0,1-2.29.86Z"
										style="
                        fill: rgb(237, 132, 126);
                        transform-origin: 155.23px 141.984px;
                      "
										id="elpib4ue45dd" class="animable"></path>
                    <path
										d="M151.49,147.45a6.57,6.57,0,0,0,1.13-.1.2.2,0,1,0-.07-.39,5.32,5.32,0,0,1-4.65-1.31.2.2,0,0,0-.28,0,.19.19,0,0,0,0,.28A5.54,5.54,0,0,0,151.49,147.45Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 150.185px 146.522px;
                      "
										id="elo6j4d1sfcc" class="animable"></path>
                    <path
										d="M138,134.63a59.14,59.14,0,0,0,1,6.33s5-6.33,5.83-9.72a14.23,14.23,0,0,1-1.15,3.86s6.73-1.47,7.39-5.91a28.24,28.24,0,0,1-.66,5.91s6.42-2.52,5.83-6.78-10.45-5.91-15-4.47-9,6.11-7.66,12.53,3.91,8.83,3.91,8.83S135.64,138.74,138,134.63Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 144.808px 134.275px;
                      "
										id="elwnwjn85gyyn" class="animable"></path>
                    <path
										d="M134.82,145.44a6.06,6.06,0,0,0,3.28,3.27c2,.8,3.19-.91,2.84-2.89-.31-1.79-1.72-4.35-3.79-4.31A2.73,2.73,0,0,0,134.82,145.44Z"
										style="
                        fill: rgb(255, 195, 189);
                        transform-origin: 137.771px 145.21px;
                      "
										id="elofss7pq7hxb" class="animable"></path>
                    <path
										d="M139.21,131.55c-1,4,1.08,13.2,3.7,16.67-5-2.53-7-10.89-7-10.89Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 139.41px 139.885px;
                      "
										id="elac6z1zyrmn6" class="animable"></path>
                    <path
										d="M145.26,137.19a.4.4,0,0,0,.24-.2,3.15,3.15,0,0,1,2.26-1.76.41.41,0,0,0,.35-.44.39.39,0,0,0-.44-.35,3.93,3.93,0,0,0-2.88,2.19.4.4,0,0,0,.47.56Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 146.43px 135.821px;
                      "
										id="el071phaow1n4" class="animable"></path>
                    <path
										d="M158.19,134.09a.35.35,0,0,0,.27-.11.4.4,0,0,0,0-.56,4,4,0,0,0-3.39-1.26.4.4,0,0,0-.32.47.4.4,0,0,0,.46.31,3.15,3.15,0,0,1,2.67,1A.4.4,0,0,0,158.19,134.09Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 156.658px 133.112px;
                      "
										id="elb0dpltvn6d" class="animable"></path>
                    <path
										d="M127.93,179.36c-1.39,4.39-2.72,9-3.85,13.54a102.19,102.19,0,0,0-2.49,13.63l-.08.84c0,.27,0,.33,0,.57a13,13,0,0,0,.11,1.41,32.18,32.18,0,0,0,.55,3.26c.47,2.23,1,4.53,1.68,6.81s1.26,4.6,1.94,6.9l2,6.9-3.71,1.53c-2.28-4.36-4.26-8.8-6.11-13.38-.89-2.3-1.76-4.62-2.48-7.07-.36-1.22-.7-2.47-1-3.83a18.82,18.82,0,0,1-.3-2.18c0-.37,0-.92,0-1.25l0-1a65.39,65.39,0,0,1,.7-7.61c.33-2.5.82-4.94,1.35-7.37a122.63,122.63,0,0,1,4-14.37Z"
										style="
                        fill: rgb(255, 195, 189);
                        transform-origin: 121.06px 205.72px;
                      "
										id="eltt322xcetvd" class="animable"></path>
                    <path
										d="M123.8,167.49c-3.4,1-7.49,12.75-7.49,12.75l13.2,9.44s4.82-9.78,3.39-14.18C131.41,170.92,127.69,166.31,123.8,167.49Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 124.738px 178.491px;
                      "
										id="eltutpcysk4g" class="animable"></path>
                    <g id="el8g763ppdxn">
                      <path
										d="M123.8,167.49c-3.4,1-7.49,12.75-7.49,12.75l13.2,9.44s4.82-9.78,3.39-14.18C131.41,170.92,127.69,166.31,123.8,167.49Z"
										style="
                          fill: rgb(255, 255, 255);
                          opacity: 0.4;
                          transform-origin: 124.738px 178.491px;
                        "
										class="animable"></path>
                    </g>
                    <path
										d="M105.56,386.82a1.17,1.17,0,0,0,.71-.7.7.7,0,0,0,0-.68c-.6-.88-3.63-.81-4-.8a.2.2,0,0,0-.18.12.2.2,0,0,0,0,.21c.79.79,2.27,2.08,3.31,1.88ZM102.75,385c1.21,0,2.83.17,3.15.64a.29.29,0,0,1,0,.3.78.78,0,0,1-.55.49C104.8,386.57,103.84,386,102.75,385Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 104.209px 385.753px;
                      "
										id="elp0l0a14yo7s" class="animable"></path>
                    <path
										d="M103.64,384.79c.92-.29,1.9-.8,2.11-1.37a.7.7,0,0,0-.28-.82,1,1,0,0,0-.85-.21c-1.19.21-2.47,2.25-2.52,2.34a.2.2,0,0,0,0,.2.21.21,0,0,0,.17.1A4.81,4.81,0,0,0,103.64,384.79Zm.92-2,.13,0a.65.65,0,0,1,.54.13c.2.16.18.28.15.37-.2.55-1.72,1.21-2.73,1.34A4.93,4.93,0,0,1,104.56,382.81Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 103.931px 383.699px;
                      "
										id="eldyx0pqemf9v" class="animable"></path>
                    <path
										d="M160.92,406.94a3.17,3.17,0,0,0,2-.51,1.13,1.13,0,0,0,.36-1,.64.64,0,0,0-.34-.52c-1-.56-4.35,1.14-4.73,1.33a.2.2,0,0,0,0,.37A13.51,13.51,0,0,0,160.92,406.94Zm1.49-1.73a.76.76,0,0,1,.37.07.25.25,0,0,1,.13.22.7.7,0,0,1-.22.63c-.51.46-1.89.54-3.74.23A10.81,10.81,0,0,1,162.41,405.21Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 160.689px 405.874px;
                      "
										id="eli1rdmz35wk" class="animable"></path>
                    <path
										d="M158.33,406.65l.08,0c1-.45,3-2.25,2.82-3.2,0-.23-.2-.5-.75-.56a1.44,1.44,0,0,0-1.1.34c-1,.88-1.24,3.13-1.25,3.22a.21.21,0,0,0,.09.18A.15.15,0,0,0,158.33,406.65Zm2-3.39h.12c.36,0,.39.19.39.23.1.57-1.24,2-2.26,2.61a4.59,4.59,0,0,1,1.07-2.58A1,1,0,0,1,160.32,403.26Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 159.686px 404.767px;
                      "
										id="elpfln88qm4vh" class="animable"></path>
                    <path
										d="M129.31,216.21l-.86,3c-.12.23.16.47.55.47H164c.31,0,.56-.15.58-.34l.31-3c0-.21-.25-.39-.58-.39H129.87A.63.63,0,0,0,129.31,216.21Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 146.656px 217.814px;
                      "
										id="ela6rp7ql5l16" class="animable"></path>
                    <path
										d="M133.93,220.05H133c-.18,0-.32-.09-.31-.21l.43-4c0-.11.18-.21.36-.21h.92c.19,0,.32.1.31.21l-.43,4C134.28,220,134.12,220.05,133.93,220.05Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 133.7px 217.84px;
                      "
										id="elsu5i4wshuv" class="animable"></path>
                    <g id="ellg5kwjxtjro">
                      <path
										d="M133.93,220.05H133c-.18,0-.32-.09-.31-.21l.43-4c0-.11.18-.21.36-.21h.92c.19,0,.32.1.31.21l-.43,4C134.28,220,134.12,220.05,133.93,220.05Z"
										style="opacity: 0.4; transform-origin: 133.7px 217.84px"
										class="animable"></path>
                    </g>
                    <path
										d="M161.36,220.05h-.92c-.18,0-.32-.09-.31-.21l.44-4c0-.11.17-.21.35-.21h.92c.19,0,.33.1.31.21l-.43,4C161.71,220,161.55,220.05,161.36,220.05Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 161.141px 217.84px;
                      "
										id="elmsxq6hn436o" class="animable"></path>
                    <g id="elhz88brhgmub">
                      <path
										d="M161.36,220.05h-.92c-.18,0-.32-.09-.31-.21l.44-4c0-.11.17-.21.35-.21h.92c.19,0,.33.1.31.21l-.43,4C161.71,220,161.55,220.05,161.36,220.05Z"
										style="
                          opacity: 0.4;
                          transform-origin: 161.141px 217.84px;
                        "
										class="animable"></path>
                    </g>
                    <path
										d="M147.65,220.05h-.92c-.19,0-.33-.09-.31-.21l.43-4c0-.11.17-.21.36-.21h.92c.18,0,.32.1.31.21l-.43,4C148,220,147.83,220.05,147.65,220.05Z"
										style="
                        fill: rgb(186, 104, 200);
                        transform-origin: 147.429px 217.84px;
                      "
										id="el42ksensvw8m" class="animable"></path>
                    <g id="eltf8onu56y4h">
                      <path
										d="M147.65,220.05h-.92c-.19,0-.33-.09-.31-.21l.43-4c0-.11.17-.21.36-.21h.92c.18,0,.32.1.31.21l-.43,4C148,220,147.83,220.05,147.65,220.05Z"
										style="
                          opacity: 0.4;
                          transform-origin: 147.429px 217.84px;
                        "
										class="animable"></path>
                    </g>
                    <path
										d="M148.34,138.19l1.51-.74S149.25,138.84,148.34,138.19Z"
										style="
                        fill: rgb(38, 50, 56);
                        transform-origin: 149.095px 137.907px;
                      "
										id="el6a9sbo42dlx" class="animable"></path>
                    <path
										d="M127.51,232.09l7.17,5.5-8.31,1.83s-3.53-4-2.31-7.3Z"
										style="
                        fill: rgb(255, 195, 189);
                        transform-origin: 129.242px 235.755px;
                      "
										id="elka9z5hqqdu" class="animable"></path>
                    <polygon
										points="136.44 244.4 129.4 245.55 125.56 238.33 134.68 237.59 136.44 244.4"
										style="
                        fill: rgb(255, 195, 189);
                        transform-origin: 131px 241.57px;
                      "
										id="elg7q57m4zx1v" class="animable"></polygon>
                  </g>
                  <defs>
                    <filter id="active" height="200%">
                      <feMorphology in="SourceAlpha" result="DILATED"
										operator="dilate" radius="2"></feMorphology>
                      <feFlood flood-color="#32DFEC" flood-opacity="1"
										result="PINK"></feFlood>
                      <feComposite in="PINK" in2="DILATED" operator="in"
										result="OUTLINE"></feComposite>
                      <feMerge>
                        <feMergeNode in="OUTLINE"></feMergeNode>
                        <feMergeNode in="SourceGraphic"></feMergeNode>
                      </feMerge>
                    </filter>
                    <filter id="hover" height="200%">
                      <feMorphology in="SourceAlpha" result="DILATED"
										operator="dilate" radius="2"></feMorphology>
                      <feFlood flood-color="#ff0000" flood-opacity="0.5"
										result="PINK"></feFlood>
                      <feComposite in="PINK" in2="DILATED" operator="in"
										result="OUTLINE"></feComposite>
                      <feMerge>
                        <feMergeNode in="OUTLINE"></feMergeNode>
                        <feMergeNode in="SourceGraphic"></feMergeNode>
                      </feMerge>
                      <feColorMatrix type="matrix"
										values="0   0   0   0   0                0   1   0   0   0                0   0   0   0   0                0   0   0   1   0 "></feColorMatrix>
                    </filter>
                  </defs>
                </svg>
							</div>
							<!-- side pic  -->
						</div>
					</div>
					<!-- signup section  -->


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

	<!-- bottom here -->
	<%@include file="../commonpages/dashboardbottom.jsp"%>
	
	
<script>
		$("#twzipcode").twzipcode({
			detect : true,
			zipcodeIntoDistrict : true,
			css : [ "city form-control col", "town form-control col" ],
		});

		const emailCheckR = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;

		//須以大寫字母為開頭,至少個數字以及特殊符號總長8~12
		const pwdCheckR = /^[A-Z]{1}(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*]).{7,11}$/;

		(function() {
			"use strict";
			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.querySelectorAll(".needs-validation");
			// Loop over them and prevent submission
			Array.prototype.slice.call(forms).forEach(function(form) {
				form.addEventListener("submit", function(event) {
					if (!form.checkValidity()) {
						event.preventDefault();
						event.stopPropagation();
					}

					form.classList.add("was-validated");
				}, false);
			});
		})();

		//email
		// document.getElementById("empEmail").addEventListener("blur", emailCheck);
		// function emailCheck() {
		//   let emailObj = document.getElementById("empEmail");
		//   let emailVal = emailObj.value;
		//   let remind = document.getElementById("emailInputRemind");
		//   if (emailCheckR.test(emailVal) == true) {
		//     remind.innerHTML = "correct";
		//   } else if (emailVal == "") remind.innerHTML = "can't be empty";
		//   else remind.innerHTML = "format incorrect";
		// }
		// account
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
			if (empNameVal == "")
				empName.setCustomValidity("can't be empty");
			else if (empNameCheckR.test(empNameVal) == false)
				empName.setCustomValidity("english only");
			else
				empName.setCustomValidity("");
		}

		//pwd
		document.getElementById("empPwd1").addEventListener("blur", pwdCheck);
		document.getElementById("empPwd2").addEventListener("blur", pwdCheck);
		function pwdCheck() {
			let empPwd1 = document.getElementById("empPwd1");
			let empPwd1Val = empPwd1.value;
			let empPwd2 = document.getElementById("empPwd2");
			let empPwd2Val = empPwd2.value;

			if (empPwd1Val == "")
				empPwd1.setCustomValidity("pwd1 can't be empty");
			else if (empPwd2Val == "")
				empPwd2.setCustomValidity("pwd1 can't be empty");
			else if (empPwd1Val != empPwd2Val)
				empPwd1.setCustomValidity("pwd1 can't be empty");
			else if (pwdCheckR.test(empPwd1Val) == false)
				empPwd1.setCustomValidity("pwd1 format error");
			else if (pwdCheckR.test(empPwd2Val) == false)
				empPwd2.setCustomValidity("pwd2 format error");

			if (pwdCheckR.test(empPwd1Val) == true
					&& pwdCheckR.test(empPwd2Val) == true
					&& empPwd1Val == empPwd2Val) {
				empPwd1.setCustomValidity("");
				empPwd2.setCustomValidity("");
			}
		}

		//bday
		document.getElementById("empBday").addEventListener("blur", bdayCheck);
		function bdayCheck() {
			function bdayECheck(bdayObjVal) {
				let splitDate = bdayObjVal.split("/");
				//console.log(splitDate);
				let date = new Date(splitDate[0], splitDate[1] - 1,
						splitDate[2]);
				// console.log(date);
				let year = date.getFullYear();
				let month = date.getMonth() + 1;
				let day = date.getDate();
				let status = false;
				if (year == splitDate[0] && month == splitDate[1]
						&& day == splitDate[2]) {
					return (status = true);
				} else
					return false;
			}

			let empBday = document.getElementById("empBday");
			let empBdayVal = empBday.value;

			const bdayCheckR = /\d{4}\/\d{1,2}\/\d{1,2}/;
			if (empBdayVal == "")
				empBday.setCustomValidity("can't be empty");
			else if (bdayCheckR.test(empBdayVal) == false)
				empBday.setCustomValidity("format incorrect");
			else if (bdayECheck(empBdayVal) == false)
				empBday.setCustomValidity("date not exist");

			if (bdayCheckR.test(empBdayVal) == true
					&& bdayECheck(empBdayVal) == true) {
				empBday.setCustomValidity("");
			}
		}

		document.getElementById("empPic").addEventListener("blur", picCheck);
		function picCheck() {
			let empPic = document.getElementById("empPic");
			let empPicVal = empPic.value;
			let picCheckR = /\.jpg$/;
			if (empPicVal == "")
				empPic.setCustomValidity("can't be empty");
			else if (picCheckR.test(empPicVal) == false)
				empPic.setCustomValidity("JPG only");
			else
				empPic.setCustomValidity("");
		}

		function authorityCheck() {
			let authority = document.getElementById("authority");
			let authorityVal = authority.value;
			if (authorityVal == "--------")
				authority.setCustomValidity("can't be empty");
			else
				authority.setCustomValidity("");
		}

		function deptCheck() {
			let dept = document.getElementById("dept");
			let deptVal = dept.value;
			if (deptVal == "--------")
				dept.setCustomValidity("can't be empty");
			else
				dept.setCustomValidity("");
		}

		function pwdType() {
			let empPwd1 = document.getElementById("empPwd1");
			let empPwd2 = document.getElementById("empPwd2");
			if (empPwd1.type === "password") {
				empPwd1.type = "text";
			} else {
				empPwd1.type = "password";
			}
			if (empPwd2.type === "password") {
				empPwd2.type = "text";
			} else {
				empPwd2.type = "password";
			}
		}
	</script>
	<script type="text/javascript">
	let flag = false;
	
	$(function(){
		$('#empPic').on('blur',function(e){
			
			let pic = $(this).val();
			let picCheckR = /\.jpg$/;
			if(pic == ''){
				$('#picInvalid').html("please input");
				empPic.setCustomValidity("please input");
				return;
			}
			if(picCheckR.test(pic) == false){
				$('#picInvalid').html("JPG only");
				empPic.setCustomValidity("JPG only");
				return;
			}
			processImageFile(e.target.files[0]);
			if(flag == true){
				empPic.setCustomValidity("");
			}
			
		})
	})
	
	function processImageFile(imageObject) {
  var uriBase =
    "https://southcentralus.api.cognitive.microsoft.com/vision/v2.1/analyze";

  var params = {
    visualFeatures: "Faces,Adult,Categories,Description,Color",
    details: "",
    language: "en",
  };

  var sourceImageUrl = URL.createObjectURL(imageObject); 
  $.ajax({
    url: uriBase + "?" + $.param(params),
    beforeSend: function (xhrObj) {
      xhrObj.setRequestHeader("Content-Type", "application/octet-stream");
      xhrObj.setRequestHeader("Ocp-Apim-Subscription-Key", "e3be3b090eec4cd9946a53e197f37962");
    },
    type: "POST",
    processData: false,
    contentType: false,
    data: imageObject,
  })
    .done(function (data) {
      if (data.faces[0] != null) {
		flag = true;
        console.log("ok");
        console.log(data.faces[0].age);
      }
      else{
    	  flag = false;
    	  $('#picInvalid').html("clear face plz");
		  empPic.setCustomValidity("clear face plz");
      }
    })
    .fail(function (jqXHR, textStatus, errorThrown) {
      console.log(error);
    });
}

	
	</script>
	
	<script type="text/javascript">
	$(function(){
		$('#empEmail').on("blur",function(){
			let email = $(this).val();
			if(email == ''){
				$('#emailInvalid').html("please input");
				empEmail.setCustomValidity("please input");
				return
			}
			if(emailCheckR.test(email)==false){
				$('#emailInvalid').html("format error");
				empEmail.setCustomValidity("format error");
				return;
			}
			$.ajax({
				type:'post',
				url:'emailCheck.controller/'+email,
				success:function(data){					
					if(data =='y'){
						console.log("used");
						$('#emailInvalid').html("be used");
						empEmail.setCustomValidity("used");
					}
					else{
						empEmail.setCustomValidity("");
					}
				},error:function(e){
					console.log(e);
				}
			});
		})
		
	})
	
	</script>
</body>
</html>
