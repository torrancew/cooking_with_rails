require 'stalker'

module Jobs
  Dir["#{File.expand_path('../jobs', __FILE__)}/*.rb"].each { |job| require job }
end

