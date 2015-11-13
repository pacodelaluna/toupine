# ATTENTION: bien verifier l'URL de destination ainsi que le repository GIT.
# Ligne a commenter suivant BL ou BA: 163, 170, 183

# PACOSTRANO Light Version 1.4
# Capistrano tasks simplifying the Blank-based application deployment
# ThinkDry Technologies - 2010

#require "rvm/capistrano"
#require "bundler/capistrano"

##############################
set :application, 'toupine'
##############################

# CAPISTRANO INSTALLATION :
# To install the gem, do : sudo gem install capistrano
# To setup Capistrano for your project, in the root of your project, do : capify .
# (This will create the file config/deploy.rb and the file ./Capfile that specify the location of the recipes used in that project. By default, it is just that config/deploy.rb file and the Capistrano basic recipes.)

# SCRIPT CONFIGURATION :
# To use that script, after to have installed and configured your project, copy/paste that file inside your config/deploy.rb file.
# Set your application name above and it will set all the others variable you need to deploy your application.
# You can overwrite but you will have to manage all the possible consequences (new url bind, new apache conf, ...).
# By default, the application is deployed on development server but you can deploy on the production one appliying the option like that : cap deploy SERVER=production. But please be sure of your version before to do that.
#
# BASIC DEPLOYMENT :
# cap deploy
#
# More :
# cap debugging:tail_logs (To get the 3OO last lines of the current envrionment logs file)
# cap background:restart (To reload the Backgroundrb daemon)
#
# Important : to come back to the previous release (in case of current release broken)
# cap deploy:rollback
#
# More informations about tasks available :
# cap -T
#
# Enjoy da funk !!

# Application configuration
#set :rails_env, 'development'
#set :app_name, "#{application}"

set :app_folder, '/home/www'
set :domain, "176.31.245.28"
server "176.31.245.28", :app, :web, :db, :primary => true
set :default_environment, {'PATH' => "/home/gdsn/.rvm/rubies/ruby-2.1.5/bin/:$PATH"}

# Servers
set :port, 6060
set :use_sudo, false
set :user, 'gdsn'

# Repository
set :scm, :git
set :repository, "https://github.com/pacodelaluna/toupine.git"
set :repository_cache, "git_cache_paco"
set :deploy_via, :remote_cache

set :deploy_to, "/home/www/toupine"
set :ssh_options, { :forward_agent => true }
set :rvm_type, :user

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
    #run "sudo /etc/init.d/passenger restart coquins"
  end
	# Defining the tasks to do after the deploy one
  after "deploy", "deploy:symlink_shared", "deploy:restart", "deploy:cleanup"

  [:start, :stop].each do |t|
    desc "#{t.to_s.capitalize} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end

  #set :config_files, 'config/database.yml,config/customs/action_mailer.yml,config/customs/sa_config.yml,config/customs/google_analytics.yml'

  task :symlink_shared do
    run "rm -rf #{release_path}/public/spree"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/secrets.yml #{release_path}/config/secrets.yml"
    run "ln -nfs #{shared_path}/public/spree #{release_path}/public/"
    # Hack because Precompilation not Automated
    run "ln -nfs #{shared_path}/public/assets #{release_path}/public/"
  end
end

namespace :assets do
  task :precompile do
    run "cd #{release_path} && rvm use ruby-2.1.5 && rvm gemset use spreetoupine && bundle exec rake assets:precompile RAILS_ENV=production"
  end
end

namespace :debugging do
	desc "Run Production Log Analyzer"
	task :planalyze do
		stream("pl_analyze #{current_release}/log/#{rails_env}.log")
	end

	desc "Print the end of the current environment log file"
	task :tail_logs do
		stream("tail -n 300 #{current_release}/log/#{rails_env}.log")
	end

end