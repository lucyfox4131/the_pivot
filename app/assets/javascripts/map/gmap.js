
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

      // var myLatLng = {lat: 39.7497187, lng: -105.0043516};

        var damascus_marker = new google.maps.Marker({
            position: {lat: 33.5138, lng: 36.2765},
            map: map,
            title:"Damascus"
        });

        var mogadishu_marker = new google.maps.Marker({
            position: {lat: 5.1521, lng: 46.1996},
            map: map,
            title:"Mogadishu"
        });

        var baghdad_marker = new google.maps.Marker({
            position: {lat: 33.3128, lng:44.3615},
            map: map,
            title:"Baghdad"
        });

        var myanmar_marker = new google.maps.Marker({
            position: {lat: 21.9162, lng: 95.9560},
            map: map,
            title:"Myanmar"
        });

        var kabul_marker = new google.maps.Marker({
            position: {lat: 33.9391, lng: 67.7100},
            map: map,
            title:"Kabul"
        });

        var syria_info = createInfoWindow("Syria");
          google.maps.event.addListener(damascus_marker, 'click', function() {
          syria_info.open(map,damascus_marker);
        });

        var somalia_info = createInfoWindow("Somalia");
          google.maps.event.addListener(mogadishu_marker, 'click', function() {
          somalia_info.open(map,mogadishu_marker);
        });

        var iraq_info = createInfoWindow("Iraq");
          google.maps.event.addListener(baghdad_marker, 'click', function() {
          iraq_info.open(map,baghdad_marker);
        });

        var burma_info = createInfoWindow("Burma");
          google.maps.event.addListener(myanmar_marker, 'click', function() {
          burma_info.open(map,myanmar_marker);
        });

        var kabul_info = createInfoWindow("Afghanistan");
          google.maps.event.addListener(kabul_marker, 'click', function() {
          kabul_info.open(map,kabul_marker);
        });

        map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);
          damascus_marker.setMap(map);
          mogadishu_marker.setMap(map);
          baghdad_marker.setMap(map);
          myanmar_marker.setMap(map);
          kabul_marker.setMap(map);

  }

  function createMarker(coords, map, title){
  marker = new google.maps.Marker({
    position: coords,
    map: map,
    title: title
  });
}

  function createInfoWindow(text){
    var infowindow = new google.maps.InfoWindow({
      content: text
    });
    return infowindow;
  }
  // Put the following code in an initialize() function



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
