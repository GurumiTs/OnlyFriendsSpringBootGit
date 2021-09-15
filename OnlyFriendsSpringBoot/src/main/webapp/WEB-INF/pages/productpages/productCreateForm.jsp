<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- top here -->
<%@include file="../commonpages/dashboardtop.jsp"%>
<style>
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
            content:"新增商品"; 
            font-size: 0.8cm;
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
        .textarea{resize:none};
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
      #doublename{
   			padding:10px;
   			color:red;
   		}
   		#check{
   			padding:10px;
   		}
   		#error{
   			padding:10px;
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
					<h1 class="h3 mb-2 text-gray-800">商品管理</h1>
					<div class="zi_box_1">
      <form action="empaddProduct.controller" class="row g-3"  method="post" enctype="multipart/form-data">
        <div class="col-md-12">
          
          <div class="mb-3">
            <label for="formFile" class="form-label">商品圖片:<img id="output" src="images/smallicon/photo.png" style="width:180px; height:180px;" class="rounded mx-auto d-block" alt="..."></label>
            <input class="form-control" type="file" id="formFile" name="Photo" accept="image/*" onchange="loadFile(event)"><span id="img"></span>
          </div>
           
        </div>
        <div class="col-md-12">
          <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">商品名稱</span>
            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" 
            	name="Name" id="Name" required/><span id="mesg"></span><br>
          </div>
        </div>
       
        <div class="col-6">
          <div class="input-group mb-3">
            <span class="input-group-text">$</span>
            <input type="number" class="form-control" aria-label="Amount (to the nearest dollar)"
            	 name="Price" id="Price" required/><span id="idsp"></span>
          </div>
        </div>
        
        <div class="col-md-6">
          <div class="input-group mb-3">
            <button class="btn btn-outline-secondary" type="button">商品類型</button>
            <select class="form-select" id="inputGroupSelect03" aria-label="Example select with button addon" name="Item">
              <option selected>請選擇商品類型...</option>
              <option value="幸運小物" id="Item">幸運小物類</option>
              <option value="香氛類" id="Item">香氛類</option>
              <option value="其他" id="Item">其他類</option>
            </select>
          </div>
        </div>
         
         
        <div class="col-md-6">
          <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">商品數量</span>
            <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="Num" id="Num" /><span id="num"></span>
          </div>
          
        </div>
<!--         <div class="col-md-6"> -->
<!--           <div class="input-group mb-3"> -->
<!--             <span class="input-group-text" id="inputGroup-sizing-default">運費</span> -->
<!--             <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="Shipping" id="Shipping"><span id="shipping"></span> -->
<!--           </div> -->
<!--         </div> -->
        <div class="col-12">
            <div class="input-group">
              <span class="input-group-text">商品描述</span>
              <textarea class="form-control textarea" aria-label="With textarea" name="Description" id="Description"></textarea>
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
          <button type="submit" class="btn btn-primary">新增商品</button>
          <button type="button" class="btn btn-info" id="inputquik">一鍵輸入</button>
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
		 <script type="text/javascript">
   		let loadFile=function(event){
   			let output=document.getElementById('output');
   			output.src=URL.createObjectURL(event.target.files[0]);
   			output.onload=function(){
   				URL.revokeObjectURL(output.src)
   			}
   		};
   		document.getElementById("Name").onblur=checkName;
        function checkName(){
            let sp=document.getElementById("mesg");
            let theNameVal=document.getElementById("Name").value;
            console.log(theNameVal);
            if(theNameVal != ""){
                        sp.innerHTML='<img id="check" src="images/smallicon/check.png" > ';
            }else{
                sp.innerHTML='<img id="error" src="images/smallicon/error.png"> 不可空白'; 
            }
            
        }
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
//         document.getElementById("Shipping").onblur=checkShipping;
//         function checkShipping(){
//             let sp=document.getElementById("shipping");
//             let theNameVal=document.getElementById("Shipping").value;
//             console.log(theNameVal);
//             if(theNameVal != ""){
//                         sp.innerHTML='<img id="check" src="images/smallicon/check.png" > ';
//             }else{
//                 sp.innerHTML='<img id="error" src="images/smallicon/error.png"> 不可空白'; 
//             }
            
//         }
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
        <script>
        $(function(){		
    		
        	$("#inputquik").click(function(){
        		$("#Name").val("霞海城隍廟聯名御守");
        		$("#Price").val("360");
        		$("#inputGroupSelect03").val("幸運小物");
        		$("#Num").val("25");
        		$("#Description").val("一年一度七夕即將到來\r\n"
        				+ "今年很可惜因為疫情關係，無法親自去到霞海城隍城隍廟\r\n"
    					+ "和月下老人祈求緣分也別擔心\r\n"
    					+ "在七夕前夕，成立結緣追愛小組\r\n"
    					+ "攜手與在地設計師合作，製作出各式七夕月老聯名款禮物\r\n"
    					+ "期待在送禮時能讓各地單身、想求姻緣的男女們牽起之間的緣分");
        		
        		
        	});
        	
        	});
        </script>
 </body>
</html>	
	
