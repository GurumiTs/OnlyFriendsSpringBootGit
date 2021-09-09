<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
body{
font-size:1.2rem
}

.row {
    color: #928b84;
    font-family: "Times New Roman", 微軟正黑體, Microsoft JhengHei UI, Microsoft JhengHei, Helvetica Neue, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    font-size: 16px;
}

.rightStyle{
float: right;
position: absolute;
right: 30px;
}

.card{
	text-align: center;
    margin-bottom: 30px;
    background-color: #fcfcfc;
}

.list-text {
    padding: 30px 30px 50px 30px;
}

.list-title {
	color: #424443;
    font-size: 28px;
    line-height: 1.42857143;
    margin-bottom: 20px;
    font-family: "Times New Roman", "Noto Serif TC", Times, serif;
}

.list-table {
    width: 100%;
    text-align: left;
}

table {
    background-color: transparent;
    border-collapse: collapse;
    border-spacing: 0;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

.list-table tr {
    border-bottom: 1px solid #ddd;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

.list-table td {
    padding: 5px 0px;
}

td {
    display: table-cell;
    vertical-align: inherit;
}

td a{
    color: #a3ad71;
	text-decoration: none;
	background-color: transparent;
}

a :hover{
	color: #a3ad71;
}
a:-webkit-any-link {
    
    cursor: pointer;
    
}

.list-text h3 {
	color: #424443;
    font-size: 18px;
    margin: 0;
	margin-left: 10px;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
    width: 100%;
    max-width: 200px;
	text-align: left;
	font-family: "Times New Roman", "Noto Serif TC", Times, serif;
	text-align:center;
}

.h3{
	font-family: "微軟正黑體";
	color: #928b84;
}

.list-table td.date {
	font-size: 14px;
}

.list-more {
	margin-top: 30px;
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
					
						<!-- Nested row for non-featured blog posts-->
						<div class="row">
						
							<div class="col-md-4">
								<!-- Blog post 愛情 -->
								<div class="card mb-4">
									<img class="card-img-top"
										src="images/blogPic/empblog/lovestory01.jpg"
										alt="Only 愛情" />
									<div class="list-text">
										<h2 class="list-title h3">Only 愛情</h2>
										<table class="list-table">
											<tbody id="lovetype">
											</tbody>
										</table>
										
										<div class="list-more" id="lovetypemore"><a id="lovetypea" class="btn btn-primary" href="#!">查看更多</a></div>
									</div>
								</div>
							</div>

							<div class="col-md-4">
								<!-- Blog post 星座-->
								<div class="card mb-4">
									<img class="card-img-top"
										src="images/blogPic/empblog/lovestory02.jpg"
										alt="Only 星座" />
									<div class="list-text">
										<h2 class="list-title h3" style="text-align:center;">Only 星座</h2>
										<table class="list-table">
											<tbody id="startype">
											</tbody>
										</table>
										
										<div class="list-more" id="startypemore"><a id="startypea" class="btn btn-primary" href="#!">查看更多</a></div>
									</div>
								</div>
							</div>
							
							<div class="col-md-4">
								<!-- Blog post 新聞-->
								<div class="card mb-4">
									<img class="card-img-top"
										src="images/blogPic/empblog/lovestory03.jpg"
										alt="Only 新聞" />
									<div class="list-text">
										<h2 class="list-title h3" style="text-align:center;">Only 新聞</h2>
										<table class="list-table">
											<tbody id="newstype">
											</tbody>
										</table>
										
										<div class="list-more" id="newstypemore"><a id="newstypea" class="btn btn-primary" href="#!">查看更多</a></div>
									</div>
								</div>
							</div>
							
							<div class="col-md-4">
								<!-- Blog post Beauty-->
								<div class="card mb-4">
									<img class="card-img-top"
										src="images/blogPic/empblog/lovestory04.jpg"
										alt="Only Beauty" />
									<div class="list-text">
										<h2 class="list-title h3" style="text-align:center;">Only Beauty</h2>
										<table class="list-table">
											<tbody id="beautytype">
											</tbody>
										</table>
										
										<div class="list-more" id="beautytypemore"><a id="beautytypea" class="btn btn-primary" href="#!">查看更多</a></div>
									</div>
								</div>
							</div>
							
							<div class="col-md-4">
								<!-- Blog post 心測-->
								<div class="card mb-4">
									<img class="card-img-top"
										src="images/blogPic/empblog/lovestory05.jpg"
										alt="Only 心測" />
									<div class="list-text">
										<h2 class="list-title h3" style="text-align:center;">Only 心測</h2>
										<table class="list-table">
											<tbody id="testtype">
											</tbody>
										</table>
										
										<div class="list-more" id="testtypemore"><a id="testtypea" class="btn btn-primary" href="#!">查看更多</a></div>
									</div>
								</div>
							</div>
							
							
							<div class="col-md-4">
								<!-- Blog post other-->
								<div class="card mb-4">
									<img class="card-img-top"
										src="images/blogPic/empblog/lovestory06.jpg"
										alt="Only 其他" />
									<div class="list-text">
										<h2 class="list-title h3" style="text-align:center;">Only 其他</h2>
										<table class="list-table">
											<tbody id="othertype">
											</tbody>
										</table>
										
										<div class="list-more" id="othertypemore"><a id="othertypea" class="btn btn-primary" href="#!">查看更多</a></div>
									</div>
								</div>
							</div>
							
						</div>
						<!-- row end-->
				</div>
			</div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
		</div>
	</div>
	<%@include file="../frontcommonpages/shopbottom.jsp"%>

	<script>
		
		
		// 查詢分類方法 
		let blogType = "愛情";
		let love = '#lovetype';
		let star = '#startype';
		let news = '#newstype';
		let beauty = '#beautytype';
		let test = '#testtype';
		let other = '#othertype';
		
		
		
		$(function(){
			queryblogtype("愛情", love, 1);
			queryblogtype("星座", star, 2);
			queryblogtype("新聞", news, 3);
			queryblogtype("Beauty", beauty, 4);
			queryblogtype("心測", test, 5);
			queryblogtype("其他", other, 6);
		});
		
		function queryblogtype(a, b, c){
			$.ajax({
	            type: "POST",
	            url: "queryByBlogType",
	            data:{"blogType": a},
	            success: function(data) {           	
	            	var lovetype = $(b);
	            	$(b).empty("");
	            	console.log(b+":"+data.length);
	            	if(data.length == 0){
	            		var listmore = $('#list-more');
	            		var message = 
	            			"<div class='ms-3' style='text-align:center; margin-right: 15px'>"+
                    		"目前暫無最新文章"+
                			"</div>";
                		lovetype.append(message);
                		$(b+"more").css("display", "none");
	            	}
	            	else{
	            		$.each(data, function(i,n){
			            	var message = 
			            		"<tr>"+
								"<td>"+
								"<h3>"+
								"<a href='blogarticleentry?ArticleId="+n.articleID+"&name=official'>"+n.title.substr(0,14)+"777</a>"+
								"</h3>"+
								"</td>"+
								"<td class='date'>"+n.updateTime.substr(0,10)+"</td>"+
								"</tr>";
							lovetype.append(message);
							$(b+"a").attr("href", 'blogtypeofficial/'+c+'');
	            		});
	            	}
	            },
	            error: function(xhr){
	            	console.log("error!")
	            }
	        });// ajax end
		};
		
	</script>

</body>
</html>
