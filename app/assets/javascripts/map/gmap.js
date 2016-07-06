
$(window).load(function() {
  loadScript();
});

var map;

function initialize() {

  var mapOptions = {
          center: new google.maps.LatLng(34.8021, 38.9968),
          zoom: 2,
          mapTypeId: google.maps.MapTypeId.NORMAL,
          panControl: true,
          scaleControl: false,
          streetViewControl: true,
          overviewMapControl: true
        };

      var myLatLng = {lat: 39.7497187, lng: -105.0043516};

        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            title:"Hello World!"
        });

        // initializing map
        map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);
        // To add the marker to the map, call setMap();
        // marker.setMap(map);
  }


  function loadScript() {
	console.log("map loading ...");
  var script = document.createElement('script');
  script.type = 'text/javascript';
  //'https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyBJYFdplGeKUUEmGZ-vL4ydiSZ09Khsa_o&sensor=false&libraries=drawing'
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
    //'&v=3.14'+
    //'&key=AIzaSyBJYFdplGeKUUEmGZ-vL4ydiSZ09Khsa_o'+
    '&libraries=drawing'+
    '&callback=initialize';
  document.body.appendChild(script);
}
