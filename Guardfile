guard :bundler do
  watch(%r{^Gemfile(\.lock)?$})
end

guard :spork, :cucumber_env => { 'RAILS_ENV' => 'test' }, :rspec_env => { 'RAILS_ENV' => 'test' } do
  watch(%r{^Gemfile(\.lock)?$})
  watch(%r{^config/(application|environment)\.rb$})
  watch(%r{^config/(environments|initializers)/.+\.rb$})

  watch(%r{^spec/factories/.+\.rb$})
  watch(%r{^spec/spec_helper\.rb$})  { :rspec }
  watch(%r{^features/support/$})     { :cucumber }
end

guard :rspec, :cli => '--drb', :version => 2 do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})    { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^spec/spec_helper\.rb$}) { 'spec' }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                              { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                    { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^spec/support/(.+)\.rb$})                     { 'spec' }
  watch(%r{^config/routes\.rb$})                          { 'spec/routing' }
  watch(%r{^app/controllers/application_controller\.rb$}) { 'spec/controllers' }

  watch(%r{^app/controllers/(.+)_(controller)\.rb$}) do |m|
    ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"]
  end

  # Capybara request specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$}) { |m| "spec/requests/#{m[1]}_spec.rb" }
end


guard :cucumber, :cli => '--drb' do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})                      { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
end

