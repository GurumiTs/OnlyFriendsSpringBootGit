<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
	
<style>
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0; // remove the gap so it doesn't close
  }
.wrap {
	width: 1000px;
	height: 500px;
	background-color: black;
	margin: 0 auto;
	position: relative;
	overflow: hidden;
}

.slide-img {
	margin: 0;
	padding: 0;
	list-style: none;
	width: 4000px;
	display: flex;
	position: absolute;
	/* left: -2000px; */
}

.slide-img li {
	width: 1000px;
	height: 500px;
	/* flex-grow flex-shrink flex-bais
            伸展比例 壓縮比例 額外剩餘比例 */
	flex: 1 0 0
}

.slide-img li img {
	width: 100%;
	height: 100%;
	/* 控制元素內容調入大小 調整比例 */
	object-fit: cover;
}

.pages {
	margin: 0;
	padding: 0;
	left: 0;
	list-style: none;
	position: absolute;
	bottom: 10px;
	/* 水平排列 */
	display: flex;
	width: 100%;
	/* 置中對齊 */
	justify-content: center;
}

.pages li {
	border: 1px solid white;
	width: 30px;
	height: 10px;
	/* border-radius: 50%; */
	margin: 0 5px;
}

a.slide-arrow {
	position: absolute;
	/* background-color: red; */
	z-index: 10;
	width: 40px;
	height: 100%;
	font-size: 36px;
	display: flex;
	justify-content: center;
	align-items: center;
	color: white;
	opacity: .6;
	cursor: pointer;
}

.right {
	right: 0;
}
#container{
	padding:40px;
}
.fa-arrow-left{
	font-size:30px;
}
.fa-arrow-right{
	font-size:30px;
}
body{
	font-size:1.2rem
}


</style>
</head>
<body>
<body class="layout-2">
	<div id="app">
		<div class="main-wrapper">

			<%@include file="../frontcommonpages/shopheader.jsp"%>

			<div class="main-sidebar">
				<aside id="sidebar-wrapper mt-5">
					<div class="card">
						<div class="card-header">
							<h4>Search by</h4>
						</div>
						<div class="card-body">
							<div class="container d-flex flex-column">
								<input class="form-control" type="search" placeholder="Search"
									aria-label="Search" data-width="250">
								<button class="btn" type="submit">
									<i class="fas fa-search"></i>
								</button>
								<span class="badge badge-primary py-3" id="luckyItem" name="luckyItem" value="幸運小物類">幸運小物</span> 
								<button class="badge badge-secondary mb-2" id="candleItem" name="candleItem" value="香氛類">香氛類</button> 
								<button class="badge badge-success mb-2" id="otherItem" name="otherItem" value="其他類">其他</button> 
								
							</div>
						</div>
					</div>
				</aside>
			</div>



			<!-- Main Content -->
			<div class="main-content">
				<section class="section">
					<!-- 輪播畫面 -->
					<div id="carouselExampleIndicators" class="carousel slide h-50" data-bs-ride="carousel">
					  <div class="carousel-indicators">
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
					  </div>
					  <div class="carousel-inner h-50">
					    <div class="carousel-item active">
					      <img src="images/productPic/autumn.svg" class="d-block w-100 h-50" alt="...">
					    </div>
					    <div class="carousel-item">
					      <img src="images/productPic/member2.jpg" class="d-block w-100 h-50" alt="...">
					    </div>
					    <div class="carousel-item">
					      <img src="images/productPic/freeshipping.jpeg" class="d-block w-100 h-50" alt="...">
					    </div>
					  </div>
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
					</div>

					<div class="section-body">
						<div class="card">
							<div class="card-header">
								<h4>招桃商城</h4>
							</div>
							<div class="card-body">
								<div
									class="
							            row
							            gx-4 gx-lg-5
							            row-cols-2 row-cols-md-3 row-cols-xl-4
							            justify-content-center
							          "
									id="itemarea">
									<ul></ul>
									<ul></ul>
									<ul></ul>
									<ul></ul>
									</div>
							</div>
							<div class="card-footer bg-whitesmoke">
								<table id="showpage" class="d-flex justify-content-center">
									<tr>
										<td colspan="3" align="right"><c:forEach var="i"
												begin="1" end="${totalPages}" step="1">
												<button class="btn btn-outline-secondary" id="myPage"
													value="${i}" onclick="change(${i})">${i}</button>
											</c:forEach></td>
									</tr>
								</table>

							</div>
						</div>
					</div>
				</section>
			</div>
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
		</div>
	</div>

	<%@include file="../frontcommonpages/shopbottom.jsp"%>

