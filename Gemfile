source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: [:development, :test]
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Forms made easy for Rails
gem 'simple_form'

# Makes http fun! Also, makes consuming restful web services dead easy.
gem 'httparty', '~> 0.13.3'

# Decorators/View-Models for Rails Applications
gem 'draper', '~> 1.3'

# Font Awesome gives you scalable vector icons that can instantly be customized
gem 'font-awesome-sass', '~> 4.2.0'

# Pagination library for Rails
gem 'will_paginate', '~> 3.0.6'

# Integrates the Twitter Bootstrap pagination component with will_paginate 
gem 'will_paginate-bootstrap'

# Flexible authentication solution for Rails with Warden
gem 'devise'

# Cron jobs in Ruby
gem 'whenever', :require => false

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :production do
  gem 'pg'
  gem 'unicorn'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'guard-rspec'
  gem 'shoulda'
end

group :test do
  gem 'faker', '~> 1.4.3'
  gem 'capybara', '~> 2.4.3'
  gem 'database_cleaner', '~> 1.3.0'
  gem 'launchy', '~> 2.4.2'
  gem 'selenium-webdriver', '~>2.43.0'
end