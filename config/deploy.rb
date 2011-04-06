# -*- coding: utf-8 -*-
namespace :vlad do

  set :application, "chebit.ru"
  set :domain, "wwwdata@aydamaster.ru"
  set :rails_env, "production"
  set :deploy_to, "/home/wwwdata/chebit.ru"
  set :revision,  current_revision # 'master/HEAD'
  set :keep_releases,	3
  set :local_link, 'danil@dapi.orionet.ru:/home/danil/code/chebit'
  set :repository, 'ssh://danil@dapi.orionet.ru/home/danil/code/chebit/.git/'
  set :web_command, "sudo apache2ctl"

  # for rails
  set :shared_paths, {
    'log'    => 'log',
    'system' => 'public/system',
    'pids'   => 'tmp/pids',
    'bundle' => 'vendor/bundle'
  }


  set :copy_files, {
    '/config/database.yml' => '/config/database.yml',
    '/config/settings*'    => '/config/',
  }

  desc "Full deployment cycle"
  task "deploy" => %w[
      vlad:update
      vlad:copy_files
      vlad:bundle_install
      vlad:migrate
      vlad:start_app
      vlad:cleanup
    ]

  remote_task :update do
    puts revision
    Rake::Task['vlad:copy_files'].invoke
    Rake::Task['vlad:bundle_install'].invoke
  end
end
