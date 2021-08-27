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
							<img src="images\partyPic\優質單身男女.jpg" class="d-block w-100"
								alt="..." style="width: 900px; height: 400px;">
						</div>
						<div class="carousel-item">
							<img src="images\partyPic\五分鐘.jpg" class="d-block w-100"
								alt="..." style="width: 900px; height: 400px;">
						</div>
						<div class="carousel-item">
							<img src="images\partyPic\打到骨折.jpg" class="d-block w-100"
								alt="..." style="width: 900px; height: 400px;">
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
												
				
				</div>
					<!-- area star -->
					<div class="col-lg-12">
						<!-- Nested row for non-featured blog posts-->
						<div class="row" id="area">
				
							
						</div>
					</div>
				<!-- area End -->
			</div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
		</div>
	</div>

	<%@include file="../frontcommonpages/shopbottom.jsp"%>

	<script>
	$(function(){
		load()
	})
		function load() {
			$.ajax({
				type : 'post',
				url : 'useractivityjson',
				dataType : 'JSON',
				contentType : 'application/json',
				success : function(data) {
					 var json = JSON.stringify(data, null, 2);
					 var parsedObjinArray = JSON.parse(json);
					 console.log(parsedObjinArray)
					  var itemarea = $('#area');
			    	     $('#area').empty("");
			    	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
			    	     var item = 
			    	    	 "<div class='col-lg-4' id='Grid'>"+
			    	    	 	"<a href='useractivity.page?number="+n.number+"'>"+
			    	    	 	"<img class='card-img-top' src='"+n.cover+"' style='width:400px; height:350px;border-radius:10px'; alt='...' />"+"<span style='background-color:opacity:0; color:white; position: absolute; right:20px; border-radius:5px;' >👁️‍🗨️"+n.see+"</span>"+
			    	    	 		"<div class='card-body'>"+
			    	    	 			"<h2 class='card-title h4'>"+
			    	    	 				"<a style='text-decoration: none;' href='useractivity.page?number="+n.number+"'>"+n.activityname+"</a>"+
			    	    	 			"</h2>"+
			    	    	 				"<div>"+
			    	    	 					"<span>📆"+"</span>"+"<span class='card-text'>"+n.time+"</span>"+
			    	    	 					"<span>❤️"+"</span>"+"<span class='card-text'>"+n.type+"</span>"+
			    	    	 					"<span>🌎️"+"</span>"+"<span class='card-text'>"+n.county+"</span>"+"<br/>"+
			    	    	 					
			    	    	 					"<span class='d-inline-block text-truncate'	style='max-width: 250px;' class='col-30 text-truncate'>"+n.detail+"</span>"+
			    	    	 					"<br/>"+"<br/>"+
			    	    	 					"<a class='btn btn-primary' href='useractivity.page?number="+n.number+"'>查看活動內容</a>"+
			    	    	 				"</div>"+
			    	    		 	"<div>"+
			    	    		 "</a>"+
			    	    	 "</div>"
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
