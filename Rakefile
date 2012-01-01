#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Website::Application.load_tasks

# annotate models, tests, etc. after every migrations
command = Gem.searcher.find('annotate')
Dir["#{command.full_gem_path}/**/tasks/**/*.rake"].each {|ext| load ext} unless command.nil?
