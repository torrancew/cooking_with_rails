require 'stalker'

module Jobs
  jobs_path = File.expand_path( '../jobs', __FILE__ )
  Dir["#{jobs_path}/*.rb"].each { |job| require job }
end

