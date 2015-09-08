# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'generate_favicon'
set :repo_url, 'https://github.com/zgs225/generate-favicon.git'
set :deploy_to, '/home/yuez/www/generate-favicon.com'

# pm2
set :app_command, %W(app.js --name #{fetch(:application)})
set :dist_path, "#{current_path}/dist/server/"

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'pm2:restart'
  end

  after :publishing, :restart
end
