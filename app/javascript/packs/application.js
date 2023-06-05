// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application" 
import '@fortawesome/fontawesome-free/js/all'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('DOMContentLoaded', function() {
    let tag_name = document.querySelector("#tag_name")
    tag_name.addEventListener('change', function() {
        console.log(tag_name.value)
        tag_name.parentNode.submit();
    })
})