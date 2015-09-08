server 'yuez.me', user: 'yuez', roles: %w{app web}

namespace :local do
  desc "Grunt build on local"
  task :build do
    run_locally do
      system 'grunt build'
    end
  end

  desc "Upload build file to server"
  task :publish do
    on roles(:app) do
      upload! './dist/', release_path, :recursive => true
    end
  end
end

namespace :npm do
  desc "Install node js dependencies"
  task :install do
    on roles(:app) do
      within "#{release_path}/dist" do
        execute :cnpm, :install, %w(--production --silent --no-spin)
      end
    end
  end
end

before 'deploy:updated', 'local:build'
after  'deploy:updated', 'local:publish'
after  'deploy:updated', 'npm:install'
