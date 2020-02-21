import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder'

const mapElement = () => {

 return document.getElementById('map');
}

const buildMap = () => {
  console.log('coucou')
  mapboxgl.accessToken = mapElement().dataset.mapboxapikey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/couzix/ck6w98jm70q0i1ir2y0696q32'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0});
};

const initMapbox = () => {
  if (mapElement()) {
    const map = buildMap();
    const markers = JSON.parse(mapElement().dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken, mapboxgl: mapboxgl }));
  }
};

export { initMapbox };

