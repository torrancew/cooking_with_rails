require File.expand_path('../environment', __FILE__)

# Load Bundler's Capistrano support
set :bundle_without, [ :development, :test, :assets ]
set :bundle_roles,   [ :app, :web ]
require 'bundler/capistrano'

# Application Name
set :application, 'MongoStalker'

# General Deploy Info
set :repository,    Settings.deploy_config[:repository]
set :deploy_to,     Settings.deploy_config[:deploy_to]
set :keep_releases, Settings.deploy_config[:keep_releases]

# Deploy User information
set :user,     Settings.deploy_config[:user]
set :use_sudo, Settings.deploy_config[:sudo]

# SCM Settings
set :scm,                   :git
set :deploy_via,            :remote_cache
set :git_enable_submodules, 1

# Servers
server Settings.deploy_config[:server], :app, :web

# Hooks
after 'deploy:update', 'deploy:cleanup'

# Optional Airbrake support
require 'airbrake/capistrano' if Settings.deploy_config[:notify_airbrake]
