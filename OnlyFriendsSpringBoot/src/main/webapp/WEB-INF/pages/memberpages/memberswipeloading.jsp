<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/swipe.css" /> 
</head>
<body>
	
    <div class="underbackground">
      <div class="header">
        <div class="title" id="coinarea">
        </div>
     	<a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal"><img src="${pageContext.request.contextPath}/images/smallicon/money-bag.svg" alt="logo" width="40"></a>
		<a href="memberfriends" ><img src="${pageContext.request.contextPath}/images/smallicon/inbox.svg" alt="logo" width="40"></a>
		<a href="memberswipe" ><img src="${pageContext.request.contextPath}/images/smallicon/turn.svg" alt="logo" width="40"></a>
		     
      </div>
    </div>
    <div class="backgrounds">
      <div class="background layer-3"><div class="head"></div></div>
      <div class="background layer-2"><div class="head"></div></div>
      <div class="background layer-1"><div class="head"></div></div>
    </div>
    <br><br><br><br><br>
    <div class="container mt-5">
    <div class="row d-none" id="loadingarea">
    <div class="col d-flex justify-content-center align-items-center">
        <div class="loading">
		  <div class="dot"></div>
		  <div class="dot"></div>
		  <div class="dot"></div>
		  <div class="dot"></div>
		  <div class="dot"></div>
		</div>
        </div>
    </div>
    
    <!-- card area -->
     <div class="row gx-4 gx-lg-5 align-items-center " id="cardarea">
        <div class="col-12 col-md-4 col-lg-4">
                  <div class="pricing pricing-highlight">
                    <div class="pricing-title">Cupid Team</div>
                    <div class="pricing-padding">
                      <div class="pricing-price">              
                        <div>Cupid Magic</div>
                      </div>
                      <div class="pricing-details">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/images/smallicon/cardimg.png" alt="" />
                      </div>
                    </div>
                    <div class="pricing-cta">
                      <a id="pickone" class="btn">選取<i class="fas fa-arrow-right"></i
                      ></a>
                    </div>
                  </div>
                </div>
                <div class="col-12 col-md-4 col-lg-4">
                  <div class="pricing pricing-highlight">
                    <div class="pricing-title">Cupid Team</div>
                    <div class="pricing-padding">
                      <div class="pricing-price">
                        <div>Cupid Magic</div>
                      </div>
                      <div class="pricing-details">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/images/smallicon/cardimg.png" alt="" />
                      </div>
                    </div>
                    <div class="pricing-cta">
                      <a id="picktwo" class="btn"
                        >選取<i class="fas fa-arrow-right"></i
                      ></a>
                    </div>
                  </div>
                </div>
                <div class="col-12 col-md-4 col-lg-4">
                  <div class="pricing pricing-highlight">
                    <div class="pricing-title">Cupid Team</div>
                    <div class="pricing-padding">
                      <div class="pricing-price">
                        <div>Cupid Magic</div>
                      </div>
                      <div class="pricing-details">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/images/smallicon/cardimg.png"  alt="" />
                      </div>
                    </div>
                    <div class="pricing-cta">
                      <a id="pickthree" class="btn"
                        >選取<i class="fas fa-arrow-right"></i
                      ></a>
                    </div>
                  </div>
                </div>
       </div> <!-- end of card row -->
       
       <!-- card area -->
     <div class="row gx-4 gx-lg-5 d-flex justify-content-center align-items-center d-none " id="showcardarea">
        <div class="col-12 col-md-4 col-lg-4 ">
                  <div class="pricing pricing-highlight">
                    <div class="pricing-title">本日派送</div>
                    <div class="pricing-padding">
                      <div class="pricing-price">              
                        <div id="todaytype"></div>
                      </div>
                      <div class="pricing-details">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/images/smallicon/smoke.png" alt="" />
                      </div>
                    </div>
                   
                  </div>
                </div>                            
       </div> <!-- end of card row -->
    
    
    

    
    
      <div class="row gx-4 gx-lg-5 align-items-center " id="infoarea">
        <div class="col-md-5">
          <img
            class="card-img-top mb-5 mb-md-0 rounded-circle border border-2"
            id="memberpic"
            src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg"
            alt="..."
          />
        
        </div>
        <div class="col-md-5">
          <h1 class="display-5 fw-bolder text-white" id="membername">本日精選</h1>
          <div class="fs-5 mb-5">
            <span class="text-white" id="memberage"></span>
          </div>
          <p class="lead text-white" id="memberinfo">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium
            at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi
            alias magni, accusamus eius blanditiis delectus ipsam minima ea iste
            laborum vero?
          </p>
          <div class="d-flex" id="tagArea">
           
          </div>
        </div>

        <div class="col-md-2">
          <div class="load" id="heartbuttonarea">
    
          </div>
          <div class="load2">
          <a href="" id="again"><i class="fas fa-redo fa-3x"></i></a>       
          </div>      
        </div>
      </div>
    </div>

	<%@include file="../frontcommonpages/shopbottom.jsp"%>
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Stored</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <div class="row">
                <div class="col-6">
                  <div class="pricing border border-secondary shadow border-4 rounded">
                    <div class="pricing-title">Cupid Coins</div>
                    <div class="pricing-padding">
                      <div class="pricing-price">
                        <div>$99</div>
                        <div></div>
                      </div>
                      <div class="pricing-details">
                        <div class="pricing-item">
                          <div class="pricing-item-icon">
                            <i class="fas fa-check"></i>
                          </div>
                          <div class="pricing-item-label">coins x3</div>
                        </div>
                        <div class="pricing-item">
                          <div class="pricing-item-icon">
                            <i class="fas fa-check"></i>
                          </div>
                          <div class="pricing-item-label">exp +100</div>
                        </div>
                      </div>
                    </div>
                    
                  </div>
                </div>
                <div class="col-6">
                  <div class="pricing border border-warning border-4 rounded">
                    <div class="pricing-title">Cupid Coins</div>
                    <div class="pricing-padding">
                      <div class="pricing-price">
                        <div>$199</div>
                        <div></div>
                      </div>
                      <div class="pricing-details">
                        <div class="pricing-item">
                          <div class="pricing-item-icon">
                            <i class="fas fa-check"></i>
                          </div>
                          <div class="pricing-item-label">coins x10</div>
                        </div>
                        <div class="pricing-item">
                          <div class="pricing-item-icon">
                            <i class="fas fa-check"></i>
                          </div>
                          <div class="pricing-item-label">exp +3000</div>
                        </div>
                      </div>
                    </div>
                    
                  </div>
                </div>
              </div>  
      </div>
      <div class="modal-footer">
       
      </div>
    </div>
  </div>
