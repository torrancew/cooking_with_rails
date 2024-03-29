rails_env = ENV['RAILS_ENV'] || 'development'

# Enable and set these to run the worker as a different user/group
#unicorn_user  = ''
#unicorn_group = ''
#user unicorn_user, unicorn_group

worker_processes = rails_env == 'production' ? 3 : 1

## Load the app before spawning workers if not in development
preload_app = rails_env == 'development' ? false : true

# How long to wait before killing an unresponsive worker
timeout 30

#pid '/var/run/diaspora/diaspora.pid'
#listen '/var/run/diaspora/diaspora.sock', :backlog => 2048

# Ruby Enterprise Feature
if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end


before_fork do |server, worker|
  # If using preload_app, enable this line
  #ActiveRecord::Base.clear_active_connections!

  old_pid = '/var/run/diaspora/diaspora.pid.oldbin'
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end


after_fork do |server, worker|
  # If using preload_app, enable this line
  #ActiveRecord::Base.establish_connection

  # Enable this line to have the workers run as different user/group
  #worker.user(user, group)
end
