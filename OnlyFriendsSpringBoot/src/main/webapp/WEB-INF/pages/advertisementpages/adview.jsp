<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>

section{margin:auto;}
.container {
	width: 100%;
	height: 300px;
	display: flex;
}

.adtop {
	margin: auto;
	width: 50%;
}

.adbutton {
	width: 50%;
	margin: auto;
}

.wrap {
	width: 500px;
	height: 200px;
	background-color: black;
	margin: auto;
	position: relative;
	overflow: hidden;
	 border-radius:10px;
	/* border: 2px solid red; */
}

.slide-img, .slide-img2 {
	margin: 0;
	padding: 0;
	list-style: none;
	width: 1000px;
	display: flex;
	position: absolute;
}

.slide-img li, .slide-img2 li {
	width: 500px;
	height: 200px;
	/* flex:1 0 0 */
}

.slide-img li img, .slide-img2 li img {
	width: 100%;
	height: 100%;
}

.pages, .pages2 {
	margin: 0;
	padding: 0;
	left: 0;
	list-style: none;
	position: absolute;
	bottom: 10px;
	display: flex;
	width: 100%;
	justify-content: center;
}

.pages li, .pages2 li {
	border: 1px solid white;
	width: 10px;
	height: 8px;
	border-radius: 50%;
	margin: 0 5px;
}

a.slide-arrow {
	position: absolute;
	z-index: 10;
	width: 40px;
	height: 100%;
	font-size: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	color: white;
	opacity: .3;
	cursor: pointer;
}

.right {
	right: 0;
}

.container {
  position: relative;
 
}

.image1,.image2 {
  opacity: 1;
  display: block;
  width: 100%;
  height: auto;
  transition: .5s ease;
  backface-visibility: hidden;
}

.middle {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
  margin-left:-25%;
}

.slide-img:hover .image1 .image2 {
  opacity: 0.6;
}

.slide-img:hover .middle ,.slide-img2:hover .middle{
  opacity: 1;
}

.text {
  background-color: #FFF3EE;
  color: white;
  font-size: 16px;
  padding: 16px 32px;
  opacity: 0.4;

}
</style>



</head>

<body>
	<section>

		<div class="container">
			<div class="row">
				<div class="adtop col-12  col-md-5 id='block1'">



					<div class="wrap">
						<a class="slide-arrow" id="slidePrev"> <i
							class="fas fa-arrow-left"></i>
						</a> <a class="slide-arrow right" id="slideNext"><i
							class="fas fa-arrow-right"></i> </a>
						<ul class="slide-img" id="slide-img">
							<li><img src="" id="onebyone" class="image1"><div class="middle">
									<div class="text"><a href="#">前往</a></div>
								</div></li>
							<li><img src="" id="onebytwo"></li>
						</ul>
						<ul class="pages" id="pages">
							<li></li>
							<li></li>
						</ul>
					</div>




				</div>
				<div class="adbutton col-12  col-md-5">


					<div class="wrap">
						<a class="slide-arrow" id="slidePrev2"> <i
							class="fas fa-arrow-left"></i>
						</a> <a class="slide-arrow right slideNext"><i
							class="fas fa-arrow-right"></i> </a>
						<ul class="slide-img" id="slide-img2">
							<li><img src="" id="twobyone"><img src="" id="onebyone" class="image2"><div class="middle">
									<div class="text"><a href="#">前往</a></div>
								</div></li>
							<li><img src="" id="twobytwo"></li>
						</ul>
						<ul class="pages" id="pages2">
							<li></li>
							<li></li>
						</ul>
					</div>



				</div>

			</div>
		</div>
	</section>
	<script>
	//上架一
	$(function () {
		
		
		 $.ajax({
			 type: 'POST',
             url: 'getPositionOneToJson.controller',
             contentType:'application/json',			
          	success(data){ 
				console.log(data);
				for(let i=0;i<data.length;i++){
					console.log(data[i].adImg);
					var adImg = data[i].adImg.split(",");
					
					
						
				    $('#onebyone').attr("src",adImg[0]);
				    $('#onebytwo').attr("src",adImg[1]);
						
						
				

					
				}
			}
		 })
		
		
	})
	
	//上架二
	$(function () {
		
		
		 $.ajax({
			 type: 'POST',
             url: 'getPositionTwoToJson.controller',
             contentType:'application/json',			
          	 success(data){ 
            	 console.log(data);
 				for(let i=0;i<data.length;i++){
 					console.log(data[i].adImg);
 					var adImg = data[i].adImg.split(",");

 				    $('#twobyone').attr("src",adImg[0]);
 				    $('#twobytwo').attr("src",adImg[1]);
 					
 				}
				
			}
		 })
		
		
	})
	</script>



	<script>
    
        $(function () {
            let index = 0;
            let slideMove = 0;
            $('#pages li').eq(0).css('background', 'white')
            $('#pages li').on('mouseenter', function () {
               
                index = $(this).index()
               
                moveImg()
            })

            
            let slideCount = $('#slide-img li').length
            
            $('#slideNext').on('click', function () {
              
                index++;
                if (index >= slideCount) {
                    index = 0
                }
                slideMove = 0 - index * 500;
              
                moveImg()
            })

            $('#slidePrev').on('click', function () {
                index--;
                if (index < 0) {
                    index = slideCount - 1;
                }
                slideMove = 0 - index * 500;
              
                moveImg()
            })

            function moveImg() {
                slideMove = 0 - index * 500;
                $('#slide-img').css('left', slideMove)
                $('#pages li').eq(index).css('background', 'white')
                    .siblings().css('background', 'transparent')
            }

            setInterval(autoImg, 6000)
            function autoImg() {
                index++;
                if (index >= slideCount) {
                    index = 0
                }
                moveImg()
            }

        })
    </script>
	<script>
        $(function () {
            let index = 0;
            let slideMove = 0;
            $('#pages2 li').eq(0).css('background', 'white')
            $('#pages2 li').on('mouseenter', function () {
               
                index = $(this).index()
               
                moveImg()
            })

            
            let slideCount = $('#slide-img2 li').length
            
            $('#slideNext2').on('click', function () {
              
                index++;
                if (index >= slideCount) {
                    index = 0
                }
                slideMove = 0 - index * 500;
              
                moveImg()
            })

            $('#slidePrev2').on('click', function () {
                index--;
                if (index < 0) {
                    index = slideCount - 1;
                }
                slideMove = 0 - index * 500;
              
                moveImg()
            })

            function moveImg() {
                slideMove = 0 - index * 500;
                $('#slide-img2').css('left', slideMove)
                $('#pages2 li').eq(index).css('background', 'white')
                    .siblings().css('background', 'transparent')
            }

            setInterval(autoImg, 6000)
            function autoImg() {
                index++;
                if (index >= slideCount) {
                    index = 0
                }
                moveImg()
            }

        })
    </script>

</body>

</html>