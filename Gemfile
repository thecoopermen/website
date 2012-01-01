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
  gem 'factory_girl_rails'
  gem 'ruby_gntp'
  gem 'spork',        '> 0.9.0.rc'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
end

group :development do
  gem 'capistrano'
  gem 'annotate'
end

group :production do
  gem 'mysql2'
  gem 'therubyracer'
end