<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
 <style>
      .loadnot {
        margin: 150px auto;
        width: 100px;
        height: 100px;
        background-color: #7f9c5d;
        border-radius: 100px;
        position: relative;
        animation: pulse 2000ms linear infinite;
        -webkit-animation: pulse 2000ms linear infinite;
        -moz-animation: pulse 2000ms linear infinite;
      }

      .loadnot i {
        position: absolute;
        top: 28px;
        left: 24%;
        color: white;
        text-shadow: -1px -1px #333;
      }

      .loadnot:after,
      .loadnot:before {
        display: inline-block;
        margin: auto;
        position: absolute;
        content: "";
        width: 100px;
        height: 100px;
        border-radius: 100px;
        background-color: #7f9c5d;
      }

      .loadnot:after {
        z-index: -100;
        -webkit-animation: outer-ripple 2000ms linear infinite;
        -moz-animation: outer-ripple 2000ms linear infinite;
        animation: outer-ripple 2000ms linear infinite;
      }

      .loadnot:before {
        z-index: -200;
        -webkit-animation: inner-ripple 2000ms linear infinite;
        -moz-animation: inner-ripple 2000ms linear infinite;
        animation: inner-ripple 2000ms linear infinite;
      }
      .load {
        margin: 150px auto;
        width: 100px;
        height: 100px;
        background-color: #f08080;
        border-radius: 100px;
        position: relative;
        animation: pulse 2000ms linear infinite;
        -webkit-animation: pulse 2000ms linear infinite;
        -moz-animation: pulse 2000ms linear infinite;
      }

      .load i {
        position: absolute;
        top: 28px;
        left: 24%;
        color: white;
        text-shadow: -1px -1px #333;
      }

      .load:after,
      .load:before {
        display: inline-block;
        margin: auto;
        position: absolute;
        content: "";
        width: 100px;
        height: 100px;
        border-radius: 100px;
        background-color: #cd5c5c;
      }

      .load:after {
        z-index: -100;
        -webkit-animation: outer-ripple 2000ms linear infinite;
        -moz-animation: outer-ripple 2000ms linear infinite;
        animation: outer-ripple 2000ms linear infinite;
      }

      .load:before {
        z-index: -200;
        -webkit-animation: inner-ripple 2000ms linear infinite;
        -moz-animation: inner-ripple 2000ms linear infinite;
        animation: inner-ripple 2000ms linear infinite;
      }
      /* outer ripple */

      @keyframes pulse {
        0% {
          transform: scale(0.8);
          filter: alpha(opacity=50);
          opacity: 0.5;
        }
        10% {
          transform: scale(1.1);
          filter: alpha(opacity=1);
          opacity: 1;
        }
        20% {
          transform: scale(0.9);
          filter: alpha(opacity=1);
          opacity: 1;
        }
        100% {
          transform: scale(0.8);
          filter: alpha(opacity=50);
          opacity: 0.5;
        }
      }

      @-moz-keyframes pulse {
        0% {
          transform: scale(0.8);
          filter: alpha(opacity=50);
          opacity: 0.5;
        }
        10% {
          transform: scale(1.1);
          filter: alpha(opacity=1);
          opacity: 1;
        }
        20% {
          transform: scale(0.9);
          filter: alpha(opacity=1);
          opacity: 1;
        }
        100% {
          transform: scale(0.8);
          filter: alpha(opacity=50);
          opacity: 0.5;
        }
      }

      @-webkit-keyframes pulse {
        0% {
          transform: scale(0.8);
          filter: alpha(opacity=50);
          opacity: 0.5;
        }
        10% {
          transform: scale(1.1);
          filter: alpha(opacity=1);
          opacity: 1;
        }
        20% {
          transform: scale(0.9);
          filter: alpha(opacity=1);
          opacity: 1;
        }
        100% {
          transform: scale(0.8);
          filter: alpha(opacity=50);
          opacity: 0.5;
        }
      }

      @keyframes outer-ripple {
        0% {
          transform: scale(1);
          filter: alpha(opacity=50);
          opacity: 0.5;
        }
        80% {
          transform: scale(3.5);
          filter: alpha(opacity=0);
          opacity: 0;
        }
        100% {
          transform: scale(3.5);
          filter: alpha(opacity=0);
          opacity: 0;
        }
      }

      @-webkit-keyframes outer-ripple {
        0% {
          transform: scale(1);
          filter: alpha(opacity=50);
          opacity: 0.5;
        }
        80% {
          transform: scale(3.5);
          filter: alpha(opacity=0);
          opacity: 0;
        }
        100% {
          transform: scale(3.5);
          filter: alpha(opacity=0);
          opacity: 0;
        }
      }

      @-moz-keyframes outer-ripple {
        0% {
          transform: scale(1);
          filter: alpha(opacity=50);
          opacity: 0.5;
        }
        80% {
          transform: scale(3.5);
          filter: alpha(opacity=0);
          opacity: 0;
        }
        100% {
          transform: scale(3.5);
          filter: alpha(opacity=0);
          opacity: 0;
        }
      }
      /* inner ripple */

      @keyframes inner-ripple {
        0% {
          transform: scale(1);
          filter: alpha(opacity=50);
          opacity: 0.5;
        }
        30% {
          transform: scale(1);
          filter: alpha(opacity=50);
          opacity: 0.5;
        }
        100% {
          transform: scale(2.5);
          filter: alpha(opacity=0);
          opacity: 0;
        }
      }

      @-webkit-keyframes inner-ripple {
        0% {
          transform: scale(1);
          filter: alpha(opacity=50);
          opacity: 0.5;
        }
        30% {
          transform: scale(1);
          filter: alpha(opacity=50);
          opacity: 0.5;
        }
        100% {
          transform: scale(2.5);
          filter: alpha(opacity=0);
          opacity: 0;
        }
      }

      @-moz-keyframes inner-ripple {
        0% {
          transform: scale(1);
          filter: alpha(opacity=50);
          opacity: 0.5;
        }
        30% {
          transform: scale(1);
          filter: alpha(opacity=50);
          opacity: 0.5;
        }
        100% {
          transform: scale(2.5);
          filter: alpha(opacity=0);
          opacity: 0;
        }
      }
    </style>

