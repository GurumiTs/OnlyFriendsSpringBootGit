<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
body{
font-size:1.2rem
}

#blogimg{
weight: 600px;
height: 650px;
}

.container{
    max-width: 1450px;
}

div{
    display: block;
}
/* table */
.thead>tr{
    background-color: #97CBFF;
}
tbody{
	background-color: #ECF5FF;
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
			<div class="container mt-4">
				<br />
				<br />
				<br />
				<br />
				<br />
				<div class="row">
				
					<div class="col-lg-10">
					<!-- Blog entries-->
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link active" id="home-tab"
									data-bs-toggle="tab" data-bs-target="#home" type="button"
									role="tab" aria-controls="home" aria-selected="true">表格模式</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
									data-bs-target="#profile" type="button" role="tab"
									aria-controls="profile" aria-selected="false">圖片預覽模式</button>
							</li>
						</ul>
						<div class="tab-content" id="myTabContent">
							<!-- TABLE式 -->
							<div class="tab-pane fade show active" id="home" role="tabpanel"
								aria-labelledby="home-tab">
								<table id="example" class="table table-striped">
									<thead class="thead">
										<tr>
											<th style="color: black;">NO</th>
											<th style="color: black;">圖片</th>
											<th style="color: black;">文章標題</th>
											<th style="color: black;">作者</th>
											<th style="color: black;">日期</th>
											<th style="color: black;">人氣</th>
										</tr>
									</thead>

									<thead>
										<tr>
											<th class="d-none">NO</th>
											<th class="d-none">圖片</th>
											<th class="d-none">文章標題</th>
											<th class="d-none">作者</th>
											<th class="d-none">日期</th>
											<th class="d-none">人氣</th>
										</tr>
									</thead>
								</table>
							</div>
							<!-- 圖片式 -->
							<div class="tab-pane fade" id="profile" role="tabpanel"
								aria-labelledby="profile-tab">
<!-- 								<div class="row"> -->
									<div id="itemarea"></div>
									<!-- Nested row for non-featured blog posts -->
									<div class="card-footer bg-whitesmoke">
										<table id="showpage" class="d-flex justify-content-center">
											<tr>
												<td colspan="3" align="right"><c:forEach var="i" begin="1"
														end="${blogEmpTotalPages}" step="1">
														<button class="btn btn-outline-secondary" id="myPage"
															value="${i}" onclick="change(${i})">${i}</button>
													</c:forEach></td>
											</tr>
										</table>
									</div>
<!-- 								</div> -->
							</div>
						</div>	
					</div>
					<!-- 側邊目錄-->
					<div class="col-lg-2">
						<div class="blog-sidebar" style="background-image: url(../images/blogPic/empblog/bg_light.jpg);">
							<div class="blog-sidebar-title">目錄</div>
							<ul class="blog-sidebar-list">
								<li>
									<a href="http://localhost:8080/OnlyFriends/blogofficialmain">回主目錄</a>
								</li>
								<li>
									<a href="blogofficial?blogtype=愛情">Only 愛情篇</a>
								</li>
								<li>
									<a href="blogofficial?blogtype=星座">Only 星座篇</a>
								</li>
								<li>
									<a href="blogofficial?blogtype=新聞">Only 新聞篇</a>
								</li>
								<li>
									<a href="blogofficial?blogtype=Beauty">Only Beauty篇</a>
								</li>
								<li>
									<a href="blogofficial?blogtype=心跳">Only 心測篇</a>
								</li>
								<li>
									<a href="blogofficial?blogtype=其他">Only 其他</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div id="footdiv"></div>
			</div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
		</div>
	</div>
	<%@include file="../frontcommonpages/shopbottom.jsp"%>

	<script>
		$(function() {	
			load(indexPage);
		});
		var url_String = location.href;
		var url = new URL(url_String);
		var blogtype = url.searchParams.get("blogtype");
		console.log(blogtype);
		let i = 0;
		var table = $('#example').DataTable(
		{
			"searching": false,
	        "paging": false,
	        "ordering": false,
	        "info": false,
	        "autoWidth": false,
	        "targets": 0,
	        "scrollX": false,
	        ajax: {
	        	"type": "POST",
	        	"url": "blogtypejson",
	        	"data": {"blogtype": blogtype},
	        },
		    columns: [
	        	{ "data": null,
	        		render:function(data, type, row)
	        		{
	        			console.log(i)
	        			i++;
	        			return i;
	        		}
	        	},
		       	{ "data": "images" },
		       	{ 
		       		"data": "title",
// 		       		render:function(data, type, row)
// 		       		{
// 	        			if (data) {
// 		        			return data.title+"<br/>"+
// 		        			data.substring(0, 50)+"...";
// 		        		} else {
// 		        			return '';
// 			       		}
// 		       		}
		       	},
	        	{ "data": "userID" },
	        	{ "data": "updateTime" },
		       	{ "data": "watchNum" },
	        ]
	        ,language: {
		    	"lengthMenu": "顯示 _MENU_ 筆資料",
		    	"sProcessing": "處理中...",
		    	"sSearch": "搜尋:",
		    	"sEmptyTable": "目前無此分類的文章。",
		    	"sLoadingRecords": "載入資料中...",
		    	"oPaginate": {
		 	    	"sFirst": "首頁",
	   	     	    "sPrevious": "上一頁",
			        "sNext": "下一頁",
				    "sLast": "末頁",
			    },
		    },
		    columnDefs:[
		    	
		    ]
		});
		table.on('order.dt search.dt', function () {
			table.column(0, {search:'applied', order:'applied'}).nodes().each(
		    function (cell, i) {
		    	cell.innerHTML = i+1;
		    });
		}).draw();
		
		
		var indexPage = 1;
	
		function change(page) {
			indexPage = page;
			load(indexPage);
		}
						
		function load(){
			$.ajax({
				type: 'POST',
				url: 'empblogallbypage/' + indexPage,
				data: {"blogtype": blogtype},
				success: function(data) {
					var json = JSON.stringify(data, null, 4);
					var parsedObjinArray = JSON.parse(json);
					var itemarea = $('#itemarea');
					if(data.length == 0){
						$('#itemarea').empty("");
						var item = 
							"<div class='col-lg-6'>目前暫無"+blogtype+"分類文章。</div>";
						itemarea.append(item);
						$('#footdiv').css("height", "550px");
					}else{
						console.log(data);
						$('#itemarea').empty("");
						$.each(parsedObjinArray, function(i,n){
						var item = 
							"<div class='row-lg-4'>"+
								"<div class='card mb-4'>"+
									"<a href='blogarticleentry?ArticleId="+n.articleID+"&name=official'><img id='blogimg' class='card-img-top'"+
										"src='"+n.images+"'/></a>"+
									"<div class='card-body'>"+
									"<div class='small text-muted'><i class='fas fa-eye'>人氣:"+n.watchNum+"</i></div>"+
										"<div class='small text-muted'>"+n.updateTime.substr(0,10)+"</div>"+
										"<h2 class='card-title h1' style='font-weight:bold'>"+n.title+"</h2><br/"+	
										"<p class='card-text'>"+n.mainText.substr(0,250)+"  ...</p>"+
										"<a class='btn btn-primary' href='blogarticleentry?ArticleId="+n.articleID+"&name=official'>Read more →</a>"+
									"</div>"+
								"</div>"+
							"</div>";
						itemarea.append(item);
						});
					}
				},
				error: function() {
					console.log("error!");
				}
			});
		};
						
	</script>

</body>
</html>
