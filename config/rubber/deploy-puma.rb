
namespace :rubber do

  namespace :puma do

    rubber.allow_optional_tasks(self)

    before "deploy:stop", "rubber:puma:stop"
    after "deploy:start", "rubber:puma:start"
    after "deploy:restart", "rubber:puma:reload"

    desc "Stops the puma server"
    task :stop, :roles => :puma do
      rsudo "if [ -f /var/run/puma.pid ]; then cd #{current_path} && bundle exec pumactl -P /var/run/puma.pid stop; fi"
    end

    desc "Starts the puma server"
    task :start, :roles => :puma do
      rsudo "cd #{current_path} && bundle exec puma -C #{current_path}/config/puma.rb"
    end

    desc "Restarts the puma server"
    task :restart, :roles => :puma do
      stop
      start
    end

    desc "Reloads the puma web server"
    task :reload, :roles => :puma do
      rsudo "if [ -f /var/run/puma.pid ]; then cd #{current_path} && bundle exec pumactl -P /var/run/puma.pid stop; else cd #{current_path} && bundle exec puma -C #{current_path}/config/puma.rb; fi"
    end

  end

end
