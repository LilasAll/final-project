let overlayTileLayer = "https://{s}.tile.openstreetmap.se/hydda/full/{z}/{x}/{y}.png"

let initialZoom = 12;

// [lat,long]
let coordLille= [50.632971, 3.058585];

// main_map se refere à l'id de la div dans laquelle la map est contenue
let mymap = L.map('main_map').setView(coordLille, initialZoom);

L.tileLayer(overlayTileLayer,{maxZoom :100}).addTo(mymap);

// on définit les pins : 
console.log(gon.cities_secondhand);

let cities = gon.cities;

let cities_secondhand_array = gon.cities_secondhand

cities_secondhand_array.addTo(mymap)

cities_secondhand_array.forEach(function(secondhand){
   let marker = L.marker([place.latitude ,place.longitude]);
   marker.addTo(mymap);
});