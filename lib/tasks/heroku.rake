require 'grit'

namespace :heroku do
  desc 'Configure the Heroku environment'
  task :configure do
    puts 'Setting Heroku environment variables'
    system 'heroku config:add RAILS_ENV=heroku RACK_ENV=heroku'
  end

  desc 'Deploy current branch to Heroku'
  task :deploy do
    repo   = ::Grit::Repo.new( ::Rails.root )
    branch = repo.head.name
    system "git push heroku #{branch}:master -f"
  end
end
