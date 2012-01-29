require 'grit'

namespace :heroku do
  desc 'Configure the Heroku environment'
  task :configure do
    puts 'Setting Heroku environment variables'
    system 'heroku config:add RAILS_ENV=heroku RACK_ENV=heroku'

    puts 'Configuring Heroku application add-ons...'
    puts '  Removing basic logging add-on...'
    system 'heroku addons:remove logging:basic >/dev/null 2>&1'
    puts '  Installing expanded logging add-on...'
    system 'heroku addons:add logging:expanded >/dev/null 2>&1'
    puts '  Installing MongoLab MongoDB add-on...'
    system 'heroku addons:add mongolab:starter >/dev/null 2>&1'
    puts '  Installing SSL Piggyback add-on...'
    system 'heroku addons:add ssl:piggyback >/dev/null 2>&1'
  end

  desc 'Deploy current branch to Heroku'
  task :deploy do
    repo   = ::Grit::Repo.new( ::Rails.root )
    branch = repo.head.name
    system "git push heroku #{branch}:master -f"
  end
end
