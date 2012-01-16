require 'bundler/capistrano'
require File.expand_path('../environment', __FILE__)

# Application Name
set :application, 'MongoStalker'

# General Deploy Info
set :repository,    Settings.deploy_config['repository']
set :deploy_to,     Settings.deploy_config['deploy_to']
set :keep_releases, Settings.deploy_config['keep_releases']

# Deploy User information
set :user,     Settings.deploy_config['user']
set :use_sudo, Settings.deploy_config['sudo']

# SCM Settings
set :scm,                   :git
set :deploy_via,            :remote_cache
set :git_enable_submodules, 1

# Servers
server 'uruk.warrentorrance.com', :app, :web, :db

# Hooks
after 'deploy:update', 'deploy:cleanup'

