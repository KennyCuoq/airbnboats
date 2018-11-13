
import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

require('mapbox-gl/dist/mapbox-gl.css');
const mapboxgl = require('mapbox-gl/dist/mapbox-gl.js');

const mapElement = document.getElementById('map');

if (mapElement) { // only build a map if there's a div#map to inject into
  mapboxgl.accessToken = process.env.MAPBOX_API_KEY; // API key from `.env`
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/light-v9'
  });

  const markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);
  })

     const findBounds = (coordatinates) => {
     let longitudes = coordatinates.map(coordinate => coordinate.lng).sort((a, b) => a - b);
     let latitudes = coordatinates.map(coordinate => coordinate.lat).sort((a, b) => a - b);
     return [[longitudes[longitudes.length - 1], latitudes[latitudes.length - 1]], [longitudes[0], latitudes[0]]];
   };

  if (markers.length === 0) {
    map.setZoom(1);
  } else if (markers.length === 1) {
    map.setZoom(4);
    map.setCenter([markers[0].lng, markers[0].lat]);
  } else {
    bounds = findBounds(markers);
    map.fitBounds(bounds, {duration: 0, padding: 75});
  }
}

autocomplete();



