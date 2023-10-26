import { Application } from "@hotwired/stimulus"
require('jquery')
//= require jquery
//= require popper
//= require jquery_ujs
//= require turbolinks
//= require_tree

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
