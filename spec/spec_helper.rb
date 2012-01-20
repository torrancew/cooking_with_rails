require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  ENV['RAILS_ENV'] ||= 'test'

  require 'rails/mongoid'
  Spork.trap_class_method( ::Rails::Mongoid, :load_models)

  require File.expand_path('../../config/environment', __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'factory_girl_rails'
  require 'database_cleaner'

  # Configure DatabaseCleaner
  DatabaseCleaner.strategy = :truncation

end

Spork.each_run do
  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

  RSpec.configure do |config|
    ## Mock Framework
    config.mock_with :rspec

    ## Mix in Factory Girl
    config.include FactoryGirl::Syntax::Methods

    ## Clean Database entries
    config.before( :each ) { DatabaseCleaner.clean }

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false
  end
end

