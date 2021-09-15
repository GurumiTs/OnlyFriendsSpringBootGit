<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
body{
font-size:1.2rem
}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0; // remove the gap so it doesn't close
 }
.img1 {
	weight: 456.89px;
	height: 250px;
}
.text{
text-align: center;

}

.wrap {
	width: 800px;
	height: 400px;
	background-color: black;
	margin: 0 auto;
	position: relative;
	overflow: hidden;
}

.slide-img {
	margin: 0;
	padding: 0;
	list-style: none;
	width: 3200px;
	display: flex;
	position: absolute;
	/* left: -2000px; */
}

.slide-img li {
	width: 800px;
	height: 400px;
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
</style>
</head>
<body>
<body class="layout-2">
	<div id="app">
		<div class="main-wrapper">

			<%@include file="../frontcommonpages/shopheader.jsp"%>
			
		
			
			
			
			<!-- Main Content -->
			
			
			
			
			<div class="main-content">
			
				<section class="section">
						<div id="container">
						<div class="wrap">
							<a class="slide-arrow" id="slidePrev"> <i
								class="fas fa-arrow-left"></i>
							</a> <a class="slide-arrow right" id="slideNext"><i
								class="fas fa-arrow-right"></i> </a>
							<ul class="slide-img" id="slide-img">
								<li><img src="images/officialActivePic/野餐.jpg" alt="view1"></li>
								<li><img src="images/officialActivePic/tablegame2.jpg" alt="view2"></li>
								<li><img src="images/officialActivePic/粉紅泡泡妹仔3.jpg" alt="view3"></li>
								<li><img src="images/officialActivePic/清純妹仔.jpg" alt="view4"></li>
							</ul>
							<ul class="pages" id="pages">
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</div>
					</div>
						
					
					<div class="section-body">
						<div class="card">
							<div class="card-header">							
							</div>
							<div class="card-body">
					<!-- 分頁顯示 -->		
							<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
									
									  <li class="nav-item" role="presentation">
									    <button class="nav-link active" id="atypeall" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">全部活動</button>
									  </li>
									   <li class="nav-item" role="presentation">
									    <button class="nav-link" id="atype11" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">多人團體活動#室外</button>
									  </li>
									  
									  <li class="nav-item" role="presentation">
									    <button class="nav-link" id="atype12" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">多人團體活動#室內</button>
									  </li>
									  <li class="nav-item" role="presentation">
									    <button class="nav-link" id="atype13" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">一對一活動#戶外</button>
									  </li>
									  <li class="nav-item" role="presentation">
									    <button class="nav-link" id="atype14" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">一對一活動#室內</button>
									  </li>
									</ul>
									<div class="tab-content" id="pills-tabContent">
									  	  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab"></div>
									  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab"></div>
									  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab"></div>
									  <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab"></div>
									  <div class="tab-pane fade" id="pills-contact1" role="tabpanel" aria-labelledby="pills-contact-tab"></div>
									</div>
									
								
								
								<div
							          class="
							            row
							            gx-4 gx-lg-5
							            row-cols-2 row-cols-md-3 row-cols-xl-3
							            justify-content-center
							          "
							          id="itemarea"
							        >    
							        
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

  <script >  
  
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
  
  
    var indexPage = 1;
    $(function(){
    	load(indexPage);
    })

	function change(page){
	   indexPage = page;
	   load(indexPage);
	}
    function load(){
    	$.ajax({
    	   type:'post',
    	   url:'queryalloabypage/' + indexPage,
    	   dataType:'JSON',
    	   contentType:'application/json',
    	   success: function(data) {
    	     var json = JSON.stringify(data, null, 2);
    	     var parsedObjinArray = JSON.parse(json);
    	     var itemarea = $('#itemarea');
    	     $('#itemarea').empty("");
    	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
    	     var item = 
    	    "<div class='col mb-5'>"+
    	           "<div class='card h-100'>"+          
    	           "<div class='badge bg-danger text-white position-absolute'style='top: 0.5rem; left:0.5rem'>"
    	             +n.atype+
    	       "</div>" +       
               "<img class='img1' src='"+n.img+"'/>"+               
               "<h5 class='text'>"+n.active+"</h6>"+ 
               "<div  class='text' style ='font-size: 15px';>"+n.atype2+
               "<div  class='text' style ='font-size: 15px';>"+n.county+n.district+
               "<div  class='text' style ='font-size: 15px';>"+"📆 活動日期:"+n.adate+
               "<div  class='text' style ='font-size: 15px';>"+"📆 報名截止日期:"+n.finishDeadline+
               "<div  class='text' style ='font-size: 15px';>"+"💏 男生人數:"+n.male+"    "+"女生人數:"+n.female+
                 "<div class='text-center'>" +
                   "<div class='d-flex justify-content-center small text-warning mb-2' >"+
                  "</div>"+
                " </div>"+
               "</div>"+
             
               "<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>"+
                 "<div class='text-center'>"+
                  "<a class='btn btn-outline-dark mt-auto' href='oaitemEntry.controller?anum="+n.anum+"&active="+n.active+"' id='a'>詳細內容...</a>"+
                 "</div>"+
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
    }
//分類1
        $(function () {
              $('#atype11').click(function(){
    	
            	  
        	$.ajax({
        	   type:'POST',
        	   url:'findbyatype1',
        	   dataType:'JSON',
        	   contentType:'application/json',
        	   success: function(data) {
        		   
        	     var json = JSON.stringify(data, null, 2);
        	     var parsedObjinArray = JSON.parse(json);
        	     var itemarea = $('#itemarea');
        	     $('#itemarea').empty("");
        	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
        	     var item = 
        	    "<div class='col mb-5'>"+
        	           "<div class='card h-100'>"+          
        	           "<div class='badge bg-danger text-white position-absolute'style='top: 0.5rem; left:0.5rem'>"
        	             +n.atype+
        	       "</div>" +       
                   "<img class='img1' src='"+n.img+"'/>"+               
                   "<h5 class='text'>"+n.active+"</h6>"+ 
                   "<div  class='text' style ='font-size: 15px';>"+n.atype2+
                   "<div  class='text' style ='font-size: 15px';>"+n.county+n.district+
                   "<div  class='text' style ='font-size: 15px';>"+"📆 活動日期:"+n.adate+
                   "<div  class='text' style ='font-size: 15px';>"+"📆 報名截止日期:"+n.finishDeadline+
                   "<div  class='text' style ='font-size: 15px';>"+"💏 男生人數:"+n.male+"    "+"女生人數:"+n.female+
                     "<div class='text-center'>" +
                       "<div class='d-flex justify-content-center small text-warning mb-2' >"+
                      "</div>"+
                    " </div>"+
                   "</div>"+
                 
                   "<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>"+
                     "<div class='text-center'>"+
                      "<a class='btn btn-outline-dark mt-auto' href='oaitemEntry.controller?anum="+n.anum+"&active="+n.active+"' id='a'>詳細內容...</a>"+
                     "</div>"+
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
    	})//分類1結尾
    	//分類2
        $(function () {
              $('#atype12').click(function(){
    	
            	  
        	$.ajax({
        	   type:'POST',
        	   url:'findbyatype2',
        	   dataType:'JSON',
        	   contentType:'application/json',
        	   success: function(data) {
        		   
        	     var json = JSON.stringify(data, null, 2);
        	     var parsedObjinArray = JSON.parse(json);
        	     var itemarea = $('#itemarea');
        	     $('#itemarea').empty("");
        	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
        	     var item = 
        	    "<div class='col mb-5'>"+
        	           "<div class='card h-100'>"+          
        	           "<div class='badge bg-danger text-white position-absolute'style='top: 0.5rem; left:0.5rem'>"
        	             +n.atype+
        	       "</div>" +       
                   "<img class='img1' src='"+n.img+"'/>"+               
                   "<h5 class='text'>"+n.active+"</h6>"+ 
                   "<div  class='text' style ='font-size: 15px';>"+n.atype2+
                   "<div  class='text' style ='font-size: 15px';>"+n.county+n.district+
                   "<div  class='text' style ='font-size: 15px';>"+"📆 活動日期:"+n.adate+
                   "<div  class='text' style ='font-size: 15px';>"+"📆 報名截止日期:"+n.finishDeadline+
                   "<div  class='text' style ='font-size: 15px';>"+"💏 男生人數:"+n.male+"    "+"女生人數:"+n.female+
                     "<div class='text-center'>" +
                       "<div class='d-flex justify-content-center small text-warning mb-2' >"+
                      "</div>"+
                    " </div>"+
                   "</div>"+
                 
                   "<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>"+
                     "<div class='text-center'>"+
                      "<a class='btn btn-outline-dark mt-auto' href='oaitemEntry.controller?anum="+n.anum+"&active="+n.active+"' id='a'>詳細內容...</a>"+
                     "</div>"+
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
    	})//分類2結尾
    	//分類3
        $(function () {
              $('#atype13').click(function(){
    	
            	  
        	$.ajax({
        	   type:'POST',
        	   url:'findbyatype3',
        	   dataType:'JSON',
        	   contentType:'application/json',
        	   success: function(data) {
        		   
        	     var json = JSON.stringify(data, null, 2);
        	     var parsedObjinArray = JSON.parse(json);
        	     var itemarea = $('#itemarea');
        	     $('#itemarea').empty("");
        	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
        	     var item = 
        	    "<div class='col mb-5'>"+
        	           "<div class='card h-100'>"+          
        	           "<div class='badge bg-danger text-white position-absolute'style='top: 0.5rem; left:0.5rem'>"
        	             +n.atype+
        	       "</div>" +       
                   "<img class='img1' src='"+n.img+"'/>"+               
                   "<h5 class='text'>"+n.active+"</h6>"+ 
                   "<div  class='text' style ='font-size: 15px';>"+n.atype2+
                   "<div  class='text' style ='font-size: 15px';>"+n.county+n.district+
                   "<div  class='text' style ='font-size: 15px';>"+"📆 活動日期:"+n.adate+
                   "<div  class='text' style ='font-size: 15px';>"+"📆 報名截止日期:"+n.finishDeadline+
                   "<div  class='text' style ='font-size: 15px';>"+"💏 男生人數:"+n.male+"    "+"女生人數:"+n.female+
                     "<div class='text-center'>" +
                       "<div class='d-flex justify-content-center small text-warning mb-2' >"+
                      "</div>"+
                    " </div>"+
                   "</div>"+
                 
                   "<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>"+
                     "<div class='text-center'>"+
                      "<a class='btn btn-outline-dark mt-auto' href='oaitemEntry.controller?anum="+n.anum+"&active="+n.active+"' id='a'>詳細內容...</a>"+
                     "</div>"+
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
    	})//分類3結尾
    	//分類4
        $(function () {
              $('#atype14').click(function(){
    	
            	  
        	$.ajax({
        	   type:'POST',
        	   url:'findbyatype4',
        	   dataType:'JSON',
        	   contentType:'application/json',
        	   success: function(data) {
        		   
        	     var json = JSON.stringify(data, null, 2);
        	     var parsedObjinArray = JSON.parse(json);
        	     var itemarea = $('#itemarea');
        	     $('#itemarea').empty("");
        	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
        	     var item = 
        	    "<div class='col mb-5'>"+
        	           "<div class='card h-100'>"+          
        	           "<div class='badge bg-danger text-white position-absolute'style='top: 0.5rem; left:0.5rem'>"
        	             +n.atype+
        	       "</div>" +       
                   "<img class='img1' src='"+n.img+"'/>"+               
                   "<h5 class='text'>"+n.active+"</h6>"+ 
                   "<div  class='text' style ='font-size: 15px';>"+n.atype2+
                   "<div  class='text' style ='font-size: 15px';>"+n.county+n.district+
                   "<div  class='text' style ='font-size: 15px';>"+"📆 活動日期:"+n.adate+
                   "<div  class='text' style ='font-size: 15px';>"+"📆 報名截止日期:"+n.finishDeadline+
                   "<div  class='text' style ='font-size: 15px';>"+"💏 男生人數:"+n.male+"    "+"女生人數:"+n.female+
                     "<div class='text-center'>" +
                       "<div class='d-flex justify-content-center small text-warning mb-2' >"+
                      "</div>"+
                    " </div>"+
                   "</div>"+
                 
                   "<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>"+
                     "<div class='text-center'>"+
                      "<a class='btn btn-outline-dark mt-auto' href='oaitemEntry.controller?anum="+n.anum+"&active="+n.active+"' id='a'>詳細內容...</a>"+
                     "</div>"+
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
    	})//分類4結尾
    	  $(function () {
              $('#atypeall').click(function(){
    	
            	  
        	$.ajax({
        	   type:'POST',
        	   url:'queryalloabypage/' + indexPage,
        	   dataType:'JSON',
        	   contentType:'application/json',
        	   success: function(data) {
        		   
        	     var json = JSON.stringify(data, null, 2);
        	     var parsedObjinArray = JSON.parse(json);
        	     var itemarea = $('#itemarea');
        	     $('#itemarea').empty("");
        	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
        	     var item = 
        	    "<div class='col mb-5'>"+
        	           "<div class='card h-100'>"+          
        	           "<div class='badge bg-danger text-white position-absolute'style='top: 0.5rem; left:0.5rem'>"
        	             +n.atype+
        	       "</div>" +       
                   "<img class='img1' src='"+n.img+"'/>"+               
                   "<h5 class='text'>"+n.active+"</h6>"+ 
                   "<div  class='text' style ='font-size: 15px';>"+n.atype2+
                   "<div  class='text' style ='font-size: 15px';>"+n.county+n.district+
                   "<div  class='text' style ='font-size: 15px';>"+"📆 活動日期:"+n.adate+
                   "<div  class='text' style ='font-size: 15px';>"+"📆 報名截止日期:"+n.finishDeadline+
                   "<div  class='text' style ='font-size: 15px';>"+"💏 男生人數:"+n.male+"    "+"女生人數:"+n.female+
                     "<div class='text-center'>" +
                       "<div class='d-flex justify-content-center small text-warning mb-2' >"+
                      "</div>"+
                    " </div>"+
                   "</div>"+
                 
                   "<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>"+
                     "<div class='text-center'>"+
                      "<a class='btn btn-outline-dark mt-auto' href='oaitemEntry.controller?anum="+n.anum+"&active="+n.active+"' id='a'>詳細內容...</a>"+
                     "</div>"+
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
    	})//分類1結尾
    	
    
    </script>
</body>
</html>
