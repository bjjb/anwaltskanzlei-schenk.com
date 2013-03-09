load 'deploy' if respond_to?(:namespace) # cap2 differentiator

set :application, 'anwaltskanzlei-schenk.com'
set :user, "bjjb"
server application, :web, :app, :db, primary: true
set :scm, "git"
set :repository, "git://github.com/bjjb/anwaltzkanzlei-schenk.com.git"
set :branch, "master"
set :deploy_to, "/home/#{user}/www/#{application}"
set :use_sudo, false

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
