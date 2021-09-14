<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<link rel="canonical" href="/web/tweet-button">

<style>
body {
	font-size: 1.2rem
}

.articleimg {
	weight: 900px;
	height: 400px;
	margin: 0 auto;
}

.divSpace {
	weight: 15px;
}

.mesbutton {
	position: absolute;
	top: 23px;
	right: 30px;
}

.dropdown:hover .dropdown-menu {
	display: block;
	margin-top: 0;
	//
	remove
	the
	gap
	so
	it
	doesn't
	close
}

</style>
</head>
<body>
<body class="layout-2">

	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v11.0"
		nonce="9NU7Vr2M"></script>
	<div id="app">
		<div class="main-wrapper">

			<%@include file="../frontcommonpages/shopheader.jsp"%>

			<!-- Page content-->
			<div class="container mt-5">
				<br>
				<br>
				<br>
				<br>
				<br>
				<div class="row">
					<div class="col-lg-12 border border-secondary"
						style="background-color: #FBFBFF;">
						<!-- Post content-->
						<article>
							<!-- Post header-->
							<header class="mb-4">
								<!-- Post title-->
								<h1 class="fw-bolder mb-1">${blogUser.usersTitle}</h1>
								<!-- Post meta content-->
								<div class="text-muted fst-italic mb-2">發布時間:${fn:substring(blogUser.usersUpdateTime,0,10)}
									發文者:${blogUser.usersName}</div>
								<div class="text-muted fst-italic mb-2">瀏覽人數:${blogUser.watchNum}</div>
								<!-- Post categories-->
								<a class="badge bg-secondary text-decoration-none link-light"
									href="#!">Web Design</a> <a
									class="badge bg-secondary text-decoration-none link-light"
									href="#!">Freebies</a>
							</header>
							<!-- Preview image figure-->
							<figure class="mb-4" style="text-align: center;">
								<img class="img-fluid rounded articleimg"
									src="${blogUser.usersImages}" alt="${blogUsers.usersTitle}" />
							</figure>
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
						<div class="d-flex flex-row justify-content-start align-items-center mb-2">
							<div class="mx-3">
							<i type="button" id="thumbs" class="far fa-thumbs-up fs-3"></i>
							</div>
							<!-- Line icon -->
							<div class="line-it-button" data-lang="zh_Hant" data-type="share-b" data-ver="3" 
							data-url="http://localhost:8080/OnlyFriends/blogarticleentry?ArticleId=${blogUser.usersArticleID}&amp;name=user" 
							data-color="grey" data-size="small" data-count="false" style="display: none;"></div>
							<!-- facebook icon -->
							<div class="mx-3"
								data-href="http://localhost:8080/OnlyFriends/blogarticleentry?ArticleId=1&name=user"
								data-layout="button" data-size="small">
								<a target="_blank"
									href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Flocalhost%3A8080%2FOnlyFriends%2Fblogarticleentry%3FArticleId%3D1%26name%3Duser&amp;src=sdkpreparse"
									class="fb-xfbml-parse-ignore"><img
											src="images/smallicon/facebook.jpg" width="32px"
											height="32px"></a>
							</div>
							<!-- twitter icon -->
							<a class="twitter-share-button mx-3" href="http://localhost:8080/OnlyFriends/blogarticleentry?ArticleId=${blogUser.usersArticleID}&amp;name=user">Tweet</a>
						
						</div>
						
						<!-- Facebook 分享 -->
						<script async defer crossorigin="anonymous"
							src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v11.0"
							nonce="gYUMvjBV">
						</script>
						
						<!-- Line 分享 -->
						<script src="https://www.line-website.com/social-plugins/js/thirdparty/loader.min.js" async="async" defer="defer"></script>

						<!-- Twitter 分享 -->
						<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
						<!-- Comments section留言板-->
						<section class="mb-5">
							<div class="card " style="background-color: #F0F0F0;">
								<div class="card-body">

									<!-- Comment form 判斷是否登入，使用者或管理者登入-->
									<c:choose>
										<c:when test="${not empty member}">
											<form id="mesform" class="d-flex mb-4">
												<img class="rounded-circle" src='${personalinfo.memberPic}'
													style="weight: 50px; height: 50px; float: left;" /> &nbsp;
												&nbsp; <input id="messageText" name="messageText"
													type="text" class="form-control" placeholder="請留言">
												<button type="button" class="btn btn-primary mesbutton"
													id="mesbutton">送出</button>
											</form>
										</c:when>

										<c:when test="${not empty employee}">
											<form id="mesform" class="d-flex mb-4">
												<img class="rounded-circle" src='${personalinfo.empPic}'
													style="weight: 50px; height: 50px; float: left;" /> &nbsp;
												&nbsp; <input id="messageText" name="messageText"
													type="text" class="form-control" placeholder="請留言">
												<button type="button" class="btn btn-primary mesbutton"
													id="mesbutton">送出</button>
											</form>
										</c:when>

										<c:when test="${empty employee && empty member}">
											<div>
												<a href="http://localhost:8080/OnlyFriends/login">請登入後再留言。</a>
											</div>
											&nbsp;
											&nbsp;
										</c:when>
									</c:choose>
									<!-- 判斷結束 -->

									<!-- Single comment 第一層留言放這邊-->
									<div id="messageArea"></div>

									<!-- 設定巢狀留言的寫法(還沒做到)Comment with nested comments-->
									<!--                                 <div class="d-flex mb-4"> -->
									<!-- Parent comment-->
									<!--                                     <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div> -->
									<!--                                     <div class="ms-3"> -->
									<!--                                         <div class="fw-bold">Name1</div> -->
									<!--                                         留言1 -->

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

									<!--                                     </div> -->
									<!--                                 </div> -->
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
		var url_String = location.href;
		var url = new URL(url_String);
		var articleId = url.searchParams.get("ArticleId");
		console.log(articleId);

		$(function() {
			// 檢查點讚與否
			checklike();
			thumbs();
			message();
			$('#mesbutton').on('click', addmessage);

			$("#messageText").on('keypress', function(e) {
				if (event.keyCode == 13) {
					$('#mesbutton').on('click', addmessage);
				}
			});
			

		});
		// 確認點讚與否
		function checklike() {
			$.ajax({
				type: "GET",
				url: "checklike",
				data: {"usersArticleID": articleId},
				success : function(data) {
					console.log(data);
					if(data == "exist"){
						$("#thumbs").addClass("text-primary");						
					}
				},
				error : function(xhr) {
					console.log("error!");
				}
			});
		};
		
		// 按讚
		function thumbs() {
			$("#thumbs").on('click', function(){
				$.ajax({
					type: "GET",
					url: "bloglike",
					data: {"usersArticleID": articleId},
					success : function(data) {
						console.log(data);
						checklike();
						
					},
					error : function(xhr) {
						console.log("error!");
					}
				});
			});
		};
		
		
		// 送出留言
		function addmessage() {
			let messageText = $("#messageText").val();
			if (messageText != '') {
				$.ajax({
					type : "POST",
					url : "addMessage/" + articleId,
					data : {
						"messageText" : messageText
					},
					success : function(data) {
						console.log("留言成功");
						$("#messageText").val('');
						message();
					},
					error : function(xhr) {
						console.log("error!");
					}
				});
			}
		};

		// 查詢留言
		function message() {
			$
					.ajax({
						type : "POST",
						url : "firstmessagetojson/" + articleId,
						success : function(response) {
							var messageArea = $('#messageArea');
							$('#messageArea').empty("");
							console.log(response.length);
							if (response.length == 0) {
								var message = "<div class='d-flex'>"
										+ "<div class='ms-3'>" + "暫無資料"
										+ "</div>" + "</div>";
								messageArea.append(message);
							} else {
								$
										.each(
												response,
												function(i, n) {
													var message = "<div class='d-flex'>"
															+ "<div class='flex-shrink-0'><img class='rounded-circle' src='"+n.memberPic+"' style='weight: 50px; height: 50px'; alt='"+n.memberName+"' /></div>"
															+ "<div class='ms-3'>"
															+ "<div class='fw-bold'>"
															+ n.memberName
															+ "</div>"
															+ n.messageText
															+ "</div>"
															+ "</div>&nbsp;";
													messageArea.append(message);
												});
							}
						},
						error : function(xhr) {
							console.log("error!")
						}
					});// ajax end
		};// function end
	</script>
</body>
</html>
