<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>

<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>
<style>
body{
font-size:1.2rem
}

</style>
 </head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@include file="../commonpages/dashboardsidebar.jsp"%>


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@include file="../commonpages/dashboardheader.jsp"%>

				<!-- Begin Page Content -->
				<div class="container-fluid">

<!-- ************************** your content*************************** -->		
		
        <div class="container">
            <form action="empofficialActiveInsert.controller" method="post"  enctype="multipart/form-data">

<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label"></label>
  <input type="text" class="form-control"  placeholder="請輸入管理者編號" name="empAcc" id = "empAcc">
</div>


<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label"></label>
  <input type="text" class="form-control"  placeholder="請輸入管理者姓名" name="aname" id= "aname">
</div>


<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label"></label>
  <input type="text" class="form-control"  placeholder="活動名稱" name="active" id = "active">
</div>
           
                <div>
                    
                        <label class="my-1 mr-2" for="inlineFormCustomSelectPref">請選擇活動類型(1)</label><br>
                        <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" name="atype">
                      
                      <option value="多人團體活動#戶外">多人團體活動#戶外</option>
                      <option value="多人團體活動#室內">多人團體活動#室內</option>
                      <option value="一對一活動#戶外">一對一活動#戶外</option>
                      <option value="一對一活動#室內">一對一活動#室內</option>
                    </select>
                </div>
                <div>
                 <br>
                 <br>
                    <lebel> 請選擇活動類型2(多選):<br><br>
                  
                        <input type="checkbox" name="atype2" value="浪漫">浪漫
                        <input type="checkbox" name="atype2" value="賞景">賞景
                        <input type="checkbox" name="atype2" value="郊遊">郊遊
                        <input type="checkbox" name="atype2" value="談心">談心
                        <input type="checkbox" name="atype2" value="配對">配對
                        <input type="checkbox" name="atype2" value="閒聊">閒聊
                    </lebel>

                    <div>
                        <input type="checkbox" name="atype2" value="冒險">冒險
                        <input type="checkbox" name="atype2" value="High起來">High起來
                        <input type="checkbox" name="atype2" value="攝影">攝影
                        <input type="checkbox" name="atype2" value="運動">運動
                        <input type="checkbox" name="atype2" value="遊戲">遊戲
                        <input type="checkbox" name="atype2" value="其它">其它

                    </div>
                    <br>

                    <div>

                        <input id="male" type="text" name="male" size=20 placeholder="輸入參加男性人數 "> <input type="text" id="female" name="female" size=20  placeholder="輸入參加女性人數 "> 
                    </div>
                  <br>

                </div>
                <div>
                    <lebel> 活動日期:<input type="date" name="adate" id="adate"></lebel>
                </div>
                <br>

                <div>
                    <label>活動報名日期:<input type="date" name="startDeadline" id="startDeadline">~<input type="date" name="finishDeadline" id="finishDeadline"></label>
                </div>

                <div>
                    活動地點:
                    <div id="twzipcode"></div>
                </div>  
				<div class="mb-3">
				  <label for="exampleFormControlInput1" class="form-label"></label>
				  <input type="text" class="form-control"  placeholder="活動地址" name="address" id = "address">
				</div>
                
                <br> 活動圖片上傳
                <div class="">
                <img id="output" src=" " alt=""><br>

              </div>
                <div class=" mb-2">
                    <input type="file" class="form-control" id="activeFile" name="activeFile"  multiple onchange="lovdFile(event)">
                
                </div>


                <div>
                    <label>活動內容說明(500字內)</label>
                    <br>
                    <textarea  id="editor" name="conditions" cols="100" rows="15" placeholder="請輸入活動內容"></textarea>
                    <br>

                    <button type="submit" class="btn btn-lg btn-primary">確認送出</button>
                    <button onclick="location.href='empofficialactivemgmt.controller'"
								type="button" class="btn btn-lg btn-primary">返回</button>
					<button type="button" id="autoinsert" class="btn btn-dark">一鍵輸入</button>
                </div>

							<script>
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
				            	  
				        	
				        	
				        	
				        	
				  		</script>

						</form>
        </div>
				
				
				


<!-- **************************end of your content*************************** -->
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<%@include file="../commonpages/dashboardfooter.jsp"%>

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<%@include file="../commonpages/dashboardlogoutmodal.jsp"%>
	



	<!-- bottom here -->
	<%@include file="../commonpages/dashboardbottom.jsp"%>

	
            <script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
                    
                    <script>
                    $(function(){
                    	 $("#twzipcode").twzipcode({
                            zipcodeIntoDistrict: true,
                        });
                    })
                    
                    
                    $(function(){		
                    	
						$("#autoinsert").click(function(){
							$("#empAcc").val("60021");
							$("#aname").val("Regan");
							$("#active").val("樂天女孩應援團");
							$("#inlineFormCustomSelectPref").val("多人團體活動#戶外");
					
							$("#twzipcode").twzipcode("set", {
								county : "桃園市",
								district : "中壢區",
							});
							
							$("#male").val("12");
							$("#female").val("12");
							$("#adate").val("2021-09-24");
							$("#startDeadline").val("2021-09-17");
							$("#finishDeadline").val("2021-09-20");
							$("#address").val("領航北路一段1號");							
							YourEditor.setData('希望喜歡棒球、喜歡樂天女孩的朋友，一起到球場幫樂天加油!');
							
				        
							
							
							
							
						});
						
	});
                    
                    
                    
                               // 照片顯示
   					var lovdFile = function (event) {
      					var output = document.getElementById('output');
     					 	output.src = URL.createObjectURL(event.target.files[0]);
      						output.onload = function () {
        					URL.revokeObjectURL(output.src)
     						 }
   					 }
    				// 照片欄位判定
    				document.getElementById("cover").addEventListener("blur", checkcover);

   						function checkcover() {
     						let cover = document.getElementById("cover");
      						let coverVal = cover.value;
						    let sp_cover = document.getElementById("sp_cover");
						    let coverCheck = /\.jpg$/;
						    	if (coverVal == "") sp_cover.innerHTML = "請上傳照片";
						      		else if (coverCheck.test(coverVal) == false)
						        		sp_cover.innerHTML = "僅支援 .jpg 檔案"
						      		else sp_cover.innerHTML = "成功"
						    }
   						
   						
   						$(function(){
   				            $("#inlineFormCustomSelectPref").val(active.getAtype1)
   				            
   				        })
   				        	$(function(){
   				            $("#inlineFormCustomSelectPref").val(active.getAtype1)
   				            
   				        })
   						
   						
                    </script>
                       
                  
                       
                       


 </body>
</html>	
	
