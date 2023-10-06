// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// environment.addExternals({
//     "@hotwired/turbo-rails": "commonjs @hotwired/turbo-rails",
//     "controllers": "controllers"
//   })
// import "@hotwired/turbo-rails"
// import "controllers"


import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery
// require('jquery')

//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree