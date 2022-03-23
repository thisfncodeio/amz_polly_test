source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'
gem 'bootstrap', '~> 5.1.0'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'sassc-rails', '>= 2.1.0'
gem 'jquery-rails'
gem "font-awesome-rails"
gem 'font-awesome-sass', '~> 5.12.0'
gem 'owlcarousel-rails', '~> 1.1', '>= 1.1.3.3'
gem 'jquery-ui-rails'
gem "mixitup-rails"
gem 'dropbox_api'
gem 'sendgrid-ruby'
gem 'sendgrid-actionmailer'
gem 'slack-notifier'
gem 'starwars'
gem 'rspec'
gem 'dad_jokes'
gem 'json', '~> 2.6', '>= 2.6.1'
## -- API Section -- ##
# Figaro API protection
gem 'figaro'
# For Twilio API
gem 'twilio-ruby', '~> 5.61.0'
gem 'aws-sdk-polly'
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
#Addressy makes it easy to fetch real addresses for your testing/demoing needs.
gem 'addressy'
# gem to convert addresses into lat/long
gem 'geocoder'

gem 'dropbox_api'

# Bonus
gem 'invisible_captcha'
## ----------------- ##

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.6'
# Use mysql2 as the database for Active Record
gem 'mysql2', '~> 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.11'
gem 'devise'
gem 'rails-controller-testing'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
gem 'rails_admin', '~> 2.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'secondbase', '~> 2.1'
gem 'swapi', '~> 0.0.2'
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'
gem 'pg', '~> 1.2', '>= 1.2.3'
gem "zendesk_api"
gem 'newrelic_rpm'
gem 'tatooine'
gem 'swgem', '~> 1.0'
gem 'rspec-activemodel-mocks'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
   gem 'rspec-rails', ">= 3.9.0"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', '~> 3.16', require: false
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-bundler', '>= 1.1.0', require: false
  gem 'capistrano-rvm',     require: false
  gem 'rvm1-capistrano3', require: false
  gem 'capistrano-rbenv'
  gem 'capistrano3-puma'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  gem "webmock"

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]