</head>
<body>

	<%@include file="../frontcommonpages/shopheader.jsp"%>

	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-5">
					<img class="card-img-top mb-5 mb-md-0" id="memberpic"
						src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" alt="..." />
				</div>
				<div class="col-md-5">
					<h1 class="display-5 fw-bolder" id="membername">Today Special</h1>
					<div class="fs-5 mb-5">
						<span class="" id="memberemail"></span>
					</div>
					<p class="lead">Lorem ipsum dolor sit amet consectetur
						adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi
						consequatur obcaecati excepturi alias magni, accusamus eius
						blanditiis delectus ipsam minima ea iste laborum vero?</p>
					<div class="d-flex">

						<button class="btn btn-outline-dark flex-shrink-0" type="button">
							<i class="bi-cart-fill me-1"></i> Add to cart
						</button>
					</div>
				</div>

				<div class="col-md-2">
					<div class="load">
						<i class="fa fa-heartbeat fa-3x"></i>
					</div>
					<div class="loadnot">
						<i class="far fa-times-circle fa-3x" id="not"></i>
					</div>
				</div>
			</div>
		</div>
	</section>


	<%@include file="../commonpages/footer.jsp"%>
	<%@include file="../frontcommonpages/shopbottom.jsp"%>
	<script>
		$(function() {
			$.ajax({
				type : "get",
				url : "memberswipe",
				dataType : "json",
				cache : false,
				success : function(data) {	
					$('#memberpic').prop('src',data.memberPic)
					$('#membername').text(data.memberName)
					$('#memberemail').text(data.memberEmail)
				},
				error : function(data) {
					console.log('無法送出');
				}
			});
			$('#not').on('click', notlike)
		})
		function notlike() {
			$.ajax({
				type : "get",
				url : "memberswipe",
				dataType : "json",
				cache : false,
				success : function(data) {	
					$('#memberpic').prop('src',data.memberPic)
					$('#membername').text(data.memberName)
					$('#memberemail').text(data.memberEmail)
				},
				error : function(data) {
					console.log('無法送出');
				}
			});
		}
	</script>
</body>
</html>
