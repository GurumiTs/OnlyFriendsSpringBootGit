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

			<!-- Page content-->
			<div class="container mt-5">
				<br> <br> <br> <br> <br>
				<div class="row">
					<div class="col-lg-8">
						<!-- Post content-->
						<article>
							<!-- Post header-->
							<header class="mb-4">
								<!-- Post title-->
								<h1 class="fw-bolder mb-1" name="name" value="${party.name}"></h1>
								<!-- Post meta content-->

							</header>
							<!-- Preview image figure-->
							<a href="useractivity.post" style="text-decoration: none;"><p>↩
									返回上一頁</p> </a>
							<figure class="mb-4">
								<img class="img-fluid rounded" style="width:700px;height:500px;" src="${userActivity.cover}" alt="..." />
							</figure>
							<!-- Post content-->
							<section class="mb-5">
								<p class="fs-5 mb-4">
									活動名稱: ${userActivity.activityname} <br /> 活動類型: ${userActivity.type} <br />
									活動日期:${userActivity.time} <br /> 報名截止日: ${userActivity.time_up} <br /> <br />
									活動內容: <br /> <br /> 活動地點: ${userActivity.county}
									${userActivity.district} ${userActivity.place} <br />
									參加條件:${userActivity.condition} <br /> 男生人數: ${userActivity.man}
									女生人數:${userActivity.woman}
								</p>
							</section>
							<button type="button" disabled="disabled" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#exampleModal">
								已參加此活動</button>

						
							<!-- Modal -->
							
						</article>
					</div>
					<!-- Side widgets-->
					<div class="col-lg-4">
		
					
						<!-- Side widget-->
						<div class="card mb-4">
							<div class="card-header">There are all kinds of people in
								this world. It happens that we have become friends. This is not
								fate. It is just that we should be friends.</div>
							<div class="card-body">
								這是世界上有各式各樣的人，恰巧我們成為了朋友，这不是缘分，只僅僅是我們本因該是朋友。</div>
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