<!-- <script src="/path/to/masonry.pkgd.min.js"></script> -->
	<script>  
    var indexPage = 1;
    $(function(){
    	load(indexPage);
// 		load()
    })

	function change(page){
	   indexPage = page;
	   load(indexPage);
	}
    function load(){
    	$.ajax({
    	   type:'POST',
    	   url:'shoppage.controller/' + indexPage,
    	   dataType:'JSON',
    	   contentType:'application/json',
    	   success: function(data) {
    	     var json = JSON.stringify(data, null, 4);
    	     console.log(json)
    	     var parsedObjinArray = JSON.parse(json);
    	     console.log(parsedObjinArray)
    	     var itemarea = $('#itemarea');
    	     $('#itemarea').empty("");
    	     
    	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
    	     var item = 
    	    "<div class='col mb-5 cards procards'>"+
             "<div class='card h-100'>"+          
             "<div class='badge bg-dark text-white position-absolute'style='top: 0.5rem; right: 0.5rem'>"
               +  "Sale"+
              "</div>" +    
               "<a href='shopitementrypage?proId="+n.proId+"&proName="+n.proName+"'><img class='card-img-top' src='"+n.proPhoto+"'/></a>"+     
               "<div class='card-body p-4'>" +
                 "<div class='text-center'>" +
                   "<h5 class='fw-bolder'>"+n.proName+"</h5>"+
                   "<div class='d-flex justify-content-center small text-warning mb-2' >"+
                     "<div class='bi-star-fill'></div>"+
                     "<div class='bi-star-fill'></div>"+
                     "<div class='bi-star-fill'></div>"+
                     "<div class='bi-star-fill'></div>"+
                     "<div class='bi-star-fill'></div>"+
                  "</div>"+
                   "<span class='text-muted text-decoration-line-through'>$"+n.proPrice+"</span>" +
                   "$"+Math.round(n.proPrice*0.9)+
                " </div>"+
               "</div>"+
             
               
             "</div>"+
           "</div>" ;
           if(n.proStatus!=1){
        	   console.log("hi")
          	 itemarea.append(item);       	   
  	     }
    	   });
    	    
    	},
    	error: function() {
    	    console.log("error");
    	}
    	});
    	}

