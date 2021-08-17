 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!doctype html>
    <html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

        <title>建立活動</title>
    </head>
    <style>
        .jumbotron {
            background: url(img/野餐.jpg) no-repeat center center / cover;
        }
        
        textarea {
            resize: none;
        }
    </style>



    <body>



        <div class="container-fluid">

        </div>

        <!-- 版頭 -->
        <nav class="sticky-top navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Dropdown
              </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>


        <!-- 版頭下面 -->

        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class="display-4" style="color: #FF359A;">OnlyFriends</h1>
                <p class="lead" style="color: #FF359A;">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
            </div>
        </div>




        <div class="container">
            <form action="empofficialActiveInsert.controller" method="post"  enctype="multipart/form-data">


                <div>
                    <lebel>請輸入管理者編號:<input type="text" name="empAcc" size="20" placeholder="請輸入管理者編號"></lebel>


                </div>

                <div>
                    請輸入管理者姓名:<input type="text" name="aname" size=5>
                </div>


                <div>
                    <lebel>請輸入活動名稱:<input type="text" name="active" size="20" placeholder="請輸入活動名稱">(15字以內)</lebel>

                </div>
                <div>
                    
                        <label class="my-1 mr-2" for="inlineFormCustomSelectPref">請選擇活動類型(1)</label>
                        <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" name="atype">
                      
                      <option value="1">多人團體活動#戶外</option>
                      <option value="2">多人團體活動#室內</option>
                      <option value="3">一對一活動#戶外</option>
                      <option value="4">一對一活動#室內</option>
                    </select>
                </div>
                <div>
                    <lebel> 請選擇活動類型2(多選):<br>
                        <input type="checkbox" name="atype2" value="rom">浪漫
                        <input type="checkbox" name="atype2" value="view">賞景
                        <input type="checkbox" name="atype2" value="travl">郊遊
                        <input type="checkbox" name="atype2" value="heart">談心
                        <input type="checkbox" name="atype2" value="pair">配對
                        <input type="checkbox" name="atype2" value="talk">閒聊
                    </lebel>

                    <div>
                        <input type="checkbox" name="atype2" value="adventure">冒險
                        <input type="checkbox" name="atype2" value="high">High起來
                        <input type="checkbox" name="atype2" value="photo">攝影
                        <input type="checkbox" name="atype2" value="sport">運動
                        <input type="checkbox" name="atype2" value="game">遊戲
                        <input type="checkbox" name="atype2" value="other">其它

                    </div>
                    <br>

                    <div>

                        <input type="text" name="male" size=5> 輸入參加男性人數
                    </div>
                    <br>
                    <div>
                        <input type="text" name="female" size=5> 輸入參加女性人數
                    </div>


                </div>
                <div>
                    <lebel> 活動日期:<input type="date" name="adate"></lebel>
                </div>
                <br>

                <div>
                    <label>活動報名日期:<input type="date" name="startDeadline">~<input type="date" name="finishDeadline"></label>
                </div>

                <div>
                    活動地點:
                    <div id="twzipcode"></div>
                </div>
                <br> 活動圖片上傳
                <div class=" mb-2">
                    <input type="file" class="form-control" id="activeFile" name="activeFile"  multiple onchange="lovdFile(event)">
                
                <div class="">
                <img id="output" src=" " alt=""><br>

              </div>
                </div>


                <div>
                    <label>活動內容說明(500字內)</label>
                    <br>
                    <textarea name="conditions" cols="100" rows="15" placeholder="請輸入活動內容"></textarea>
                    <br>

                    <button type="submit" class="btn btn-lg btn-primary">確認送出</button>
                    <button type="button" class="btn btn-secondary btn-lg" disabled>取消</button>
                </div>


        </form>
        </div>
        <!-- 頁尾 -->
        <div class="bottom-0 end-0 container-fluid main-footer text-center">
            &copy; copyright
        </div>






        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    -->
    		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
                    
                    <script>
                    $(function(){
                    	 $("#twzipcode").twzipcode({
                            zipcodeIntoDistrict: true,
                        });
                    })
                    
                    
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