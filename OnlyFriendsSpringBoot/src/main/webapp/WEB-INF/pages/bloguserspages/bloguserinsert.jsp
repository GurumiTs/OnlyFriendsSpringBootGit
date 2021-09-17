<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
<style>
body{
font-size:1.2rem
}

.box1 {
	background-color: white;
	border: 1px solid #f4f4f4;
	border-radius: 5px;
	margin: 100px;
	padding: 20px;
	display: block;
	box-shadow: 3px 3px 3px gray;
}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0; // remove the gap so it doesn't close
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
        <br>
                <!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">會員文章 - 新增</h1>
					<div class="box1">
					<form class="row" action="blogusersinsertform" method="post"
						enctype="multipart/form-data">
						<div class="col-md-12">

							<!-- 圖片 -->
							<div style="margin: auto; text-align: center">
								<img id="output" weight="100%" height="300px" /> <br>
								<hr>
							</div>

							<div class="mb-3">
								<label for="formFile" class="form-label">文章圖片:</label> <input
									class="form-control" type="file" id="formFile" name="usersImages"
									onchange="loadFile(event)">
							</div>
						</div>

						<div class="col-md-12">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">帳號</span>
								<input type="text" class="form-control" disabled="disabled"
									value="${personalinfo.memberAccount}" aria-label="Sizing example input"
									aria-describedby="basic-addon1" name="memberAccount">
								<input type="hidden" class="form-control"
									value="${personalinfo.memberAccount}" name="memberAccount">
								<span id="errorAcc"></span> 
								<span class="input-group-text" id="inputGroup-sizing-default">暱稱</span> 
								<input type="text" class="form-control" value="${personalinfo.memberName}"
									aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="usersName">
								<span id="erroruUserId"></span>
							</div>
						</div>

						<div class="col-md-12">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">標題:</span>
								<input type="text" class="form-control" id="title"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" name="usersTitle"><span
									id="errorTitle"></span>
							</div>
						</div>

						<div class="col-md-12">
							<label for="input-group-text" class="input-group-text">文章內容:</label>
							<textarea class="form-control" style="resize: none;" id="editor"
								rows="100" name="usersMainText"></textarea>
							<div id="errorMainText"></div>
						</div>
						
						<div style="margin: 10px auto; text-align: center;">
							<!-- <input type="submit" name="confirm" value="送出"> -->
							<button type="submit" class="btn btn-primary">送出</button>

							<button onclick="location.href='memberblog'"
								type="button" class="btn btn-primary">返回</button>
								
							<button type="button" id="quickvalue" class="btn btn-primary">一鍵輸入</button>
							<!--  οnclick="javascript:history.back(-1)" -->
						</div>
					</form>
					</div>
        </div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
		</div>
	</div>

	<%@include file="../frontcommonpages/shopbottom.jsp"%>

	<script type="text/javascript">
		let YourEditor;
		ClassicEditor
	      .create( document.querySelector( '#editor' ),{
	      } )
	      .then( editor =>{
	    	  window.editor = editor;
	    	  YourEditor = editor;
	      })
	  	  .catch( error => {
	    	    console.error(error);
	    } );
	
	    $(function(){
	        $("#quickvalue").click(function(){
	        	$("#title").val("「愛情，像是一起端了一碗熱湯唯有找到平衡點，兩人相處的時候才是舒服的」");
	        	YourEditor.setData("<p><i><strong>曾'R/廖'S</strong></i></p><p>&nbsp;</p><p><strong>浚享:</strong></p><p>因為第一次和女生交往，有很多不懂及憨慢的部份，特別感謝排約部Sunny姐開導、及媒合適合的配對，幫我第一次安排約會就能遇見理想對象。</p><p>想起排約第一次見面就能感受到對方很為人設想，即使我表現的笨拙仍願意附和著我，這應該是有愛的人才能有的表現吧，也是我感受最深的，雖然相處時有很多需要磨合的部份，但也是在督促著自己用心思考，在了解對方時、也摸索著溝通方式，藉著互相學習也分享生活發生的點滴，面對著自己的不完美卻讓一切變完美了。</p><p>對於女方的付出，心裡始終抱持著珍惜和感謝，從認識交往至今已快一年，建立起的默契大概就是遇到事情要一起討論、一起決定、以後也一起看漂亮的風景及分享好吃的美食，人生是兩個人一起經營、一起面對。</p><p>&nbsp;</p><p><strong>小雯:</strong></p><p>第一次看到他是戴著口罩說話感覺有點廣東腔額頭還冒汗著走進來，跟我一樣是做著類似客服的工作雖然感覺他話不多，但相處起來是個誠懇的人<br>起初在賴上話更少！讓我一度以為他對我沒興趣，後來跟戀愛顧問惠惠姐深聊之後决定再聊聊看～</p><p>有一次聊天的時候剛好遇到我人生病，他在賴上打著：想要開車帶我去看醫生怕我吹到風不舒服，當時心中有一股暖暖的風吹過讓我覺得有他真好，雖然交往的時候總是會有難過、生氣的片段，還好他很有耐心陪伴我走下去。</p><p>另外一次，是我們相約一起去吃火鍋，一踏進店内我已經感受到一陣涼意了裡面冷氣開很強我整個人開始打顫了起來，細心的他感覺到了馬上到車上拿了外套給我蓋著，這舉動著實貼心～也讓我想多加認識這個可愛的他。</p><p>彼此來自不同生活環境的兩人從相識相知到相惜，真的是要花很多時間和心力方能一起走下去，任何一種關係也只有用心對待才能維持下去。</p><p>「愛情，像是一起端了一碗熱湯唯有找到平衡點，兩人相處的時候才是舒服的」</p><p>謝謝OnlyFriends，讓我認識到現在這個他，也很感謝戀愛顧問恩恩姐在我身邊不時的給我打氣！<br>希望大家都能找到理想中的伴侶。<br>Love is the Moment</p><p><br>再次感謝OnlyFriends、Hollan哥以及恩恩姐的安排與善誘。</p>");
				console.log("123");
	        });
	    });
	
		var loadFile = function(event) {
			var output = document.getElementById('output');
			output.src = URL.createObjectURL(event.target.files[0]);
			output.onload = function() {
				URL.revokeObjectURL(output.src) // free memory
			}
		};
	</script>
</body>
</html>