//     $('.itemarea').masonry({
//         itemSelector: '.cards',  //選擇要做佈局的項目方塊
//         columnWidth: 200,        //網格對齊的寬度 
//     })
    
    
  //LuckyItem
 	$(function () {

  		$('#luckyItem').click(function () {
  		
  		var luckyItem=$('#luckyItem').val();
 		
    	$.ajax({
     	   type:'POST',
     	   url:'queryallLuckyItem',
     	   data:{"luckyItem":luckyItem},
     	   dataType:'JSON',
     	   success: function(data) {
     		   
     		   
     		 console.log(data);
     	     var json = JSON.stringify(data, null, 3);
     	     var parsedObjinArray = JSON.parse(json);
     	     var itemarea = $('#itemarea');
     	     $('#itemarea').empty("");
     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
     	     var item = 		
     	    	"<div class='col mb-5'>"+
                "<div class='card h-100'>"+          
                "<div class='badge bg-dark text-white position-absolute'style='top: 0.5rem; right: 0.5rem'>"
                  +  "Sale"+
                 "</div>" +    
                  "<a href='shopitementrypage?proId="+n.proId+"&proName="+n.proName+"'><img class='card-img-top' src='"+n.proPhoto+"'/></a>"+     
                  "<div class='card-body p-4'>" +
                    "<div class='text-center'>" +
                      "<h5 class='fw-bolder'>"+n.proName+"</h5>"+
                      "<div class='d-flex justify-content-center small text-warning mb-2' >"+
                        "<div class='bi-star-fill'></div>"+
                        "<div class='bi-star-fill'></div>"+
                        "<div class='bi-star-fill'></div>"+
                        "<div class='bi-star-fill'></div>"+
                        "<div class='bi-star-fill'></div>"+
                     "</div>"+
                      "<span class='text-muted text-decoration-line-through'>$"+n.proPrice+"</span>" +
                      "$"+Math.round(n.proPrice*0.9)+
                   " </div>"+
                  "</div>"+
                
                  
                "</div>"+
            "</div>" ;
     	 		
            itemarea.append(item);
     	       });
  
     	},
     	error: function() {
     	    console.log("error");
     	}
     	});
     	})
 	})
 	//candleItem
 	$(function () {

  		$('#candleItem').click(function () {
  		
  		var candleItem=$('#candleItem').val();
 		
    	$.ajax({
     	   type:'POST',
     	   url:'queryallcadleItem',
     	   data:{"candleItem":candleItem},
     	   dataType:'JSON',
     	   success: function(data) {
     		   
     		   
     		 console.log(data);
     	     var json = JSON.stringify(data, null, 4);
     	     var parsedObjinArray = JSON.parse(json);
     	     var itemarea = $('#itemarea');
     	     $('#itemarea').empty("");
     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
     	     var item = 		
     	    	"<div class='col mb-5'>"+
                "<div class='card h-100'>"+          
                "<div class='badge bg-dark text-white position-absolute'style='top: 0.5rem; right: 0.5rem'>"
                  +  "Sale"+
                 "</div>" +    
                  "<a href='shopitementrypage?proId="+n.proId+"&proName="+n.proName+"'><img class='card-img-top' src='"+n.proPhoto+"'/></a>"+     
                  "<div class='card-body p-4'>" +
                    "<div class='text-center'>" +
                      "<h5 class='fw-bolder'>"+n.proName+"</h5>"+
                      "<div class='d-flex justify-content-center small text-warning mb-2' >"+
                        "<div class='bi-star-fill'></div>"+
                        "<div class='bi-star-fill'></div>"+
                        "<div class='bi-star-fill'></div>"+
                        "<div class='bi-star-fill'></div>"+
                        "<div class='bi-star-fill'></div>"+
                     "</div>"+
                      "<span class='text-muted text-decoration-line-through'>$"+n.proPrice+"</span>" +
                      "$"+Math.round(n.proPrice*0.9)+
                   " </div>"+
                  "</div>"+
                
                  
                "</div>"+
            "</div>" ;
     	 		
            itemarea.append(item);
     	       });
  
     	},
     	error: function() {
     	    console.log("error");
     	}
     	});
     	})
 	})
  
 	//otherItem
 	$(function () {

  		$('#otherItem').click(function () {
  		
  		var otherItem=$('#otherItem').val();
 		
    	$.ajax({
     	   type:'POST',
     	   url:'queryallOtherItem',
     	   data:{"otherItem":otherItem},
     	   dataType:'JSON',
     	   success: function(data) {
     		   
     		   
     		 console.log(data);
     	     var json = JSON.stringify(data, null, 4);
     	     console.log(json)
     	     var parsedObjinArray = JSON.parse(json);
     	     console.log(parsedObjinArray)
     	     var itemarea = $('#itemarea');
     	     $('#itemarea').empty("");
     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
     	     var item = 		
     	    	"<div class='col mb-5'>"+
                "<div class='card h-100'>"+          
                "<div class='badge bg-dark text-white position-absolute'style='top: 0.5rem; right: 0.5rem'>"
                  +  "Sale"+
                 "</div>" +    
                  "<a href='shopitementrypage?proId="+n.proId+"&proName="+n.proName+"'><img class='card-img-top' src='"+n.proPhoto+"'/></a>"+     
                  "<div class='card-body p-4'>" +
                    "<div class='text-center'>" +
                      "<h5 class='fw-bolder'>"+n.proName+"</h5>"+
                      "<div class='d-flex justify-content-center small text-warning mb-2' >"+
                        "<div class='bi-star-fill'></div>"+
                        "<div class='bi-star-fill'></div>"+
                        "<div class='bi-star-fill'></div>"+
                        "<div class='bi-star-fill'></div>"+
                        "<div class='bi-star-fill'></div>"+
                     "</div>"+
                      "<span class='text-muted text-decoration-line-through'>$"+n.proPrice+"</span>" +
                      "$"+Math.round(n.proPrice*0.9)+
                   " </div>"+
                  "</div>"+
                
                  
                "</div>"+
            "</div>" ;
     	 		
            itemarea.append(item);
     	       });
  
     	},
     	error: function() {
     	    console.log("error");
     	}
     	});
     	})
 	})
    /*輪播*/
    
        $(function(){
            let index=0;
            let slideMove=0;
            $('#pages li').eq(0).css('background','white')
            $('#pages li').on('mouseenter',function(){
                // console.log('mouseenter')
                // 1.第一張圖移動
                // $('#slide-img').css('left','-800px')
                // 2.第N張圖移動
                // index() 索引值
                // let index=$(this).index()
                index=$(this).index()
                // console.log(index)
                // let slideMove=0-index*800;
                slideMove=0-index*800;
                $('#slide-img').css('left',slideMove)
                // 3.換頁換色
                $(this).css('background','white')
                .siblings().css('background','transparent')
            })

            // 4.左右移動
            let slideCount=$('#slide-img li').length
            // console.log(slideCount)
            $('#slideNext').on('click',function(){
                // 變數 區域>全域
                index++;
                if(index>=slideCount){
                    index=0
                }
                // slideMove=0-index*800;
                // $('#slide-img').css('left',slideMove)
                // // $(this)指向不一樣 eq()
                // $('#pages li').eq(index).css('background','white')
                // .siblings().css('background','transparent')
                moveImg()
            })
            $('#slidePrev').on('click',function(){
                index--;
                if(index<0){
                    index=slideCount-1;
                }
                // slideMove=0-index*800;
                // $('#slide-img').css('left',slideMove)
                // // $(this)指向不一樣 eq()
                // $('#pages li').eq(index).css('background','white')
                // .siblings().css('background','transparent')
                moveImg()
            })
            function moveImg(){
                slideMove=0-index*800;
                $('#slide-img').css('left',slideMove)
                // $(this)指向不一樣 eq()
                $('#pages li').eq(index).css('background','white')
                .siblings().css('background','transparent')
            }
            setInterval(autoImg,2000)
            function autoImg(){
                index++;
                if(index>=slideCount){
                    index=0
                }
                moveImg()
            }


        })
    </script>
  
</body>
</html>
