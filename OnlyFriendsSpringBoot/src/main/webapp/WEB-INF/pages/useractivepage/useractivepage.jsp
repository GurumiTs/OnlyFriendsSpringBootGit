<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
body {
	font-size: 1.2rem
}
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0; // remove the gap so it doesn't close
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
						<article >
							<!-- Post header-->

							<!-- Preview image figure-->
							<a href="useractivity.entry" style="text-decoration: none;"><p>↩
									返回上一頁</p> </a>
							
								<img class="img-fluid rounded"
									style="width: 700px; height: 500px;"
									src="${userActivity.cover}" alt="..." />
							
							<!-- Post content-->
							<section class="mb-5" id="area2">
								<p class="fs-5 mb-4">
									活動名稱: ${userActivity.activityname} <br /> 
									活動類型: ${userActivity.type} <br /> 
									活動日期: ${userActivity.time} <br />
									報名截止: ${userActivity.time_up} <br /> <br /> 
									活動內容:	${userActivity.detail} <br /> <br /> 
									活動地點:	${userActivity.county} ${userActivity.district}	${userActivity.place} <br /> 活動須知:${userActivity.condition} <br />
									男生人數: ${userActivity.man} 女生人數:${userActivity.woman}<br />
									<br />剩餘名額: ${userActivity.total}
								</p>
							</section>
							<!-- Button trigger modal 判斷-->
							<div id=buttonarea>
							</div>
							
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#exampleModal">
								我要報名</button>
								
							<input id="activitynumber" type="text" class="d-none"
								value="${userActivity.number}">
								<input id="account" type="text" class="d-none"
								value="${userActivity.memberAccount}">
							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">確定報名
												${userActivity.activityname}</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">活動須知:${userActivity.condition}</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">返回</button>
											<a href="addactivity?number=${userActivity.number}">
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
			load2()
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
		function load2(){
			let number = $('#activitynumber').val()
			let account = $('#account').val()
				console.log(account)
			$.ajax({
				type : 'post',
				url : 'userpagejson',
				data : {"number" : number},
				success : function(data) {
					console.log(data);				
						},
						error : function() {
							console.log("error");
						}
					});
		}
	</script>
</body>
</html>
