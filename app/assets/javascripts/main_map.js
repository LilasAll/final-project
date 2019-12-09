let overlayTileLayer = "https://{s}.tile.openstreetmap.se/hydda/full/{z}/{x}/{y}.png"

let initialZoom = 12;

// [lat,long]
let coordLille= [50.632971, 3.058585];

// main_map se refere à l'id de la div dans laquelle la map est contenue
let mymap = L.map('main_map').setView(coordLille, initialZoom);

L.tileLayer(overlayTileLayer,{maxZoom :100}).addTo(mymap);

console.log(gon.cities);

let cities = gon.cities;

let lieux_solidaires = L.marker([50.632807, 3.063476], [50.6242888, 3.072359]);


console.log(lieux_solidaires)

// toujours ajouter addTo(tacarte) sinon ça ne s'affiche pas
lieux_solidaires.addTo(mymap);