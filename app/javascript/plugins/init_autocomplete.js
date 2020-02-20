import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('localisation');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
