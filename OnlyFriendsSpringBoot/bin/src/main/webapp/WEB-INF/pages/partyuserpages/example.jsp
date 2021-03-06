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
							<a href="userparty.entry" style="text-decoration: none;"><p>↩
									返回上一頁</p> </a>
							<figure class="mb-4">
								<img class="img-fluid rounded" src="${party.cover}" alt="..." />
							</figure>
							<!-- Post content-->
							<section class="mb-5">
								<p class="fs-5 mb-4">
									活動名稱: ${party.name} <br /> 活動類型: ${party.type} <br />
									活動日期:${party.time} <br /> 報名截止日: ${party.time_up} <br /> <br />
									活動內容: ${party.plany} <br /> <br /> 活動地點: ${party.county}
									${party.district} ${party.place} <br />
									參加條件:${party.condition} <br /> 男生人數: ${party.man}
									女生人數:${party.woman}
								</p>
							</section>
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#exampleModal">
								我要報名</button>

							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">確定報名 ${party.name}</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">參加條件:${party.condition}</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">返回</button>
											<button type="button" class="btn btn-primary">確定</button>
										</div>
									</div>
								</div>
							</div>
						</article>
					</div>
					<!-- Side widgets-->
					<div class="col-lg-4">
						<!-- Search widget-->
						<div class="card mb-4">
							<div class="card-header">Search</div>
							<div class="card-body">
								<div class="input-group">
									<input class="form-control" type="text"
										placeholder="Enter search term..."
										aria-label="Enter search term..."
										aria-describedby="button-search" />
									<button class="btn btn-primary" id="button-search"
										type="button">Go!</button>
								</div>
							</div>
						</div>
						<!-- Side widget-->
						<div class="card mb-4">
							<div class="card-header">There are all kinds of people in
								this world. It happens that we have become friends. This is not
								fate. It is just that we should be friends.</div>
							<div class="card-body">
								这世界上有各种各样的人，恰巧我们成为了朋友，这不是缘分，只仅仅是我们本就应该是朋友。</div>
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
