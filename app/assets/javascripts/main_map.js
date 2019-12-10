let overlayTileLayer = "https://{s}.tile.openstreetmap.se/hydda/full/{z}/{x}/{y}.png"

let initialZoom = 12;

// [lat,long]
let coordLille= [50.632971, 3.058585];

// main_map se refere à l'id de la div dans laquelle la map est contenue
let mymap = L.map('main_map').setView(coordLille, initialZoom);


L.tileLayer(overlayTileLayer,{maxZoom :100}).addTo(mymap);

// on définit les pins :

let cities = gon.cities; 

// Magasins de seconde main
console.log(gon.cities_cultural);
let cities_secondhand_array = gon.cities_secondhand

cities_secondhand_array.forEach(function(place){
   let marker = L.marker([place.latitude ,place.longitude]);
   marker.addTo(mymap);
});

//Endroits culturels
let cities_cultural_array = gon.cities_cultural

cities_cultural_array.forEach(function(place){
   let marker = L.marker([place.latitude ,place.longitude]);
   marker.addTo(mymap);
});

//Jardins partagés



// Control layer

