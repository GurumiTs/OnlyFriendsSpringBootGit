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

.divSpace{
weight: 15px;
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
                    <article >
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1">${blogUser.usersTitle}</h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2">發布時間:${fn:substring(blogUser.usersUpdateTime,0,10)} 發文者:${blogUser.usersName}</div>
                            <div class="text-muted fst-italic mb-2">瀏覽人數:${blogUser.watchNum}</div>
                            <!-- Post categories-->
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">Web Design</a>
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a>
                        </header>
                        <!-- Preview image figure-->
                        <figure class="mb-4" style="text-align:center;"><img class="img-fluid rounded articleimg" src="${blogUser.usersImages}" alt="${blogUsers.usersTitle}" /></figure>
                        <!-- Post content-->
                        <section class="mb-5">
                        	<p class="fs-5 mb-4">${blogUser.usersMainText}</p>
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

									<form action="addMessage" class="d-flex mb-4" onSubmit="return false">
											<img class="rounded-circle" src='${personalinfo.memberPic}'
												style="weight: 50px; height: 50px; float: left;" />
											&nbsp;
											&nbsp;
											<input id="messageText" name="messageText" type="text"
												class="form-control" placeholder="請留言"> 
											<input type="hidden" id="messagebutton" value="送出">
									</form>

									<!-- Comment with nested comments-->
                                
                                <div class="d-flex mb-4">
                                    <!-- Parent comment-->
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">Name1</div>
                                        留言1
                                        
<!--                                         Child comment 1 -->
<!--                                         <div class="d-flex mt-4"> -->
<!--                                             <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div> -->
<!--                                             <div class="ms-3"> -->
<!--                                                 <div class="fw-bold">Commenter Name2</div> -->
<!--                                                 子留言1 -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         Child comment 2 -->
<!--                                         <div class="d-flex mt-4"> -->
<!--                                             <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div> -->
<!--                                             <div class="ms-3"> -->
<!--                                                 <div class="fw-bold">Commenter Name3</div> -->
<!--                                                 子留言2 -->
<!--                                             </div> -->
<!--                                         </div> -->
                                        
                                    </div>
                                </div>
                                
                                <!-- Single comment-->
                                <div class="d-flex">
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">Commenter Name4</div>
                                        留言2
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </section>
					<!-- 留言板結束 -->
					
                </div>
            </div>
        </div>
		</div>
	</div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>

	<%@include file="../frontcommonpages/shopbottom.jsp"%>

	<script>
	$(function(){
		$("#messageText").keypress(function(e) {
	        if (event.keyCode == 13){
	            $('#messagebutton').click();
	            console.log("送出留言成功");
	        }
	        
		});
	});
	
	</script>
</body>
</html>