</div>
<script src="https://www.paypalobjects.com/api/checkout.js"></script>


<script>
    paypal.Button.render({
    style: {
    		 color:'gold',
    		 shape:'pill',
    		 label:'checkout',
    		 size: 'responsive',
    		 fundingicons:'true',
    		},
    env: 'sandbox', // Or 'production'
    // Set up the payment:
    // 1. Add a payment callback
    payment: function(data, actions) {
      // 2. Make a request to your server
      return actions.request.post('http://localhost:8080/OnlyFriends/pay')
        .then(function(res) {
          // 3. Return res.id from the response
          console.log(res)
          return res.id;
        });
    },
    // Execute the payment:
    // 1. Add an onAuthorize callback
    onAuthorize: function(data, actions) {
    	console.log(data)
      // 2. Make a request to your server
      console.log("onauth")
      return actions.request.post('http://localhost:8080/OnlyFriends/pay/success', {
        paymentID: data.paymentID,
        payerID:   data.payerID
      })
        .then(function(res) {
          console.log(res)
          $('#exampleModal').modal('hide')
          Swal.fire(
	               '感謝'+res.payer.payerInfo.firstName+'已儲值成功!',
	               '',
	               'success'
	                         )	
          loadnewmember();                            
        });
    }
  }, '.modal-footer');
