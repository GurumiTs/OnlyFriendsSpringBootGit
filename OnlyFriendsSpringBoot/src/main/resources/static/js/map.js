 $(function() {		 	   
	$('#mapservice').on('click',createmap)
})

function createmap(){    
              var mapbox =  		
                "<div class='card chat-box card-success position-fixed bottom-0 end-0 w-25' id='mapbox'>"+
                  "<div class='card-header'>"+
                   "<h4 id='chatroomname'>"+"路線規劃"+"</h4>"+
				   "<button type='button' class='btn-close btn-sm aria-label='Close' id='closecs'></button>"+
				 "</div>"+
                  "<div class='card-body chat-content overflow-auto' id='chat-content'>"+
				 	"<form class='form-horizontal'>"+
          			"<div class='form-group'>"+
           			 "<label for='from' class='col-xs-2 control label'>起始地</label>"+
           			 "<input type='text' id='from' class='form-control' />"+
          			"</div>"+
          			"<div class='form-group'>"+
            		"<label for='to' class='col-xs-2 control label'>目的地</label>"+
          		 	"<input type='text' id='to' class='form-control' />"+
          			"</div>"+
        			"</form>"+
					"<div class='d-flex justify-content-end'>"+
					//"<img type='button' src='images/smallicon/searchmap.svg'  width='35' class='mb-3' id='findmap'>"+
       			 	"<button class='btn btn-primary' id='findmap'>搜尋</button>"+
					"</div>"+
					 "<div id='googleMap'></div>"+	
					"<div id='output'></div>"+
				  	"</div>"+
                  "<div class='card-footer chat-form'>"+    
                  "</div>"+
              "</div>";   	  
           	 $('body').append(mapbox)  
				
				var myLatLng = { lat: 24.967991899999998, lng: 121.19168279999998 };
				var mapOptions = {
				  center: myLatLng,
				  zoom: 12,
				  mapTypeId: google.maps.MapTypeId.ROADMAP,
				};

			//create map
			var map = new google.maps.Map(document.getElementById("googleMap"), mapOptions);
			//create dir servcie
			var directionsService = new google.maps.DirectionsService();
			//create a directionsRender object with which we will use to display
			var directionsDisplay = new google.maps.DirectionsRenderer();
			//bind directionsRender to the map
			directionsDisplay.setMap(map);

			function calcRoute() {
			  //create request
			  var request = {
			    origin: document.getElementById("from").value,
			    destination: document.getElementById("to").value,
			    travelMode: google.maps.TravelMode.DRIVING, //walking,cycling,transist
			    unitSystem: google.maps.UnitSystem.METRIC,
			  };
			
			  //pass the request to the route method
			  directionsService.route(request, (result, status) => {
			    if (status == google.maps.DirectionsStatus.OK) {
			      //get distance and time
			      const output = document.querySelector("#output");
			      output.innerHTML =
			        "<div><img src='images/smallicon/location.svg'  width='20' class='shadow-light rounded-circle mx-2'>" +
			        document.getElementById("from").value +
 			        "<br /><img src='images/smallicon/location.svg'  width='20' class='shadow-light rounded-circle mx-2'>"+
			        document.getElementById("to").value +
			        "<br /><img src='images/smallicon/distance.svg'  width='20' class='shadow-light rounded-circle mx-2'>"+
			        result.routes[0].legs[0].distance.text +
			        "<br /><img src='images/smallicon/sand-clock.svg'  width='20' class='shadow-light rounded-circle mx-2'>"+
			        result.routes[0].legs[0].duration.text +
			        "</div>";
			
			      //display route
			      directionsDisplay.setDirections(result);
			    } else {
			      //delete route from map
			      directionsDisplay.setDirections({ routes: [] });
			
			      //center map in spain
			      map.setCenter(myLatLng);
			
			      //show erro msg
			      output.innerHTML = "<div class='alert-danger'>something error...</div>";
			    }
			  });
			}
			
			//create autocomplete
			
			var options = {
			  types: ["(cities)"],
			};
			
			var input1 = document.getElementById("from");
			var autocomplete1 = new google.maps.places.Autocomplete(input1, options);
			
			var input2 = document.getElementById("to");
			var autocomplete2 = new google.maps.places.Autocomplete(input2, options);
			
			 $('#findmap').on('click',calcRoute)	
 			 $('#closecs').on('click',closecs)
					     
    }

function closecs(){		
		$('#mapbox').remove()	
	}	
      