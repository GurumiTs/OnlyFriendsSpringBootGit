<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
#Grid:hover {
	transform: scale(1.05);
}
</style>
</head>
<body>
<body class="layout-2">
	<div id="app">
		<div class="main-wrapper">

			<%@include file="../frontcommonpages/shopheader.jsp"%>



			<!-- Page content-->
			<div class="container mt-5">

				<br /> <br />
				<!-- 輪播 -->
				<div id="carouselExampleFade" class="carousel slide carousel-fade"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="images\partyPic\優質單身男女.jpg" class="d-block w-100" alt="..." style="width: 900px; height: 400px;">
						</div>
						<div class="carousel-item">
							<img src="images\partyPic\五分鐘.jpg" class="d-block w-100" alt="..." style="width: 900px; height: 400px;">
						</div>
						<div class="carousel-item">
							<img src="images\partyPic\打到骨折.jpg" class="d-block w-100" alt="..." style="width: 900px; height: 400px;">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleFade" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleFade" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<!-- 輪播 style="width: 900px; height: 400px;" images\partyPic\party2.jpg-->
				<br />
				<div class="col-md-4 col-xs-12">
					<select class="from-cotrol">
					<option value="1">依日期排列</option>
					<option value="2">依地區排列</option>
					<option value="2">依活動排列</option>
					</select>
				<button type="submit" class="btn btn-sub1">搜尋</button>
				</div>
				<div class="row">
					<!-- Blog entries-->
					<div class="col-lg-12">
						<!-- Nested row for non-featured blog posts-->

						<div class="row">
							<c:if test='${not empty partyList}'>
								<c:forEach var="party" items="${partyList}">
									<div class="col-lg-4" id="Grid">
										<!-- Blog post-->
										<div class="card mb-4" id="${party.number}">
											<a href="userparty.page?number=${party.number}"><img
												class="card-img-top" id="${party.number}cover"
												src="${party.cover}" width="700px" height="350px" alt="..." /></a>
											<div class="card-body">
												<h2 class="card-title h4">
													<a style="text-decoration: none;"
														href="userparty.page?number=${party.number}">${party.name}</a>
												</h2>
												<div>
													<span> ⏰ </span> <span class="card-text"
														id="${party.number}time">${party.time} </span> <span>
														❤️ </span> <span class="card-text" id="${party.number}type">
														${party.type}</span> <span> 🌎️ </span> <span class="card-text"
														id="${party.number}conty">${party.county}</span> <span
														class="card-text" id="${party.number}district">${party.district}</span>
												</div>
												</br> <span class="d-inline-block text-truncate"
													style="max-width: 300px;" id="${party.number}plany"
													class="col-30 text-truncate"> ${party.plany}</span> </br>
													 <a
													class="btn btn-primary"
													href="userparty.page?number=${party.number}">查看活動內容</a>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
		</div>
	</div>

	<%@include file="../frontcommonpages/shopbottom.jsp"%>

	<script>
		
	</script>
</body>
</html>
