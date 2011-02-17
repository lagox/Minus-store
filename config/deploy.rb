require 'rubygems'
require 'bundler/capistrano'

set :application, 'theminus'

role :web, 'lithium.locum.ru'
role :app, 'lithium.locum.ru'

set :user, 'hosting_lagox'
set :use_sudo, false
set :rack_env, 'production'
set :rake, '/var/lib/gems/1.8/bin/rake'

set :deploy_to, "/home/hosting_lagox/projects/#{application}"
set :scm, :git
set :deploy_via, :remote_cache
set :repository, 'git://github.com/lagox/Minus-store.git'
set :git_enable_submodules, 1
set :branch, 'master'

set :bundle_cmd, '/var/lib/gems/1.8/bin/bundle'
set :bundle_gemfile, 'Gemfile'
set :bundle_dir, fetch(:shared_path) + '/bundle'
set :bundle_flags, '--deployment --quiet'
set :bundle_without, [ :development, :test ]

set :unicorn_rails, "#{bundle_cmd} exec unicorn_rails"
set :unicorn_conf, "/etc/unicorn/#{application}.lagox.rb"
set :unicorn_pid, "/var/run/unicorn/#{application}.lagox.pid"

namespace :deploy do
  task :start do
    run "cd #{current_path} && #{unicorn_rails} -Dc #{unicorn_conf} -E #{rack_env}"
  end
  task :stop do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && [ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_rails} -Dc #{unicorn_conf} -E #{rack_env}"
  end
end
