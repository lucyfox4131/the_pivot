$(window).load(function() {
//   loadScript();
// });

var map = L.map('mapid').setView([34.8021, 38.9968], 2);

L.tileLayer('https://api.mapbox.com/styles/v1/aweisbro/ciqbqo9ye000zc8m4b163fyin/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiYXdlaXNicm8iLCJhIjoiY2lxYnFqMmVhMDByN2ZvbnAyc2JiZW5tMCJ9.Tq50k78DxpD7g8vXvEvrew', {
    attribution: '&copy; <a href="https://www.mapbox.com/about/maps/">Mapbox</a> &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

var damascus_marker = L.marker([33.5138, 36.2765]).addTo(map);
damascus_marker.bindPopup("<b>Syria</b><br><a href='http://www.rescue.org/crisis-syria-refugees'>Conflict Information</a>");

var mogadishu_marker = L.marker([5.1521, 46.1996]).addTo(map);
mogadishu_marker.bindPopup("<b>Somalia</b><br><a href='https://www.rescue.org/country/somalia'>Conflict Information</a>");

var baghdad_marker = L.marker([33.3128, 44.3615]).addTo(map);
baghdad_marker.bindPopup("<b>Iraq</b><br><a href='https://www.rescue.org/country/iraq'>Conflict Information</a>");

var naypyidaw_marker = L.marker([21.9162, 95.9560]).addTo(map);
naypyidaw_marker.bindPopup("<b>Myanmar (Burma)</b><br><a href='https://www.rescue.org/country/myanmar'>Conflict Information</a>");

var kabul_marker = L.marker([33.9391, 67.7100]).addTo(map);
kabul_marker.bindPopup("<b>Afghanistan</b><br><a href='https://www.rescue.org/country/afghanistan'>Conflict Information</a>");

map.mouseoverZoom.disable();


});
