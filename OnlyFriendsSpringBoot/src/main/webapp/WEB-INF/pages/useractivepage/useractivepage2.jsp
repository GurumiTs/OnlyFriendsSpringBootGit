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
									活動名稱: ${userActivity.activityname} <br /> 
									活動類型: ${userActivity.type} <br />
									活動日期:${userActivity.time} <br /> 
									報名截止: ${userActivity.time_up} <br /> <br />
									活動內容:${userActivity.detail}  <br /> <br /> 
									活動地點: ${userActivity.county}${userActivity.district} ${userActivity.place} <br />
									參加須知:${userActivity.condition} <br /> 
									男生人數: ${userActivity.man} 女生人數:${userActivity.woman}<br /><br />
									剩餘名額: ${userActivity.total}
								</p>
							</section>
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#exampleModal">
								取消參加</button><input
								id="activitynumber" type="text" class="d-none"
								value="${userActivity.number}">
<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">確定取消參加
												${userActivity.activityname}</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">活動內容:${userActivity.detail}</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">返回</button>
											<a href="cancelactivity?number=${userActivity.number}">
												<button type="button" class="btn btn-primary">確定</button>
											</a>
										</div>
									</div>
								</div>
							</div>
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
								這是世界上有各式各樣的人，恰巧我們成為了朋友，这不是缘分，只僅僅是我們本應該是朋友。</div>
						</div>
						<div class="card mb-4">
							<div class="card-header">
								<h3>活動創辦人:</h3>
							</div>
							<div class="card-body" id="area"></div>

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
		let number = $('#activitynumber').val()
		console.log(number);
		$.ajax({
			type : 'post',
			url : 'ao',
			data : {"number" : number},
			success : function(data) {
				console.log(data);
				var itemarea = $('#area');
				$('#area').empty("");
				let item = 
					"<img class='rounded-circle border border-4 mx-auto' style='width:125px;' src='"+data.memberPic+"'>"+
					"<span class='fw-bold fs-3'> ㅤ"+data.memberName+"</span></br>"+
					"<span class='fw-bold fs-4'>"+data.personalInfo+"</span>"
					
					;
				$('#area').append(item)
					},
					error : function() {
						console.log("error");
					}
				});
	}
	</script>
</body>
</html>
