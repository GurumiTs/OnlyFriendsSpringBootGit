<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
</head>
<style>
.card1 {
	width: 400px;
	height: 180px;
	border-radius: 5px;
	box-shadow: 0 4px 6px 0 rgba(0, 0, 0, 0.5);
	background-color: #fff;
	padding: 10px 10px;
	position: relative;
	margin: 20px;
}

.card1::after {
	position: absolute;
	content: "";
	height: 40px;
	right: -20px;
	border-radius: 40px;
	z-index: 1;
	top: 70px;
	width: 40px;
}

.card1::before {
	position: absolute;
	content: "";
	height: 40px;
	left: -20px;
	border-radius: 40px;
	z-index: 1;
	top: 70px;
	width: 40px;
}

.main1 {
	display: flex;
	justify-content: space-between;
	padding: 0 10px;
	align-items: center;
	width: 100%;
	margin-top: 13px;
}

.co-img img {
	width: 30%;
}

.vertical {
	border-left: 5px dotted black;
	height: 100px;
	position: absolute;
	left: 40%;
}

.content {
	color: #565656;
	width: 70%;
	text-align: center;
}

.content h1 {
	font-size: 35px;
}

.content h1 span {
	font-size: 18px;
}

.content h2 {
	font-size: 18px;
	text-transform: uppercase;
}

.content p {
	font-size: 16px;
	color: #696969;
}

#button {
	padding-left: 7%;
	margin-buttom: 5%;
}

body {
	font-size: 1.2rem
}

#sidebar-wrapper {
	margin-top: -50%;
}
</style>
<body>
<body class="layout-2">
	<div id="app">
		<div class="main-wrapper">

			<%@include file="../frontcommonpages/shopheader.jsp"%>


			<div class="main-sidebar">
				<aside id="sidebar-wrapper">
					<%@include file="../frontcommonpages/shopsider.jsp"%>

				</aside>
			</div>



			<!-- Main Content -->
			<div class="main-content">
				<section class="section">

					<div class="section-body">
						<div class="card" style="background-color: ##FFFAF2;">
							<div>
								<!-- 	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
									<div class="container-fluid">
										<button class="navbar-toggler" type="button"
											data-bs-toggle="collapse" data-bs-target="#navbarColor01"
											aria-controls="navbarColor01" aria-expanded="false"
											aria-label="Toggle navigation">
											<span class="navbar-toggler-icon"></span>
										</button>

										<div class="collapse navbar-collapse" id="navbarColor01">
											<ul class="navbar-nav me-auto">
												<li class="nav-item"><a class="nav-link active"
													href="couponMember.controller">領取優惠券 <span
														class="visually-hidden">(current)</span>
												</a></li>
												<li class="nav-item"><a class="nav-link" href="myCouponEntry.controller"
													id="mycoupon">我的優惠券</a></li>											
											</ul>

										</div>
									</div>
								</nav>-->
								<ul class="nav nav-tabs">
									<li class="nav-item"><a class="nav-link "
										aria-current="page" href="couponMember.controller" id="money">現金券</a></li>
									<li class="nav-item"><a class="nav-link"
										href="couponMember.controller" id="discount">折扣券</a></li>
									<li class="nav-item"><a class="nav-link"
										href="couponMember.controller" id="freight">運費券</a></li>
									<li class="nav-item"><a class="nav-link" href="#"
										id="cooperate">異業券</a></li>
									<li class="nav-item"><a class="nav-link"
										href="myCouponEntry.controller" id="mycoupon">我的優惠券</a></li>

								</ul>
							</div>
							<div class="card-body ">

								<div
									class="
							            row
							            gx-4 gx-lg-5
							            row-cols-2 row-cols-md-3 row-cols-xl-4
							            justify-content-center
							          "
									id="itemarea"></div>
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
	
	 $(function () {
   
				$.ajax({
				 type:'GET',
			     url:'mycoupon.controller',
			     dataType:'JSON',     
			     contentType:'application/json',
			     success(res) {
			              var json = JSON.stringify(res, null, 3);
                          var parsedObjinArray = JSON.parse(json);
			              var itemarea = $('#itemarea');
			               $('#itemarea').empty("");
			               $.each(parsedObjinArray,function(i,n){ //i為順序 n為單筆物件			    

				               	var d=new Date();
				                let theYear = d.getFullYear();
				               	let theMonth = d.getMonth()+1 ;
				               	let theDate = d.getDate();  				               	
				                let d1=n.couponEndDate.split("-");

			            	   
				            if(d1[0]>theYear || d1[0]>=theYear && d1[1]>theMonth || d1[0]>=theYear && d1[1]==theMonth && d1[2]>=theDate)     {				            					       
   	                       var item =    
   	     	                "<div class='card1'>"+
   	                        "<div class='main1'>"+
   	                        "<div class='co-img'>"+ 
   	                        
   	                        "<img class='card-img-top'src='"+n.couponImg+"' style='width: 135px'/>"+ 
   	                        "</div>"+
   	                        "<div class='vertical'></div>"+    
   	                        "<div class='content'>" +
   	                        "<h6>序號:"+n.couponId+"</h6>"+
   	                        "<h2>"+n.couponName+"</h2>"+
   	                        "<h1><span>使用方式請詳Coupon說明</span></h1> "+
   	                        "<p>截止日:"+n.couponEndDate+"</p>"+
   	                        " </div>"+  	              	               
   	                     "</div>"+
   	                   "</div>" ;
				            }
   	                   itemarea.append(item);
   	            	       });			               			                 	         
   	            	},
   	            	error: function() {
   	            	    console.log("error");
   	            	}
			    
				})
     })
     </script>

</body>
</html>
