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
								<h1 class="fw-bolder mb-1" name="name"
									value="${userActivity.activityname}"></h1>
								<!-- Post meta content-->

							</header>
							<!-- Preview image figure-->
							<a href="useractivity.post" style="text-decoration: none;"><p>↩
									返回上一頁</p> </a>
							<figure class="mb-4">
								<img class="img-fluid rounded"
									style="width: 700px; height: 500px;"
									src="${userActivity.cover}" alt="..." />
							</figure>
							<!-- Post content-->
							<section class="mb-5">
								<p class="fs-5 mb-4">
									活動名稱: ${userActivity.activityname} <br /> 審核狀態:
									${userActivity.approve} <br />活動類型: ${userActivity.type} <br />
									活動日期:${userActivity.time} <br /> 報名截止日:
									${userActivity.time_up} <br /> <br /> 活動內容:
									${userActivity.detail} <br /> <br /> 活動地點:
									${userActivity.county} ${userActivity.district}
									${userActivity.place} <br /> 參加條件:${userActivity.condition} <br />
									男生人數: ${userActivity.man} 女生人數:${userActivity.woman}<br />
									<br />剩餘名額: ${userActivity.total}
								</p>
							</section>
							<a
								href="userActivity.up.controller?number=${userActivity.number}"><button
									type="button" class="btn btn-primary" data-bs-toggle="modal"
									data-bs-target="#exampleModal">修改活動</button></a> <input
								id="activitynumber" type="text" class="d-none"
								value="${userActivity.number}">
							<!-- Modal -->

						</article>
					</div>
					<!-- Side widgets-->
					<div class="col-lg-4">
					
						<!-- Side widget-->
						<div class="card mb-4">
							<div class="card-header">You know, some people can only meet one in a lifetime.</div>
							<div class="card-body">
								你知道，有些人一輩子只能遇到一個。</div>
							
						</div>
						<div class="card mb-4">
							<div class="card-header"><h3>參加活動者:</h3></div>
							<div class="card-body" id="area">
							 
								</div>
							
						</div>
					</div>
				</div>
			</div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
		</div>
	</div>

	<%@include file="../frontcommonpages/shopbottom.jsp"%>

	<script>
		$(function(){
			load()
		})
			function load(){
			let number = $('#activitynumber').val()
			console.log(number);
			$.ajax({
				type: 'post',
				url: 'lo',
				data:{"number":number},
				success:function(data){		
					console.log(data);
					  var itemarea = $('#area');
			    	     $('#area').empty("");
			    	 	 $.each(data,function(i,n){ //i為順序 n為單筆物件
			    	     var item = "<img id='img' class='rounded-circle border border-4' style='width:100px;' src='"+n.memberPic+"'>" +
			    	     "<span  class='fw-bold fs-3'>ㅤ"+n.memberName+" ㅤ</span><br/>"+
			    	     "<span class='fw-bold fs-4'>"+n.personalInfo+"</span><br/>"+"<hr>"
			    				    	     
			    	     itemarea.append(item);
			    	 	 });
				},
				error : function() {
					console.log("error");
				}			
			});
		}
		
	</script>
</body>
</html>
