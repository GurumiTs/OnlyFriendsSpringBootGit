<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<title>Coupon</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
#all {
	width: 60%;
	border: 3px solid #555;
	margin: 10px auto 0 auto;
	padding: 20px;
}

#top {
	padding: 0 25% 0 25%;
}

.p {
	word-wrap: break-word;
	border-bottom:1px solid #555;
}

.a {
	width: 250px;
	padding-left: 80px;
}

#button {
	text-align:center;
}


</style>

</head>
<body>
	<%@include file="../commonpages/dashboardtop.jsp"%>

	<div id="wrapper">
		<%@include file="../commonpages/dashboardsidebar.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<%@include file="../commonpages/dashboardheader.jsp"%>

			<div id="all" class="container">

				<div id="top">
					<img name="couponImg" src="images/couponPic/pic.JPG" id="couponImg"
						style="width: 100%" />
				</div>
				<br>

				<table>

					<tr>
						<td class="a">廠商名稱:</td>
						<td id="companyName" class="p"></td>
					</tr>

					<tr>
						<td class="a">分類名稱:</td>
						<td id="category" class="p"></td>
					</tr>

					<tr>
						<td class="a">優惠券序號:</td>
						<td id="couponId" class="p"></td>
					</tr>

					<tr>
						<td class="a">優惠券名稱:</td>
						<td id="couponName" class="p"></td>
					</tr>

					<tr>
						<td class="a">優惠券價格:</td>
						<td id="couponPrice" class="p"></td>
					</tr>

					<tr>
						<td class="a">庫存量:</td>
						<td id="couponQty" class="p"></td>
					</tr>

					<tr>
						<td class="a">優惠起初日:</td>
						<td id="couponStartDate" class="p"></td>
					</tr>

					<tr>
						<td class="a">優惠截止日:</td>
						<td id="couponEndDate" class="p"></td>
					</tr>

					<tr>
						<td class="a">優惠券簡介:</td>
						<td id="couponInfo" class="p"></td>
					</tr>

					<tr>
						<td class="a">優惠券使用方式:</td>
						<td id="couponUse" class="p"></td>
					</tr>


				</table>
				<br>

				<div id="button">
					<a href="empCoupons.controller" class="btn btn-primary">返回</a>
				</div>
			</div>
			<%@include file="../commonpages/dashboardfooter1.jsp"%>
			<%@include file="../commonpages/dashboardlogoutmodal.jsp"%>
			<%@include file="../commonpages/dashboardbottom.jsp"%>
		</div>
	</div>
	<script>
		                  $(function () {
		                	  
		                	  var url = location.href;
		                	  console.log(url);
		                	  if(url.indexOf('?')!=-1){
		                		  var ary1 = url.split('?');
		                		  var ary2 = ary1[1].split('&');
		                		  var couponId =decodeURI(ary2[0].substr(9));		                		  
		                		  var couponName =decodeURI(ary2[1].substr(11));
		                		
		                	  }
		              
									$.ajax({
										   type:'GET',
						               	   url:'couponDetail.controller',
						               	   dataType:'JSON',
						               	   contentType:'application/json',
						               	   success(res) {
						               	   let coupons=res;
						               	   
						               	   for(let i=0;i<coupons.length;i++){					      
						               		  
						               		   if(couponId==coupons[i].couponId && couponName==coupons[i].couponName){
						               			   
						               			   $('#companyName').text(coupons[i].companyName);
						               			   $('#category').text(coupons[i].category);
						               			   $('#couponId').text(coupons[i].couponId);						             
						               			   $('#couponName').text(coupons[i].couponName); 						            
						               			   $('#couponPrice').text(coupons[i].couponPrice);
						               			   $('#couponQty').text(coupons[i].couponQty);
						               			   $('#couponStartDate').text(coupons[i].couponStartDate);
						               			   $('#couponEndDate').text(coupons[i].couponEndDate);
						               			   $('#couponUse').text(coupons[i].couponUse);
						               			   $('#couponInfo').text(coupons[i].couponInfo);
						               			   $('#couponImg').attr("src",coupons[i].couponImg);						               		
						               		   }
						               	   }						               	  
										}								 
									})											
								});		                 
						</script>
</body>
</html>