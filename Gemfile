source 'http://rubygems.org'

gem 'rails',          '3.1.3'
gem 'jquery-rails'
gem 'sass-rails',     '~> 3.1.5'
gem 'meta_search',    '>= 1.1.0.pre'
gem 'activeadmin',    :git => 'https://github.com/gregbell/active_admin.git'
gem 'RedCloth'
gem 'twitter'

group :assets do
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier',     '>= 1.0.3'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'ruby_gntp'
  gem 'spork',        '> 0.9.0.rc'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'foreman'
end

group :darwin do
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
end

group :development do
  gem 'capistrano'
  gem 'annotate'
end

group :production do
  gem 'mysql2'
  gem 'therubyracer'
end