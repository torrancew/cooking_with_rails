web:    bundle exec unicorn -c config/unicorn.rb -p $PORT config.ru
drb:    env RAILS_ENV=test bundle exec spork
worker: bundle exec stalk config/jobs.rb