</script>




    <script>
      let todaytype;
      $(function () {
        loadnewmember();
        $("#loadingarea").addClass("d-none");
        $("#infoarea").addClass("d-none");
        $("#pickone").on("click", pick);
        $("#picktwo").on("click", pick);
        $("#pickthree").on("click", pick);
        $("#again").on("click", onemore);
        $("#heartbuttonarea").on("click",getheartid)
        //$("#stored").on('click',stored)
      });

      function pick() {
        //減少一個硬幣
        $.ajax({
          type: "post",
          url: "membercoinsdelete",
          success: function (data) {
          //location.href="/"		  
          let oldcoinsnum = $("#coinarea").find("span").text()
          let newcoinnum = oldcoinsnum - 1
          if(newcoinnum > 1){
        	 $("#coinarea").find("span").text(newcoinnum) 
          }
          else if(newcoinnum == 1){      
        	 $("#coinarea").find("span").remove()
          }
          else if(newcoinnum < 1){      
         	 $("#coinarea").find("img").remove()
           }
         
           
          },
          error: function (data) {
            console.log("無法送出");
          },
        });
        $("#cardarea").addClass("d-none");
        $("#showcardarea").removeClass("d-none");
        setTimeout(function () {
          $("#showcardarea").addClass("d-none");
          notlike();
        }, 2000);
      }

      function notlike() {
        $("#loadingarea").removeClass("d-none");
        $("#infoarea").addClass("d-none");
        setTimeout(function () {
          $("#infoarea").removeClass("d-none");
          $("#loadingarea").addClass("d-none");
        }, 1000);
      }

      function loadnewmember() {
        $.ajax({
          type: "post",
          url: "memberswipe",
          dataType: "json",
          cache: false,
          success: function (data) {
            let num = Math.floor(Math.random() * 3 + 1);
            if (num == 1 && data.tagOne != "") {
              todaytype = data.tagOne + "派";
            }
            if (num == 2 && data.tagTwo != "") {
              todaytype = data.tagTwo + "派";
            }
            if (num == 3 && data.tagThree != "") {
              todaytype = data.tagThree + "派";
            }
            if (todaytype == null) {
              todaytype = "Cupid私藏";
            }
            console.log(todaytype);
            $("#todaytype").html(todaytype);
            $("#memberpic").prop("src", data.memberPic);
            $("#membername").text(data.memberName);
            $("#memberage").text(
              data.memberAge +
                "/" +
                data.memberCounty +
                "/" +
                data.memberDistrict
            );
            $("#memberinfo").text(data.personalInfo);
            $("#tagArea").html("");
            if (data.tagOne != "") {
              $("#tagArea").append(
                $("<a />")
                  .addClass(
                    "badge badge-success text-decoration-none text-white fs-6"
                  )
                  .attr("id", "tag1")
                  .text(data.tagOne)
              );
            }
            if (data.tagTwo != "") {
              $("#tagArea").append(
                $("<a />")
                  .addClass(
                    "badge badge-warning text-decoration-none text-white fs-6"
                  )
                  .attr("id", "tag2")
                  .text(data.tagTwo)
              );
            }
            if (data.tagThree != "") {
              $("#tagArea").append(
                $("<a />")
                  .addClass(
                    "badge badge-info text-decoration-none text-white fs-6"
                  )
                  .attr("id", "tag3")
                  .text(data.tagThree)
              );
            }
            $('#heartbuttonarea').html('')
            $('#heartbuttonarea').append(
            	$('<i />')	
            	.addClass('fa fa-heartbeat fa-3x')
            	.attr('id','heartbutton')          
            )
            $('#heartbuttonarea').append(
            	$('<input />')
            	.addClass('d-none')
            	.attr('id','heartid')
            	.attr('value',data.memberAccount)            
            )
                      
            $("#coinarea").html("");
            $.ajax({
              type: "post",
              url: "membercoinsquery",
              success: function (data) {
                let coins = data.swipeTime;
                if(coins == 0){
                	$("#pickone").addClass('disabled')
                	$("#pickone").html('本日硬幣已用完')
                	$("#picktwo").addClass('disabled')
                	$("#picktwo").html('本日硬幣已用完')
                	$("#pickthree").addClass('disabled')
                	$("#pickthree").html('本日硬幣已用完')
                }
                console.log("coins num :" + coins);
                if(coins == 1){
                	$("#coinarea").append(
                            $("<img  class='mx-2' width='60'/>")
                              .attr(
                                "src",
                                "${pageContext.request.contextPath}/images/smallicon/pentacle.svg"
                              )
                          );
                	$("#coinarea").append(
                    		$("<span class='fs-4 fw-bolder mx-1 d-none'/>").html(coins)              		
                    	)
                }
                if(coins > 1){
                	$("#coinarea").append(
                			$("<img  class='mx-2' width='60'/>")
                              .attr(
                                "src",
                                "${pageContext.request.contextPath}/images/smallicon/pentacle.svg"
                              )
                          );
                	$("#coinarea").append(
                		$("<span class='fs-4 fw-bolder mx-1'/>").html(coins)              		
                	)
                	
                }
               
              },
              error: function (data) {
                console.log("無法送出");
              },
            });
          },
          error: function (data) {
            console.log("無法送出");
          },
        });
      }

      function onemore() {
    	  $('#cardarea').addClass('d-none');
    	  $('#showcardarea').addClass('d-none')
    	  $('#loadingarea').addClass('d-none')
        loadnewmember();
        $("#infoarea").addClass("d-none");
        $("#cardarea").removeClass("d-none");
      }
      
      
      function getheartid() {
    	  let heartid = $('#heartid').attr('value')
    	  $.ajax({
              type: "post",
              url: "memberInvitefriend/"+heartid,
              success: function (data) {
            	  Swal.fire({
            		  icon: 'success',
            		  title: 'invite successful',
            		  showConfirmButton: false,
            		  timer: 1500
            		})
            	  console.log(data)
              }
    	  ,error:function(data){
    		  Swal.fire({
        		  icon: 'error',
        		  title: 'save already',
        		  showConfirmButton: false,
        		  timer: 1500
        		})	 
    	  	  }
    	   });
      }
      
      
      function stored(){
    	  $.ajax({
              type: "post",
              url: "pay",
              success: function (data) {
            	  Swal.fire({
            		  icon: 'success',
            		  title: 'invite successful',
            		  showConfirmButton: false,
            		  timer: 1500
            		})
            	  console.log(data)
              }
    	  ,error:function(data){
    		  Swal.fire({
        		  icon: 'error',
        		  title: 'save already',
        		  showConfirmButton: false,
        		  timer: 1500
        		})	 
    	  	  }
    	   });
    	  
      }  
    </script>
    
    <c:if test="${not empty successMsg}">
		<script>
			Swal.fire({
				position : 'center',
				icon : 'success',
				title : '${successMsg}',
				showConfirmButton : false,
				timer : 1500
			})
		</script>
		<c:remove var="successMsg" scope="session" />
	</c:if>
</body>
</html>
