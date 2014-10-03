source 'https://rubygems.org'
source 'https://rails-assets.org'
ruby '2.0.0'

gem 'rails', '3.2.14'
gem 'pg', '0.12.2'
gem 'bower-rails', '~> 0.7.1'
gem 'sorcery'
gem 'mandrill-api'
gem 'bcrypt', '~> 3.1.7'
gem 'gon', '~> 5.2.0'

group :production do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end

group :development, :test do
  gem 'rspec-rails', '2.11.0'
  gem 'factory_girl_rails', '~> 4.2.1'
  gem 'dotenv-rails'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
  gem 'rails-assets-bootstrap'
  gem 'rails-assets-angular'
end

gem 'jquery-rails', '2.0.2'

group :test do
  gem 'faker', '~> 1.1.2'
  gem 'capybara', '~> 2.1.0'
  gem 'capybara-webkit'
  gem 'database_cleaner', '~> 1.0.1'
  gem 'launchy', '~> 2.3.0'
  gem 'selenium-webdriver', '~> 2.39.0'
  gem 'email_spec'
end

