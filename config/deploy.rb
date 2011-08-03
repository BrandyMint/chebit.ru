# -*- coding: utf-8 -*-
namespace :vlad do
  set :application, "chebit.ru"
  set :domain, "wwwdata@chebit.ru"
  set :rails_env, "production"
  set :deploy_to, "/home/wwwdata/chebit.ru"
  # set :revision,  current_revision # 'master/HEAD'
  set :keep_releases,	3
  set :repository, 'git@github.com:dapi/chebit.ru.git'
  set :web_command, "sudo apache2ctl"

  set :copy_files, [ 'config/database.yml' ]
  set :symlinks, copy_files

  # for rails
  set :shared_paths, {
    'log'    => 'log',
    'system' => 'public/system',
    'pids'   => 'tmp/pids',
    'bundle' => 'vendor/bundle',
    'config/database.yml' => 'config/database.yml',
    'config/settings' => 'config/settings',
    'config/settings.yml' => 'config/settings.yml'
  }

  desc "Full deployment cycle"
  task "deploy2" => %w[
      vlad:update
      vlad:bundle_install
      vlad:migrate
      vlad:start_app
      vlad:hoptoad
      vlad:cleanup
    ]

  namespace :db do
    task :clone2 do
      run "ssh wwwdata@chebit.ru 'cd /home/wwwdata/chebit.ru/current/; pg_dump -U danil -c -O chebit_orionet' > ./tmp/production_dump.sql"
      sh 'cat ./tmp/production_dump.sql | psql chebit_development'
      Rake::Task["db:migrate"].invoke
    end
  end
end
