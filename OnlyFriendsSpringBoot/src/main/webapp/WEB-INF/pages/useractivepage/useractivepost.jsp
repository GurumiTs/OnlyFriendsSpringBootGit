<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
body {
	font-size: 1.2rem
}
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

			<%@include file="../frontcommonpages/shopsider.jsp"%>

			<!-- Main Content -->
			<div class="main-content">
				<section class="section">
					<div class="section-header">
						<h1>創辦活動</h1>
						<a href="activityadd.controller"
							style="position: absolute; right:100px;"> <img
							src="images/smallicon/add.svg" alt=""></a>
					</div>
					<div class="col-lg-12">
						<!-- Nested row for non-featured blog posts-->
						<div class="row" id="area">
				
							
						</div>
					</div>
					<div class="section-header">
						<h1>參加活動</h1>
					</div>
					<div class="section-body">

						<!-- show profile-->
					</div>
			</div>
			</section>
		</div>
		<!-- main content -->
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
				url : 'userpost',
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
			    	    	 "<div class='col-lg-4' id='Grid' style='background-color:white;'>"+
			    	    	 	"<a href='useractivity.page?number="+n.number+"'>"+
			    	    	 	"<img class='card-img-top' src='"+n.cover+"' style='width:250px; height:200px;border-radius:10px'; alt='...' />"+
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
			    	    	 					"<a class='btn btn-primary' href='useractivity.page?number="+n.number+"'>查看活動內容</a>"+"<span style='position: absolute; right:5px;'>👁️‍🗨️"+n.see+"</span>"+
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