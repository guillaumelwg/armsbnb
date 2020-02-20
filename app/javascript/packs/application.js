require("@rails/ujs").start()
require("turbolinks").start();
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import { initMapbox } from '../plugins/init_mapbox';
import flatpickr from "flatpickr";

document.addEventListener('turbolinks:load', () => {
  flatpickr(".flatpickr", {});
  initMapbox();
})

