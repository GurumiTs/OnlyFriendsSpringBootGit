<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>

</style>
</head>
<body>
   
   <%@include file="../frontcommonpages/shopheader.jsp"%>
   
    <!-- top section-->
    <div class="bg-dark py-5">
      <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
          <h1 class="display-4 fw-bolder">Shop in style</h1>
          <p class="lead fw-normal text-white-50 mb-0">
            With this shop hompeage template
          </p>
        </div>
      </div>
    </div>
     <!-- top section-->
    <!-- items Section-->
    <section class="py-5">
      <div class="container px-4 px-lg-5 mt-5">      
        <div
          class="
            row
            gx-4 gx-lg-5
            row-cols-2 row-cols-md-3 row-cols-xl-4
            justify-content-center
          "
          id="itemarea"
        >
        

    
      </div>
      
      <table id="showpage" class="d-flex justify-content-center">
		<tr>			
			<td colspan="3" align="right"> <c:forEach var="i"
					begin="1" end="${totalPages}" step="1">
					<button class="btn btn-outline-secondary" id="myPage" value="${i}" onclick="change(${i})">${i}</button>
				</c:forEach>
			</td>
		</tr>
	</table>
      </div>
    </section>    
    <!-- Footer-->
    <%@include file="../commonpages/footer.jsp"%>
    <%@include file="../frontcommonpages/shopbottom.jsp"%>
    <script >  
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
    	   url:'queryallbypage/' + indexPage,
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
             "<div class='badge bg-dark text-white position-absolute'style='top: 0.5rem; right: 0.5rem'>"
               +  "Sale"+
              "</div>" +    
               "<img class='card-img-top' src='"+n.empPic+"'/>"+     
               "<div class='card-body p-4'>" +
                 "<div class='text-center'>" +
                   "<h5 class='fw-bolder'>"+n.empName+"</h5>"+
                   "<div class='d-flex justify-content-center small text-warning mb-2' >"+
                     "<div class='bi-star-fill'></div>"+
                     "<div class='bi-star-fill'></div>"+
                     "<div class='bi-star-fill'></div>"+
                     "<div class='bi-star-fill'></div>"+
                     "<div class='bi-star-fill'></div>"+
                  "</div>"+
                   "<span class='text-muted text-decoration-line-through'>$20.00</span>" +
                   "$18.00"+
                " </div>"+
               "</div>"+
             
               "<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>"+
                 "<div class='text-center'>"+
                  "<a class='btn btn-outline-dark mt-auto' href='/#'>Add to cart</a>"+
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
    
    </script>
  </body>
</html>   
