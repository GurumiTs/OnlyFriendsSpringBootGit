<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>

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



			<!-- Page content-->
			<div class="container mt-5">
				
				 <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." id="img" /></div>
                    <div class="col-md-6">
                        <div class="small mb-1" ></div>
                        <h1 class="display-5 fw-bolder" id= "active"></h1>     
                        		<div ><h4>
                        			活動標籤 :<label id = "atype2"> </label><br>
									活動日期 :<label id = "adate"></label> <br>
									報名截止日期 :<label id = "finishDeadline"></label> <br>
									活動地點 :<label id ="county"></label> <label id="district"></label><br>
									男性人數 : <label id = "male"></label> <br>
									女性人數 : <label id = "female"></label><br> 
									</h4></div> 
                        <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  我要報名
</button>

<!-- Modal -->
       <form action = "addmember" method="post"  enctype="multipart/form-data" >
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">請填選報名資料</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id = "basicInForm">
       
       
       <div class="mb-3">
       
       
       <input type = "hidden" id= "anum"  >
							<label for="memberEmail" class="form-label">Email</label> <input
								type="email" class="form-control" name="memberEmail" id="memberEmail" value="${personalinfo.memberEmail}" 
								required readonly />
						</div> 

						<div class="mb-3 row">
							<div class="col">
								<label for="memberAccount" class="form-label">編號</label> <input
									type="text" class="form-control" name="memberAccount" id="memberAccount" value = "${personalinfo.memberAccount}"
									required readonly />
								<div class="valid-feedback">Looks good!</div>
								<div class="invalid-feedback">should be 6~12 numbers</div>
							</div>
							<div class="col">
								<label for="memberName" class="form-label">姓名</label> <input
									type="text" class="form-control" id="memberName" name="memberName" value = "${personalinfo.memberName}"
									required />
								<div class="valid-feedback">Beautiful!</div>
								<div class="invalid-feedback">english only!</div>
							</div>
						</div>



						<div class="mb-3 row">
							<div class="col">
								<label for="memberAge" class="form-label">年齡</label> <input
									type="text" class="form-control" name="memberAge" id="memberAge" value = "${personalinfo.memberAge}"
									required />
								<div class="invalid-feedback">Choose your Happy Bday!</div>
							</div>

						</div>

						<div class="mb-3 row address" id="twzipcode">
							<div class="col">
								<input type="text" class="form-control" name="memberAddress" value ="${personalinfo.memberZipcode}"
									id="memberAddress" placeholder="addr." />
							</div>
						</div>
       
       
       
       
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
		 <!--   <a href = "oauserpage.controller">--> 
        <button  type="button" class="btn btn-primary" id = "send" data-bs-dismiss="medal">送出</button>
        
      </div>
    </div>
  </div>
</div>
                    </div>
                </div>
            </div>
        </section>
        </form>
        
    
        
        
      <section class="mb-5">
								<div class="fs-5 mb-4">
								
								<div class="lead" id="conditions">
								</div>
									
								</div>  
								

        
        <h4>活動地點</h4>
       
 <iframe width="1000" height="500" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" id="da">
 
 
 </iframe>
       
       
       
        <!-- Related items section-->
        
        
        
                            <!-- Product actions-->

                                    <!-- Product name-->
                            
                                  
                           
                            <!-- Product actions-->
                           
                        </div>
                    </div>
                </div>
            </div>
        </section>
       
      
      
      
      
       
						</div>

					
					</form>
		
        
		
			<%@include file="../frontcommonpages/shopfooter.jsp"%>
</div>
	<%@include file="../frontcommonpages/shopbottom.jsp"%>
	</div>
	
	
	
	
	
	
	
	
	<script>
	
	
	
	

		$(function(){
			
			
			$("#twzipcode").twzipcode({
		        detect: true,
		        zipcodeIntoDistrict: true,
		        css: ["city form-control col", "town form-control col"],
		      });
			
			$("#twzipcode").twzipcode("set", {
				county : "${personalinfo.memberCounty}",
				district : "${personalinfo.memberDistrict}",
			});
		
		
			var url = location.href;
			
			if(url.indexOf('?')!=-1){
				var ary1 = url.split('?');
				var ary2 = ary1[1].split('&')
				var anum = decodeURI(ary2[0].substr(5));
				var active = decodeURI(ary2[1].substr(7))
			}
			
			$.ajax({
				type:'GET',
				url:'oaitem.controller',
				dataType:'JSON',
				contentType:'application/json',
				success(res){
				let oa = res;
				
				for(let i=0;i<oa.length;i++){
					if (anum==oa[i].anum && active== oa[i].active){
					
						var daa = oa[i].county + oa[i].district+ oa[i].address;
					console.log(daa)
					$('#anum').attr('value',anum)
					$('#active').text(oa[i].active);
					$('#img').attr("src",oa[i].img);
					$('#conditions').text(oa[i].conditions);
					$('#atype2').text(oa[i].atype2);
					$('#adate').text(oa[i].adate);
					$('#finishDeadline').text(oa[i].finishDeadline);
					$('#county').text(oa[i].county);
					$('#district').text(oa[i].district);
					$('#address').text(oa[i].address);					
					$('#male').text(oa[i].male);
					$('#female').text(oa[i].female);
					$('#da').attr('src', 'http://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q='+daa+'&z=18&output=embed&t=p');
					}
				}
				}
			
			})
			/* 送出資料*/
			$("#send").on("click", function () {
				let anum = $('#anum').val()
				console.log(anum)
				
				  $.ajax({
					  type : "POST",
					  url: "addmember/"+anum,
					  success:function(data)
					  { 
						  Swal.fire(	
								  '報名成功!',
								  '',
								  'success'
					  )
					  table.ajax.reload();
						  },
					  error:function(e){
						  Swal.fire(
							'重複報名',
							'',
							'warning'
						  )
						  }, //error close
				     
				  });		//ajax close  
			
			});
	});//function
		
		
		
		
	
		
		  
		
		  
		  
		  
	
		  
		 
	
	
	
	
	</script>
</body>
</html>
