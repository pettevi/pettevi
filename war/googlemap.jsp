<!DOCTYPE html>
<head>

<style type="text/css"> 
html{overflow-y:scroll;}

body,p,input {font-family:verdana,helvetica,arial,sans-serif;}

body {font-size:14px;color:#555555;background-color:#f1f1f1;margin:0px;}

a.btn {text-align:center;display:block;width:170px;margin:10px auto;background-color:#f1f1f1;border:1px solid #e3e3e3;padding:8px;border-radius:4px;font-size:16px;color:#555555;text-decoration:none;}
a.btn:hover {background-color:#555555;color:#ffffff;border:1px solid #555555;}

</style>

<style>
  #container {
    width: 950px;
    height: 400px;
    margin: 20px auto;
    padding: 20px;
	border: 1px solid #D7D7D7;
	border-radius:5px;
	position:relative;
  }
  
  #googlecanvas, #bingcanvas, #mapContainer, #mapquestcanvas {
    width: 500px;
    height: 400px;
	padding: 0;
	display: inline-block;
	border: 2px solid #D7D7D7;
	border-radius:1px;
	vertical-align: middle;
  }
  
  #logo { 
	vertical-align: middle;
	display: inline-block;
	width: 330px;
  }
</style>

<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script>
  function initialize() {
    var map_canvas = document.getElementById('map_canvas');
    var map_options = {
      overviewMapControl: false,
      panControl: false,
      rotateControl: false,
      scaleControl: false,
      streetViewControl: false,
      center: new google.maps.LatLng(65.011576, 25.476608),
      zoom: 13,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(googlecanvas, map_options)
  }
  google.maps.event.addDomListener(window, 'load', initialize);
</script>

		<script type="text/javascript" charset="UTF-8" src="http://js.cit.api.here.com/se/2.5.3/jsl.js?with=all"></script>
		<!-- JavaScript for example container (NoteContainer & Logger)  -->
		<script type="text/javascript" charset="UTF-8" src="http://developer.here.com/apiexplorer/examples/templates/js/exampleHelpers.js"></script>

<!-- mapquest -->
<script src="http://open.mapquestapi.com/sdk/js/v7.0.s/mqa.toolkit.js?key=Fmjtd%7Cluur29urnl%2Cax%3Do5-908llr"></script>
 
 <script type="text/javascript">
 
   /*An example of using the MQA.EventUtil to hook into the window load event and execute defined function
   passed in as the last parameter. You could alternatively create a plain function here and have it
   executed whenever you like (e.g. <body onload="yourfunction">).*/
 
   MQA.EventUtil.observe(window, 'load', function() {
    
     /*Create an object for options*/
     var options={
       elt: document.getElementById('mapquestcanvas'),           /*ID of element on the page where you want the map added*/
       zoom: 13,                                      /*initial zoom level of the map*/
       latLng: { lat: 65.011576, lng: 25.476608 },   /*center of map in latitude/longitude */
       mtype: 'osm',                                  /*map type (osm)*/
       bestFitMargin: 0,                              /*margin offset from the map viewport when applying a bestfit on shapes*/
       zoomOnDoubleClick: true                        /*zoom in when double-clicking on map*/
     };
 
     /*Construct an instance of MQA.TileMap with the options object*/
     window.map = new MQA.TileMap(options);
   });
 
 </script>
 
</head>

<body>

<%
if (request.getUserPrincipal() != null) {
    out.println("<h2>Hello, " + request.getUserPrincipal().getName() + "</h2>");
} else {
    out.println("<p>Please sign in first</p>");
}
%>

<!-- Google maps -->
<div id="container">
<div id="logo"><img src="https://www.google.fi/images/srpr/logo11w.png" width="269" height="95"></div>
<div id="googlecanvas"></div>
</div>

<!-- BING maps -->
<div id="container">
<div id="logo"><img src="http://upload.wikimedia.org/wikipedia/commons/b/b1/Bing_logo_%282013%29.svg" width="269" height="95"></div>
<div id="bingcanvas">
<iframe width="500" height="400" frameborder="0" src="http://www.bing.com/maps/embed/viewer.aspx?v=3&cp=65.011576~25.476608&lvl=13&w=500&h=400&sty=r&typ=d&pp=&ps=&dir=0&mkt=en-us&src=SHELL&form=BMEMJS"></iframe>
</div>
</div>

<!-- HERE maps -->
<div id="container">
<div id="logo"><img src="http://d2qw5ca23bep32.cloudfront.net/wp-content/uploads/2013/09/Herelogo.png" width="224" height="137"></div>
<div id="mapContainer"></div>
<div id="uiContainer"></div>
<script type="text/javascript" id="exampleJsSource">
/*	Setup authentication app_id and app_code 
*	WARNING: this is a demo-only key
*	please register for an Evaluation, Base or Commercial key for use in your app.
*	Just visit http://developer.here.com/get-started for more details. Thank you!
*/
nokia.Settings.set("app_id", "DemoAppId01082013GAL"); 
nokia.Settings.set("app_code", "AJKnXv84fjrb0KIHawS0Tg");
// Use staging environment (remove the line for production environment)
nokia.Settings.set("serviceMode", "cit");

// Get the DOM node to which we will append the map
var mapContainer = document.getElementById("mapContainer");
// Create a map inside the map container DOM node
var map = new nokia.maps.map.Display(mapContainer, {
	// initial center and zoom level of the map
	center: [65.011576, 25.476608],
	zoomLevel: 13,
	components: [
		// ZoomBar provides a UI to zoom the map in & out
		new nokia.maps.map.component.ZoomBar(), 
		// We add the behavior component to allow panning / zooming of the map
		//new nokia.maps.map.component.Behavior(),
		// Creates UI to easily switch between street map satellite and terrain mapview modes
		//new nokia.maps.map.component.TypeSelector(),
		// Creates a toggle button to show/hide traffic information on the map
		//new nokia.maps.map.component.Traffic(),
		// Creates a toggle button to show/hide public transport lines on the map
		//new nokia.maps.map.component.PublicTransport(),
		// Creates a toggle button to enable the distance measurement tool
		//new nokia.maps.map.component.DistanceMeasurement(),
		// Shows a min-map in the bottom right corner of the map
		//new nokia.maps.map.component.Overview(),
		/* Shows a scale bar in the bottom right corner of the map depicting
		 * ratio of a distance on the map to the corresponding distance in the real world
		 * in either kilometers or miles
		 */ 
		//new nokia.maps.map.component.ScaleBar(),
		/* Positioning will show a set "map to my GPS position" UI button
		 * Note: this component will only be visible if W3C geolocation API
		 * is supported by the browser and if you agree to share your location.
		 * If you location can not be found the positioning button will reset
		 * itself to its initial state
		 */
		//new nokia.maps.positioning.component.Positioning(),
		// Add ContextMenu component so we get context menu on right mouse click / long press tap
		//new nokia.maps.map.component.ContextMenu(),
		// ZoomRectangle component adds zoom rectangle functionality to the map
		//new nokia.maps.map.component.ZoomRectangle()
	]
});
</script>
</div>

<!-- mapquest maps -->
<div id="container">
<div id="logo"><img src="http://o.aolcdn.com/os/mapquest/brand/PNG/MapQuest_Logo_Medium.png"></div>
<div id="mapquestcanvas"></div>
</div>
</div>



<a class="btn" href="index.jsp" target="_top">Back to start page</a>

</body>
</html>