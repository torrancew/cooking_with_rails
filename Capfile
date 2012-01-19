# Capistrano v2 differentiator
load 'deploy' if respond_to?( :namespace )

# Load default tasks
load 'config/deploy'

# Use the Rails asset pipeline
load 'deploy/assets'

# Load custom recipes
[
  'vendor/gems/*/recipes/*.rb',
  'vendor/plugins/*/recipes/*.rb',
  'config/recipes/*.rb',
].each do |recipe_path|
  Dir[recipe_path].each { |plugin| load( plugin ) }
end

