source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


group :development, :test do
  gem 'sqlite3'
end
group :production do
  gem 'pg'
end

gem 'yaml_db'
gem 'clearance'
gem "haml"
gem "paperclip"
gem "forgery", "~> 0.3.12"
gem 'faker'
gem 'jquery-rails', '>= 1.0.12'
gem 'tire'
gem 'json'
gem 'bcrypt-ruby', :require => 'bcrypt'
gem 'stripe'
gem "nested_form", :git => "git://github.com/ryanb/nested_form.git"
gem 'aws-s3'
gem 'aws-sdk'
gem 'ransack'
gem 'heroku'
gem 'whenever', :require => false

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end


gem "rspec-rails", :group => [:test, :development]
group :test do
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
end

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
