source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails'
gem 'pg'
gem 'puma'
gem 'rack-cache'
gem 'dalli'
gem 'iron_cache' #heroku only
gem 'sidekiq'
# gem 'sinatra', :require=>false
# gem 'slim'
gem "aws-ses", "~> 0.5.0", :require => 'aws/ses'
gem 'sass-rails'
gem 'bootstrap-sass', '~> 2.3.2.2'
gem 'bourbon'
gem 'font-awesome-sass'
gem 'uglifier', '>= 1.3.0'
gem 'haml-rails'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jquery-migrate-rails'
gem 'fancybox2-rails', '~> 0.2.4'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bcrypt-ruby'
gem 'public_activity'
gem 'faker'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'simple_form'
gem 'button_link_to' # Buttons to other resources, within Forms
gem 'honeypot-captcha'
gem 'roadie'
gem 'geocoder'
gem 'capistrano', '~> 2.15.5'
gem 'figaro'

gem 'rdiscount'
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'growl'
  gem 'html2haml'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-inotify', :require=>false
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'spork-rails'
  gem 'fuubar'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
end
group :production do
  gem 'rails_12factor'
end