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
						<article id="area">
							<!-- Post header-->
							
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
		$(function() {
			load()
		})
		function load() {
			$.ajax({
				type : 'post',
				url : 'userparty',
				dataType : 'JSON',
				contentType : 'application/json',
				success : function(data) {
					console.log(data)
				},
				error : function() {
					console.log("error");
				}
			});
		}
	</script>
</body>
</html>
