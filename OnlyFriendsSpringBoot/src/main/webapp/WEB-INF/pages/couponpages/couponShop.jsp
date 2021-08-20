<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
</head>
<body>
<body class="layout-2">
	<div id="app">
		<div class="main-wrapper">

			<%@include file="../frontcommonpages/shopheader.jsp"%>

			<div class="main-sidebar">
				<aside id="sidebar-wrapper">
					<div class="card">
						<div class="card-header">
							<h4>Search by</h4>
						</div>
						<div class="card-body">
							<div class="container d-flex flex-column">
								<input name="queryVal" id="queryVal" class="form-control"
									type="search" placeholder="Search" aria-label="Search"
									data-width="250">
								<button class="btn" type="submit" id="Search">
									<i class="fas fa-search"></i>
								</button>
								<span class="badge badge-primary mb-2">Travel</span> <span
									class="badge badge-secondary mb-2">Food</span> <span
									class="badge badge-success mb-2">Sports</span> <span
									class="badge badge-danger mb-2">Accommodation</span>
							</div>
						</div>
					</div>
				</aside>
			</div>



			<!-- Main Content -->
			<div class="main-content">
				<section class="section">

					<!--  <div class="bg-dark py-5">
							<div class="container px-4 px-lg-5 my-5">
								<div class="text-center text-white">
									<h1 class="display-4 fw-bolder">Shop in style</h1>
									<p class="lead fw-normal text-white-50 mb-0">With this shop
										hompeage template</p>
								</div>
							</div>
						</div>-->

					<div id="carouselExampleInterval" class="carousel slide"
						data-bs-ride="carousel" >
						<div class="carousel-inner" style="width:100%;height:400px;margin:auto;">
							<div class="carousel-item active" data-bs-interval="10000">
								<img src="images/couponPic/1.JPG" class="d-block w-100" style="height:400px;">
							</div>
							<div class="carousel-item" data-bs-interval="2000">
								<img src="images/couponPic/ss2.JPG" class="d-block w-100" style="height:400px;">
							</div>
							<div class="carousel-item">
								<img src="images/couponPic/rr9.JPG" class="d-block w-100" style="height:400px;">
							</div>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleInterval" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>

					<div class="section-body">
						<div class="card">
							<div class="card-header">
								<h4>On Sale</h4>
							</div>
							<div class="card-body">
								<div
									class="
							            row
							            gx-4 gx-lg-5
							            row-cols-2 row-cols-md-3 row-cols-xl-4
							            justify-content-center
							          "
									id="itemarea"></div>
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

	<script>  
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
     	   type:'POST',
     	   url:'queryallcouponsbypage/' + indexPage,
     	   dataType:'JSON',
     	   contentType:'application/json',
     	   success: function(data) {
     	     var json = JSON.stringify(data, null, 3);
     	     var parsedObjinArray = JSON.parse(json);
     	     var itemarea = $('#itemarea');
     	     $('#itemarea').empty("");
     	 	 $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件
     	 		 
     	 		//if(n.category=="優惠券-旅遊" || n.category=="優惠券-美食" || n.category=="優惠券-住宿" || n.category=="優惠券-運動"){	 
     	     var item = 
     	    "<div class='col mb-5'>"+
              "<div class='card h-100'>"+           
                "<img class='card-img-top' id='couponImg' src='"+n.couponImg+"'/>"+     
                "<div class='card-body p-4'>" +
                  "<div class='text-center'>" +
                    "<h5 class='fw-bolder' id='couponName'>"+n.couponName+"</h5>"+
                    "<div class='d-flex justify-content-center small text-warning mb-2' >"+
                      "<div class='bi-star-fill'></div>"+
                      "<div class='bi-star-fill'></div>"+
                      "<div class='bi-star-fill'></div>"+
                      "<div class='bi-star-fill'></div>"+
                      "<div class='bi-star-fill'></div>"+
                   "</div>"+
                    "<span class='text-muted text-decoration-line-through' id='couponPrice'>$"+n.couponPrice+"</span>" +
                    "<span id='couponPriceDis'>$"+Math.round(n.couponPrice*0.9)+"</span>" +
                 " </div>"+
                "</div>"+
              
                "<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>"+
                  "<div class='text-center'>"+
                   "<a class='btn btn-outline-dark mt-auto' href='shopCouponItemEntry.controller?couponId="+n.couponId+"&couponName="+n.couponName+"' id='a'>Add to cart</a>"+
                  "</div>"+
                "</div>"+
              "</div>"+
            "</div>" ;
     	 		//}
            itemarea.append(item);
     	       });
  
     	},
     	error: function() {
     	    console.log("error");
     	}
     	});
     	}
    
   //寫一半
    $(function () {
  	  
    	
  		$('#Search').click(function () {
           
  			var queryVal = $('#queryVal').val();

  			 
			$.ajax({
				type:'GET',
				url:'showLikeCoupon.controller',
				data:{"queryVal":queryVal},
				dataType:'json',
				success:function(data){ 
					
					
					console.log(data);
					
					var couponVal="";
					for(let i=0;i<data.length;i++){	
						//couponVal+=data[i].couponImg;
						//couponVal+=data[i].couponName;
							//couponVal+=data[i].couponPrice;
								
						
							$('#couponImg').attr("src",data[i].couponImg);
							$('#couponName').text(data[i].couponName);
							$('#couponPrice').text("$"+data[i].couponPrice);
						    $('#couponPriceDis').text("$"+Math.round(data[i].couponPrice*0.9));
							$('#a').attr("href",'shopCouponItemEntry.controller?couponId='+data[i].couponId+'&couponName='+data[i].couponName);
							
				     }
					//$('#couponImg').attr("src",data[i].couponImg);
					//$('#couponName').text(data[i].couponName);
					//$('#couponPrice').text("$"+data[i].couponPrice);
				   // $('#couponPriceDis').text("$"+Math.round(data[i].couponPrice*0.9));
					//$('#a').attr("href",'shopCouponItemEntry.controller?couponId='+data[i].couponId+'&couponName='+data[i].couponName);
					// $('#itemarea').append(couponVal);	
					console.log(couponVal);
				},error:function(data) 
		        {
			         alert('無相關資訊');
			        }
		   
			})
  		})
  	   
     
    })


     
     </script>
</body>
</html>
