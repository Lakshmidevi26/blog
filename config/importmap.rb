# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "jquery", to: "jquery-rails"
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.0.3/lib/assets/compiled/rails-ujs.js"
