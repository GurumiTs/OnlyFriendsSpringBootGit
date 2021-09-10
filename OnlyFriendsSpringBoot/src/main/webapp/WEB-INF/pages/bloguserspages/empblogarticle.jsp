<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
body{
font-size:1.2rem
}

.container{
max-width: 1400px;
}

.articleimg{
weight: 900px;
height: 400px;
margin: 0 auto;
}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0; // remove the gap so it doesn't close
 }

/* 目錄 */
.blog-sidebar {
    padding: 40px 30px;
   	background-image: url(${pageContext.request.contextPath}/images/blogPic/empblog/bg_light.jpg);
    background-repeat: repeat;
    background-position: center center;
    color: #928b84;
    font-family: "Times New Roman", 微軟正黑體, Microsoft JhengHei UI, Microsoft JhengHei, Helvetica Neue, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    font-size: 16px;
}

.blog-sidebar-title {
    text-align: left;
    font-size: 28px;
    color: #424443;
    font-family: "Times New Roman", "Noto Serif TC", Times, serif;
    margin-bottom: 20px;
}

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
        <br><br><br><br><br>
            <div class="row">
                <div class="col-lg-10" style="background-color:#FBFBFF;">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1">${blogOfficial.title}</h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2">發布時間:${fn:substring(blogOfficial.updateTime,0,10)} 發文者:${blogOfficial.userID}</div>
                            <div class="text-muted fst-italic mb-2">瀏覽人數:${blogOfficial.watchNum}</div>
                            <!-- Post categories-->
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">Web Design</a>
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a>
                        </header>
                        <!-- Preview image figure-->
                        <figure class="mb-4" style="text-align:center;"><img class="img-fluid rounded articleimg" src="${blogOfficial.images}" alt="${blogOfficial.title}" /></figure>
                        <!-- Post content-->
                        <section class="mb-5">
                        	<p class="fs-5 mb-4">${blogOfficial.mainText}</p>
                        </section>
                    </article>
                </div>
					<!-- 側邊目錄-->
					<div class="col-lg-2">
						<div class="blog-sidebar"
							style="background-image: url(../images/blogPic/empblog/bg_light.jpg);">
							<div class="blog-sidebar-title">目錄</div>
							<ul class="blog-sidebar-list">
								<li><a
									href="http://localhost:8080/OnlyFriends/blogofficialmain">回主目錄</a>
								</li>
								<li><a href="blogofficial?blogtype=愛情">Only 愛情篇</a></li>
								<li><a href="blogofficial?blogtype=星座">Only 星座篇</a></li>
								<li><a href="blogofficial?blogtype=新聞">Only 新聞篇</a></li>
								<li><a href="blogofficial?blogtype=Beauty">Only Beauty篇</a>
								</li>
								<li><a href="blogofficial?blogtype=心跳">Only 心測篇</a></li>
								<li><a href="blogofficial?blogtype=其他">Only 其他</a></li>
							</ul>
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
