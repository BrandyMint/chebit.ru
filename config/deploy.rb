# -*- coding: utf-8 -*-

set :application, "chebit.ru"
set :domain, "chebit.ru"
set :rails_env, "production"
#  set :ssh_flags, "-p 222"
set :deploy_to, "/usr/local/www/chebit.ru"
#set :revision,              'master'
set :keep_releases,	3
# set :rsync_flags, "--rsh ssh"
set :repository, 'ssh://dapi.orionet.ru/home/danil/code/chebit/.git/'

# for rails
set :shared_paths, {
  'log'    => 'log',
  'system' => 'public/system',
  'pids'   => 'tmp/pids',
  'bundle' => 'vendor/bundle'
}

local_link='dapi.orionet.ru:/home/danil/code/chebit'
  
namespace :vlad do

  desc "Full deployment cycle"
  task "deploy" => %w[
      vlad:update
      vlad:migrate
      vlad:start_web
    ]
  
  # # Add an after_update hook
  # #
  remote_task :update do
    Rake::Task['vlad:share_configs'].invoke
    Rake::Task['vlad:bundle'].invoke
  end

  #
  # Fixes vlad/passenger bad latest_release path
  #
  remote_task :start_app => :fix_release
  remote_task :fix_release do
    puts "fix passenger release path"
    #set :latest_release, current_release
    set :deploy_timestamped, false # Такой метод больше понравился :)
  end

  remote_task :update_gems do
    run "sudo gem update --system"
    #run "cd #{current_release}; bundle install --deployment"
  end
  
  # remote_task :after_setup do
  #   # Link to shared resources, if you have them in .gitignore
  #   run "mkdir #{deploy_to}/logs"
  # end
  
  #  #
  #  # The after_update hook, which is run after vlad:update
  #  #
  desc "Share config files (database.yml and app_config.yml)"
  remote_task :share_configs do
    puts "Share config files"
    run "cd #{current_release}/config/; scp #{local_link}/config/database.yml ."
  end

  desc "Exec bundle --deployment"
  remote_task :bundle do
    puts "Exec bundle"
    #run "cd #{current_release}; sudo bundle install --deployment" # На FreeBSD только через sudo
    run "cd #{current_release}; sudo bundle --without development --without test" # На FreeBSD только через sudo
    # chown current_release after bundle
  end

end
