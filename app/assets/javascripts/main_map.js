//----------------- INITIALISATION DE LA MAP ---------------------\\

let initialZoom = 12;
// [lat,long]
let coordLille= [50.632971, 3.058585];
// main_map se refere à l'id de la div dans laquelle la map est contenue
let mymap = L.map('main_map').setView(coordLille, initialZoom);


//----------------- LES DIFFERENTES LAYERS FOND DE CARTE ---------------------\\
let mainLayer = L.tileLayer("https://{s}.tile.openstreetmap.se/hydda/full/{z}/{x}/{y}.png",{maxZoom :100}).addTo(mymap);
let culturalLayer = L.tileLayer("https://{s}.tile.openstreetmap.se/hydda/full/{z}/{x}/{y}.png",{maxZoom :100});
let gardenLayer = L.tileLayer("https://{s}.tile.openstreetmap.se/hydda/full/{z}/{x}/{y}.png",{maxZoom :100});

//-------------------------------- LES MARKERS (appel des données, association des données à des markers)
let cities = gon.cities; 

// Magasins de seconde main
console.log(gon.cities_cultural);
let cities_secondhand_array = gon.cities_secondhand

cities_secondhand_array.forEach(function(place){
   let marker = L.marker([place.latitude ,place.longitude], {title:"Magasin de seconde-main"}).bindPopup("N'achetez plus neuf, venez découvrir les belles pièces de seconde-main dans notre sélection de friperies");
   marker.addTo(mymap);
});

//Endroits culturels
let cities_cultural_array = gon.cities_cultural

cities_cultural_array.forEach(function(place){
   let marker = L.marker([place.latitude ,place.longitude], {title:"Lieu de partage"}).bindPopup('Venez y prendre un café');
   marker.addTo(mymap);
});

//Jardins partagés
let cities_garden_array = gon.cities_garden

cities_garden_array.forEach(function(place){
   let marker = L.marker([place.latitude ,place.longitude], {title:"Jardin partagé de quartier"}).bindPopup('Pour jardiner avec ses voisins');
   marker.addTo(mymap);
});



// Control layer
L.control.layers({
'Main' : mainLayer

}).addTo(mymap);