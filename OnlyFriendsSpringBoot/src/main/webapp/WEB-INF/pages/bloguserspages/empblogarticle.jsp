<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
body{
font-size:1.2rem
}

.articleimg{
weight: 900px;
height: 400px;
margin: 0 auto;
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
                <div class="col-lg-12 border border-secondary" style="background-color:#FBFBFF;">
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
<!--                             <p class="fs-5 mb-4">Science is an enterprise that should be cherished as an activity of the free human mind. Because it transforms who we are, how we live, and it gives us an understanding of our place in the universe.</p> -->
<!--                             <p class="fs-5 mb-4">The universe is large and old, and the ingredients for life as we know it are everywhere, so there's no reason to think that Earth would be unique in that regard. Whether of not the life became intelligent is a different question, and we'll see if we find that.</p> -->
<!--                             <p class="fs-5 mb-4">If you get asteroids about a kilometer in size, those are large enough and carry enough energy into our system to disrupt transportation, communication, the food chains, and that can be a really bad day on Earth.</p> -->
<!--                             <h2 class="fw-bolder mb-4 mt-5">I have odd cosmic thoughts every day</h2> -->
<!--                             <p class="fs-5 mb-4">For me, the most fascinating interface is Twitter. I have odd cosmic thoughts every day and I realized I could hold them to myself or share them with people who might be interested.</p> -->
<!--                             <p class="fs-5 mb-4">Venus has a runaway greenhouse effect. I kind of want to know what happened there because we're twirling knobs here on Earth without knowing the consequences of it. Mars once had running water. It's bone dry today. Something bad happened there as well.</p> -->
                        </section>
                    </article>
                    <!-- Comments section留言板-->
                    <section class="mb-5">
                        <div class="card " style="background-color:#F0F0F0;">
                            <div class="card-body">
                                <!-- Comment form-->
                                <form class="mb-4"><textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea></form>
                                <!-- Comment with nested comments-->
                                <div class="d-flex mb-4">
                                    <!-- Parent comment-->
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">Commenter Name</div>
                                        If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
                                        <!-- Child comment 1-->
                                        <div class="d-flex mt-4">
                                            <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                            <div class="ms-3">
                                                <div class="fw-bold">Commenter Name</div>
                                                And under those conditions, you cannot establish a capital-market evaluation of that enterprise. You can't get investors.
                                            </div>
                                        </div>
                                        <!-- Child comment 2-->
                                        <div class="d-flex mt-4">
                                            <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                            <div class="ms-3">
                                                <div class="fw-bold">Commenter Name</div>
                                                When you put money directly to a problem, it makes a good headline.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Single comment-->
                                <div class="d-flex">
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">Commenter Name</div>
                                        When I look at the universe and all the ways the universe wants to kill us, I find it hard to reconcile that with statements of beneficence.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <!-- Side widgets-->
<!--                 <div class="col-lg-4"> -->

                    <!-- Search widget-->
<!--                     <div class="card mb-4"> -->
<!--                         <div class="card-header">Search</div> -->
<!--                         <div class="card-body"> -->
<!--                             <div class="input-group"> -->
<!--                                 <input class="form-control" type="text" placeholder="Enter search term..." aria-label="Enter search term..." aria-describedby="button-search" /> -->
<!--                                 <button class="btn btn-primary" id="button-search" type="button">Go!</button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
                    
                    <!-- Categories widget-->
<!--                     <div class="card mb-4"> -->
<!--                         <div class="card-header">Categories</div> -->
<!--                         <div class="card-body"> -->
<!--                             <div class="row"> -->
<!--                                 <div class="col-sm-6"> -->
<!--                                     <ul class="list-unstyled mb-0"> -->
<!--                                         <li><a href="#!">Web Design</a></li> -->
<!--                                         <li><a href="#!">HTML</a></li> -->
<!--                                         <li><a href="#!">Freebies</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                                 <div class="col-sm-6"> -->
<!--                                     <ul class="list-unstyled mb-0"> -->
<!--                                         <li><a href="#!">JavaScript</a></li> -->
<!--                                         <li><a href="#!">CSS</a></li> -->
<!--                                         <li><a href="#!">Tutorials</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
                    <!-- Side widget-->
<!--                     <div class="card mb-4"> -->
<!--                         <div class="card-header">Side Widget</div> -->
<!--                         <div class="card-body">You can put anything you want inside of these side widgets. They are easy to use, and feature the Bootstrap 5 card component!</div> -->
<!--                     </div> -->
<!--                 </div> -->
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
