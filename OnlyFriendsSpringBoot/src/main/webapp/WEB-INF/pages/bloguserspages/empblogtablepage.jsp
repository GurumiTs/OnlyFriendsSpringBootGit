<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
body{
font-size:1.2rem;
}

#blogimg{
weight: 700px;
height: 350px;
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
    background-image: url(../images/blogPic/empblog/bg_light.jpg);
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
				<input type="hidden" id="number" value="${number}"/>
				<div class="row">
					<!-- Table-->
					<div class="col-lg-10">
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
					
					<!-- 側邊目錄-->
					<div class="col-lg-2">
						<div class="blog-sidebar">
							<div class="blog-sidebar-title">目錄</div>
							<ul class="blog-sidebar-list">
								<li>
									<a href="http://localhost:8080/OnlyFriends/blogofficialmain">回主目錄</a>
								</li>
								<li>
									<a href="http://localhost:8080/OnlyFriends/blogtypeofficial/1">Only 愛情篇</a>
								</li>
								<li>
									<a href="http://localhost:8080/OnlyFriends/blogtypeofficial/2">Only 星座篇</a>
								</li>
								<li>
									<a href="http://localhost:8080/OnlyFriends/blogtypeofficial/3">Only 新聞篇</a>
								</li>
								<li>
									<a href="http://localhost:8080/OnlyFriends/blogtypeofficial/4">Only Beauty篇</a>
								</li>
								<li>
									<a href="http://localhost:8080/OnlyFriends/blogtypeofficial/5">Only 心測篇</a>
								</li>
								<li>
									<a href="http://localhost:8080/OnlyFriends/blogtypeofficial/6">Only 其他</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div style="height: 300px;"></div>
			</div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
		</div>
	</div>
	<%@include file="../frontcommonpages/shopbottom.jsp"%>

	<script>
		var url_String = location.href;
		var url = new URL(url_String);
		var number = url.pathname.split("/");
		console.log(number[3]);
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
	        	"url": "blogtypejson",
	        	"data": number[3],
	        },
	        columns: [
	        	{ "data": null },
	        	{ "data": "images" },
	        	{ 
	        		"data": "mainText",
	        		render:function(data, type, row)
	        		{
	        			if (data) {
		        			return data.title+"<br/>"+
		        			(data.length > 50)?data.substring(0, 50)+"...":data;
		        		} else {
		        			return '';
		        		}
	        		}
	        	},
	        	{ "data": "userID" },
	        	{ "data": "updateTime" },
	        	{ "data": "watchNum" },
	        ],
	        ,language: {
		    	"lengthMenu": "顯示 _MENU_ 筆資料",
		    	"sProcessing": "處理中...",
		    	"sSearch": "搜尋:",
		    	"sLoadingRecords": "載入資料中...",
		    	"oPaginate": {
		            "sFirst": "首頁",
		            "sPrevious": "上一頁",
		            "sNext": "下一頁",
		            "sLast": "末頁"
		         },
		    },
	        columnDefs: [{
	        	
	        }],
	    });
		table.on('order.dt search.dt', function () {
            table.column(0, {search:'applied', order:'applied'}).nodes().each(
               function (cell, i) {
                cell.innerHTML = i+1;
              }
            );
        }).draw();
		
// 		function queryBlogType(number){
// 			$.ajax({
// 				type: "POST",
// 	            url: "blogtypejson",
// 	            data: {"number": number},
// 	            success: function(data){
// 	            	console.log("查詢成功:"+number);
// 					var tablearea = $('#tablearea');
// 					$('#tablearea').empty("");
// 	            	if(data.length == 0){
// 	            		var table =
// 		            		"<tr>"+
// 						      "<th scope='row'></th>"+
// 						      "<th></th>"+
// 						      "<td></td>"+
// 						      "<td>此分類目前暫無文章</td>"+
// 						      "<td></td>"+
// 						      "<td></td>"+
// 						    "</tr>";
// 						tablearea.append(table);
// 	            	}else{
// 	            		$.each(response, function(i,n){
// 	            			var table =
// 			            		"<tr>"+
// 							      "<th scope='row'>i</th>"+
// 							      "<th>"+n.images+"</th>"+
// 							      "<td>"+n.title+
// 							      n.MainText.substr(0,90)+"</td>"+
// 							      "<td>"+n.title+"</td>"+
// 							      "<td>"+n.title+"</td>"+
// 							      "<td>"+n.title+"</td>"+
// 							    "</tr>";
// 							tablearea.append(table);
// 	            		});
// 	            	}
// 	            },
// 	            error: function(xhr){
// 	            	console.log("error!")
// 	            }
// 			});
// 		};
	</script>

</body>
</html>
