require 'bundler/capistrano' # for bundler support
require_relative 'environments.rb'
set :application, "cjournal"
set :repository,  "git@github.com:jeffreybaird/cjournal.git"

set :user, 'jeff'
set :deploy_to, "/home/#{ user }/#{ application }"
set :use_sudo, false

set :scm, :git

default_run_options[:pty] = true

role :web, "107.170.26.161"                          # Your HTTP server, Apache/etc
role :app, "107.170.26.161"                          # This may be the same as your `Web` server

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
after "deploy","deploy:load_posts"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
 task :load_posts do
   run("cd #{deploy_to}/current && bundle exec rake load_posts")
 end
end
