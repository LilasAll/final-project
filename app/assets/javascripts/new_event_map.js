
var theMarker = {};
var lat;
var lon;

let initialZoom = 13;
// [lat,long]
let coordLille= [50.632971, 3.058585];

var map = L.map('new-event-map').setView(coordLille, initialZoom);
let mainLayer = L.tileLayer('https://{s}.tile.openstreetmap.se/hydda/full/{z}/{x}/{y}.png').addTo(map);

onClickMap();


document.getElementById("lat-form").value = 50.632971;
document.getElementById("lgn-form").value = 3.058585;


function onClickMap()
{
map.on('click',function(e)
  {
     lat = e.latlng.lat;
     lon = e.latlng.lng;
     if (theMarker != undefined)
     {
       map.removeLayer(theMarker);
     };
    theMarker = L.circle([lat,lon], {
    color: 'red',
    fillColor: '#f03',
    fillOpacity: 0.5,
    radius: 400
		}).addTo(map);
		
    document.getElementById("lat-form").value = lat;
    document.getElementById("lgn-form").value = lon;
  });
}
