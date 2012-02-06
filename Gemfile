source :rubygems

# Rails
gem 'rails',   '3.1.3'
gem 'bundler', '>= 1.0.0'

# DB/Queueing Connectors
gem 'stalker',  '~> 0.9.0'
gem 'mongoid',  '~> 2.4.1'
gem 'bson_ext', '~> 1.5.2', :require => 'bson'

# Send mails
gem 'actionmailer'

# Use Grit for git interactions
gem 'grit', '~> 2.4.1', :require => false

# Use BCrypt & Settingslogic
gem 'bcrypt-ruby',   '~> 3.0.0', :require => 'bcrypt'
gem 'settingslogic', '~> 2.0.8'

# Support JSON & XML
gem 'json',     '~> 1.6.5'
gem 'nokogiri', '~> 1.5.0'

# Act as API
gem 'acts_as_api', '~> 0.3.11'

# Use SimpleForm for form building
gem 'simple_form'

# Use HAML & JQuery
gem 'haml-rails',   '~> 0.3.4'
gem 'jquery-rails', '~> 1.0.19'

# Client-side (javascript) validations
gem 'client_side_validations',         '~> 3.2.0.beta.2'
gem 'client_side_validations-mongoid', '~> 2.4.0.beta.2'
gem 'client_side_validations-simple_form'

# Use unicorn as the web server
gem 'unicorn', '~> 4.1.1', :require => false

# Use Pry as the Rails Console
gem 'pry-rails', '~> 0.1.1'

# Airbrake error reporting (optional bundler group)
gem 'airbrake', :group => :airbrake, :require => false

# NewRelic monitoring (optional bundler group)
gem 'newrelic_rpm', :group => :newrelic

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  # Less CSS Asset gems
  gem 'less-rails-bootstrap', '~> 2.0.4' 

  # Core Asset gems
  gem 'coffee-rails',   '~> 3.1.1'
  gem 'yui-compressor', '~> 0.9.6'
end

group :test do
  # Use Spork for an RDB instance
  gem 'spork', '~> 0.9.0.rc', :require => false

  # Use RSpec & Cucumber
  gem 'rspec-rails',    '~> 2.8.1', :require => false
  gem 'cucumber-rails', '~> 1.2.1', :require => false

  # Use Factory Girl & Database Cleaner
  gem 'database_cleaner',   '~> 0.7.1', :require => false
  gem 'factory_girl_rails', '~> 1.5.0', :require => false

  # To use debugger
  # gem 'ruby-debug19', :require => 'ruby-debug'
end

group :development do
  # Use foreman to run the dev environment
  gem 'foreman', '~> 0.33.0', :require => false

  # Deploy to Heroku
  gem 'heroku', '~> 2.18.1', :require => false

  # Use Guard to automate testing and whatnot during development
  gem 'guard',          :require => false
  gem 'libnotify',      :require => false
  gem 'rb-inotify',     :require => false
  gem 'guard-spork',    :require => false
  gem 'guard-rspec',    :require => false
  gem 'guard-cucumber', :require => false
  gem 'guard-bundler',  :require => false

  # Deploy with Capistrano
  gem 'capistrano',         '~> 2.9.0', :require => false
  gem 'capistrano_colors',  '~> 0.5.5', :require => false

  # Allow ERB->HAML conversion
  gem 'hpricot',     '~> 0.8.5', :require => false
  gem 'ruby_parser', '~> 2.3.1', :require => false
end

