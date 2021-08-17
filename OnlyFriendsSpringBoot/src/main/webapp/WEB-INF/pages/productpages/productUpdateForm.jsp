<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>

 <style>
    
      .textarea{resize:none}
      .zi_box_1 {
            border: 2px solid white;
            border-radius: 4px;
            margin: 100px;
            padding: 20px;
            position: relative;
            box-shadow: 2px 2px 2px 2px #c7c7c7; /*陰影*/
        }
      .zi_box_1::before {
            background-color: #fff;
            color: #6F00D2;
            content:"修改商品"; 
            font-size: 1cm;
            font-weight: bold;
            left: 1em;
            padding: 0 .5em;
            position: absolute;
            top: -1em;
        }
        .form-label{
          margin-left: 10px;
          font-size: larger;
        }
           .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
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
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Product Tables</h1>
					<div class="zi_box_1">
      <form action="updateProduct.controller" class="row g-3"  method="post" enctype="multipart/form-data">
        <div class="col-md-12">
      
          <div class="mb-3">
            <label for="formFile" class="form-label">商品圖片:<img id="output" src="${product.proPhoto }" style="width:180px; height:180px;" class="rounded mx-auto d-block" alt="..."></label>
            <input type="hidden" name="Id" value="${product.proId }" />
            <input class="form-control" type="file" id="formFile" name="Photo" accept="image/*" onchange="loadFile(event)"><span id="img"></span>
          </div>
           
        </div>
        <div class="col-md-12">
          <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">商品名稱</span>
            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" 
            	name="Name" id="Name" value="${product.proName }"/><br>
          </div>
        </div>
       
        <div class="col-6">
          <div class="input-group mb-3">
            <span class="input-group-text">$</span>
            <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)"
            	 name="Price" value="${product.proPrice }"/>
          </div>
        </div>
        
        <div class="col-md-6">
          <div class="input-group mb-3">
            <button class="btn btn-outline-secondary" type="button">商品類型</button>
            <select class="form-select" id="inputGroupSelect03" aria-label="Example select with button addon" name="Item" value="">
              <option selected>請選擇</option>
              <option value="幸運小物" id="Item">幸運小物</option>
              <option value="香氛類" id="Item">香氛類</option>
              <option value="其他" id="Item">其他</option>
            </select>
          </div>
        </div>
         
         
        <div class="col-md-6">
          <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">商品數量</span>
            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" 
            	name="Num" value="${product.proNum }" id="Num"/><span id="num"></span>
          </div>
          
        </div>
        <div class="col-md-6">
          <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">運費</span>
            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" 
            	name="Shipping" value="${product.proShipping }" id="Shipping"><span id="shipping"></span>
          </div>
        </div>
        <div class="col-12">
            <div class="input-group">
              <span class="input-group-text">商品描述</span>
              <textarea class="form-control textarea" aria-label="With textarea" 
              		name="Description" >${product.proDescription }</textarea>
            </div>
        </div>  
        <!-- <div class="col-12">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="gridCheck">
            <label class="form-check-label" for="gridCheck">
              Check me out
            </label>
          </div>
        </div> -->
        <div class="col-12">
          <button type="submit"  class="btn btn-primary">修改商品</button>
        </div>
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
		<script>
		$(function(){
			$("#inputGroupSelect03").val(`${product.proItem}`)
			
		})
		$(function(){
			$("#output").val(`${product.proPhoto}`)
			
		})
		let loadFile=function(event){
   			let output=document.getElementById('output');
   			output.src=URL.createObjectURL(event.target.files[0]);
   			output.onload=function(){
   				URL.revokeObjectURL(output.src)
   			}
   		};
   		document.getElementById("Price").onblur=checkPrice;
        function checkPrice(){
            let sp=document.getElementById("idsp");
            let theNameVal=document.getElementById("Price").value;
            console.log(theNameVal);
            if(theNameVal != ""){
                        sp.innerHTML='<img id="check" src="images/smallicon/check.png" > ';
            }else{
                sp.innerHTML='<img id="error" src="images/smallicon/error.png"> 不可空白'; 
            }
            
        }
        document.getElementById("Num").onblur=checkNum;
        function checkNum(){
            let sp=document.getElementById("num");
            let theNameVal=document.getElementById("Num").value;
            console.log(theNameVal);
            if(theNameVal != ""){
                        sp.innerHTML='<img id="check" src="images/smallicon/check.png" > ';
            }else{
                sp.innerHTML='<img id="error" src="images/smallicon/error.png"> 不可空白'; 
            }
            
        }
        document.getElementById("Shipping").onblur=checkShipping;
        function checkShipping(){
            let sp=document.getElementById("shipping");
            let theNameVal=document.getElementById("Shipping").value;
            console.log(theNameVal);
            if(theNameVal != ""){
                        sp.innerHTML='<img id="check" src="images/smallicon/check.png" > ';
            }else{
                sp.innerHTML='<img id="error" src="images/smallicon/error.png"> 不可空白'; 
            }
            
        }
        document.getElementById("formFile").onblur=checkImg;
        function checkImg(){
            let sp=document.getElementById("img");
            let theNameVal=document.getElementById("formFile").value;
            console.log(theNameVal);
            if(theNameVal != ""){
                        sp.innerHTML='<img id="check" src="images/smallicon/check.png" > ';
            }else{
                sp.innerHTML='<img id="error" src="images/smallicon/error.png"> 不可空白'; 
            }
            
        }
       
	</script>
 </body>
</html>	
	
