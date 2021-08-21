<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
#blogimg{
weight: 700px;
height: 350px;
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
				<br />
				<br />
				<br />
				<br />
				<br />
				<div class="row">
					<!-- Blog entries-->
					<div class="col-lg-8">
						<div class="row" id="itemarea">
							<!-- Nested row for non-featured blog posts -->
							<div class="card-footer bg-whitesmoke">
								<table id="showpage" class="d-flex justify-content-center">
									<tr>
										<td colspan="3" align="right"><c:forEach var="i" begin="1"
												end="${totalPages}" step="1">
												<button class="btn btn-outline-secondary" id="myPage"
													value="${i}" onclick="change(${i})">${i}</button>
											</c:forEach></td>
									</tr>
								</table>
							</div>
						</div>						
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
						<!-- Categories widget-->
						<div class="card mb-4">
							<div class="card-header">Categories</div>
							<div class="card-body">
								<div class="row">
									<div class="col-sm-6">
										<ul class="list-unstyled mb-0">
											<li><a href="#!">Web Design</a></li>
											<li><a href="#!">HTML</a></li>
											<li><a href="#!">Freebies</a></li>
										</ul>
									</div>
									<div class="col-sm-6">
										<ul class="list-unstyled mb-0">
											<li><a href="#!">JavaScript</a></li>
											<li><a href="#!">CSS</a></li>
											<li><a href="#!">Tutorials</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						

						<!--Side widget -->
						<div class="card mb-4">
							<div class="card-header">Side Widget</div>
							<div class="card-body">You can put anything you want inside
								of these side widgets. They are easy to use, and feature the
								Bootstrap 5 card component!</div>
						</div>
					</div>
				</div>
			</div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
		</div>
	</div>
	<%@include file="../frontcommonpages/shopbottom.jsp"%>

	<script>
		var indexPage = 1;
		$(function() {	
			load(indexPage);
		})
	
		function change(page) {
			indexPage = page;
			load(indexPage);
		}
						
		function load(){
			$.ajax({
				type: 'POST',
				url: 'blogqueryallbypage/' + indexPage,
				dataType: 'JSON',
				contentType: 'application/json',
				success: function(data) {
				console.log(data);
				var json = JSON.stringify(data, null, 4);
				var parsedObjinArray = JSON.parse(json);
				var itemarea = $('#itemarea');
				$('#itemarea').empty("");
				$.each(parsedObjinArray, function(i,n){
				var item = 
					"<div class='col-lg-6'>"+
						"<div class='card mb-4'>"+
							"<a href='blogarticle'><img id='blogimg' class='card-img-top'"+
								"src='"+n.usersImages+"'/></a>"+
							"<div class='card-body'>"+
								"<div class='small text-muted'>"+n.usersUpdateTime+"</div>"+
								"<h2 class='card-title h4'>"+n.usersTitle+"</h2>"+
								"<p class='card-text'>"+n.usersMainText+"</p>"+
								"<a class='btn btn-primary' href='#!'>Read more →</a>"+
							"</div>"+
						"</div>"+
					"</div>";
				itemarea.append(item);
				});
			},
			error: function() {
				console.log("error!");
			}
		});
	};
						
	</script>

</body>
</html>
