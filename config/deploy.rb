require "bundler/capistrano"

# general settings
set :application, "thecoopermen"

# source control settings
set :scm, :git
set :deploy_via, :remote_cache
set :repository,  "git@github.com:thecoopermen/website.git"

# server settings
set :user, 'deploy'
set :use_sudo, false
set :deploy_to, "/var/apps/#{application}"
set :bundle_without, [:darwin, :development, :test]

# supress missing directory warnings
set :normalize_asset_timestamps, false

server 'thecoopermen.com', :app, :web, :db, :primary => true

# need to change how start, stop, and restart work since we're using passenger
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after 'deploy:finalize_update' do
  # make symlinks to server-specific config files
  run "ln -s #{shared_path}/config/*.yml #{release_path}/config/"
end
