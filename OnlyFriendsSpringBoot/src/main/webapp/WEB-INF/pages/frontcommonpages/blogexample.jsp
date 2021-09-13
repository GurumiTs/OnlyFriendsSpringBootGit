<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Locator</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="https://www.gstatic.com/external_hosted/handlebars/v4.7.6/handlebars.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
      <style>
      #googleMap {
        width: 80%;
        height: 400px;
        margin: 20px auto;
      }
    </style>
    <body>
       <div class="jumbotron">
      <div class="container-fluid">
        <h1>find distance between two places</h1>
        <p>help you calculate your traveling distance</p>
        <form class="form-horizontal">
          <div class="form-group">
            <label for="from" class="col-xs-2 control label">from</label>
            <input type="text" id="from" class="form-control" />
          </div>
          <div class="form-group">
            <label for="to" class="col-xs-2 control label">to</label>
            <input type="text" id="to" class="form-control" />
          </div>
        </form>
        <button class="btn btn-primary">find</button>
      </div>

      <div class="container-fluid">
        <div id="googleMap"></div>
        <div id="output"></div>
      </div>
    </div>
    
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9mG0ol3JtTnFcaACUlsBouWbeV3HCCVU&libraries=places"></script>
		<script>
		var myLatLng = { lat: 24.967991899999998, lng: 121.19168279999998 };
		var mapOptions = {
		  center: myLatLng,
		  zoom: 7,
		  mapTypeId: google.maps.MapTypeId.ROADMAP,
		};

		//create map
		var map = new google.maps.Map(document.getElementById("googleMap"), mapOptions);
		var directionsDisplay = new google.maps.DirectionsRenderer();
		directionsDisplay.setMap(map);
  	</script>
  </body>
</html>