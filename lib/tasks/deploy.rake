namespace :deploy do
  desc "Deploy to the heroku instance"
  task :heroku do
    `git checkout -b deploy_heroku master`
    Rake::Task['assets:precompile'].invoke

    `git add public/`
    `git commit -m 'Asset precompilation via deploy:heroku task'`
    `git push heroku deploy_heroku:master -f`
    `git checkout master`
    `git branch -D deploy_heroku`
  end
end
