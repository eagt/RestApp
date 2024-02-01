// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"

import Rails from "@rails/ujs"
Rails.start()

// Allow users to add a dot in the input dor thousands values
document.addEventListener('input', function (e) {
    var element = e.target;
    if (element.tagName === 'INPUT' && element.type === 'text' && element.dataset.dotSeparator) {
      var value = element.value.replace(/\,/g, '.');
      element.value = value;
    }
  });
