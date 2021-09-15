<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
body{
font-size:1.2rem
}

#blogimg{
	weight: 700px;
	height: 350px;
}

.card-body{
	background-image: url("../OnlyFriendsSpringBoot/src/main/resources/static/images/blogPic/empblog/bg_light.jpg"); 
}

.card-header{
	background-color: #84C1FF; 
	font-size: 20px;
	font-weight: bold;
	color: black;
}

.container{
	max-width: 1600px;
}
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0; // remove the gap so it doesn't close
 }

/* 目錄 */
.blog-sidebar-list {
    list-style: none;
    margin: 0;
    padding-left: 0;
}

.blog-sidebar-title ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

.blog-sidebar-list li {
    position: relative;
    padding-left: 20px;
    display: list-item;
    text-align: -webkit-match-parent;
}

.blog-sidebar-list li::before {
    content: "\f0da";
    font: normal normal normal 14px/1 FontAwesome;
    position: absolute;
    left: 2px;
    top: 3px;
}


.blog-sidebar-list li + li {
    margin-top: 10px;
}

a {
	text-decoration:none;
    color: #a3ad71;
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
				<br/>
				<br/>
				<br/>
				<br/>
				<div class="row">
					<!-- Blog entries-->
					<div class="col-lg-8">
						<div class="row">
						<div class="row" id="itemarea"></div>
							<!-- Nested row for non-featured blog posts -->
							<div class="card-footer bg-whitesmoke">
								<table id="showpage" class="d-flex justify-content-center">
									<tr>
										<td colspan="3" align="right"><c:forEach var="i" begin="1"
												end="${blogUserTotalPages}" step="1">
												<button class="btn btn-outline-secondary" id="myPage"
													value="${i}" onclick="change(${i})">${i}</button>
											</c:forEach></td>
									</tr>
								</table>
							</div>
						</div>						
					</div>
					<!--Side widget -->
					<div class="col-lg-4">
						<div class="card mb-4" style="font-family:微軟正黑體">
							<div class="card-header" style="background-color: #84C1FF; font-size: 28px;">戀人分享</div>
							<div class="card-body" style="text-align: left; background-color: #ECF5FF; font-weight: bold">每個人心中，都有一座巴黎鐵塔。每個人的夢裡，都有一塊屬於愛情的柔軟地。是屬於你我的愛情故事、是你我的愛情診療室，OnlyFriends 只想提供給你們，比好，更好的。
							</div>
						</div>
							<ul class="blog-sidebar-list">
								<li><a href="blogofficial">幸福故事</a></li>
								<li><a href="memberblog">管理文章</a></li>
								<li><a href="blogusersinsert">我要分享</a></li>
							</ul>
						</div>

						
					</div>
				</div>
			</div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
		</div>
	</div>
	<%@include file="../frontcommonpages/shopbottom.jsp"%>

	<script type="text/javascript">
		var indexPage = 1;

		$(function() {	
			loadUser(indexPage);
		})
	
		function change(page) {
			indexPage = page;
			loadUser(indexPage);
		}

		function loadUser(){
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
								"<a href='blogarticleentry?ArticleId="+n.usersArticleID+"&name=user'><img id='blogimg' class='card-img-top'"+
									"src='"+n.usersImages+"'/></a>"+
								"<div class='card-body'>"+
								"<div class='small text-muted'><i class='fas fa-eye'>人氣:"+n.watchNum+"</i></div>"+
									"<div class='small text-muted'>"+n.usersUpdateTime.substr(0,10)+"</div>"+
									"<h2 class='card-title h4'>"+n.usersTitle+"</h2>"+
									"<p class='card-text'>"+n.usersMainText.substr(0,90)+" ...</p>"+
									"<a class='btn btn-primary' href='blogarticleentry?ArticleId="+n.usersArticleID+"&name=user'>Read more →</a>"+
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
