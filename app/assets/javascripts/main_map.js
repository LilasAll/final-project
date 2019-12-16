

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

var iconMarkers = new L.FeatureGroup();

// Magasins de seconde main
console.log(gon.cities_cultural);
let cities_secondhand_array = gon.cities_secondhand
let secondhand_icon = L.icon({
     iconUrl: '../assets/secondhand.png',
     iconSize: [30, 30],
     iconAnchor: [22, 38],
     popupAnchor: [-3, -76],
     shadowSize: [68, 95],
     shadowAnchor: [22, 94]
                       });

cities_secondhand_array.forEach(function(place){
   let marker = L.marker([place.latitude ,place.longitude], {icon: secondhand_icon , title:"Magasin de seconde-main"}).bindPopup("N'achetez plus neuf, venez découvrir les belles pièces de seconde-main dans notre sélection de friperies");
   marker.addTo(mymap);
});

//Endroits culturels
let cities_cultural_array = gon.cities_cultural
let community_icon = L.icon({
     iconUrl: '/assets/community.png',
     iconSize: [30, 30],
     iconAnchor: [22, 38],
     popupAnchor: [-3, -76],
     shadowSize: [68, 95],
     shadowAnchor: [22, 94]
    });


cities_cultural_array.forEach(function(place){
   let marker = L.marker([place.latitude ,place.longitude], {icon: community_icon , title:"Lieu de partage"}).bindPopup('Venez y prendre un café');
   marker.addTo(mymap);
});

//Jardins partagés
let cities_garden_array = gon.cities_garden
let garden_icon = L.icon({
     iconUrl: '/assets/event1.jpg',
     iconSize: [40, 40],
     iconAnchor: [22, 38],
     popupAnchor: [-3, -76],
     shadowSize: [68, 95],
     shadowAnchor: [22, 94]
    });

cities_garden_array.forEach(function(place){
   let marker = L.marker([place.latitude ,place.longitude],{title:"Jardin partagé de quartier", icon: garden_icon}).bindPopup('Pour jardiner avec ses voisins');
   marker.addTo(mymap);
});

iconMarkers.addLayer(marker);
iconMarkers.addTo(mymap);

// Control layer
L.control.layers({
'Main' : mainLayer

}).addTo(mymap);


// Légende

grades = ["Car", "ball"],
labels = ["http://datentaeter.de/wp-content/uploads/2016/06/flag_de.png","http://datentaeter.de/wp-content/uploads/2016/06/flag_de.png"];
grades[i] + (" <img src="+ labels[i] +" height='50' width='50'>") +'<br>';

var legend = L.control({position: 'bottomright'});

legend.onAdd = function (mymap) {

var div = L.DomUtil.create('div', 'info legend'),
grades = ["Car", "ball"],
labels = ["http://datentaeter.de/wp-content/uploads/2016/06/flag_de.png","http://datentaeter.de/wp-content/uploads/2016/06/flag_de.png"];

    // loop through our density intervals and generate a label with a colored square for each interval
    for (var i = 0; i < grades.length; i++) {
        div.innerHTML +=
            grades[i] + (" <img src="+ labels[i] +" height='50' width='50'>") +'<br>';
    }

    return div;
};

legend.addTo(mymap);