source 'http://rubygems.org'

gem 'rails',          '3.1.3'
gem 'jquery-rails'
gem 'sass-rails',     '~> 3.1.5'
gem 'meta_search',    '>= 1.1.0.pre'
gem 'activeadmin'

group :assets do
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier',     '>= 1.0.3'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard'
  gem 'guard-rspec'
end

group :development do
  gem 'capistrano'
end

group :production do
  gem 'mysql2'
end