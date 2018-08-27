require 'mina/rails'
require 'mina/git'
# require 'mina/rbenv'  # for rbenv support. (https://rbenv.org)
require 'mina/rvm'# for rvm support. (https://rvm.io)
require 'mina/puma'

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :application_name, 'blibrary'
# set :domain, 'ec2-54-159-170-91.compute-1.amazonaws.com'
#set :domain, '127.0.0.1'
set :domain, '10.32.7.218'
set :deploy_to, '/apps/blibrary'
set :repository, 'https://github.com/Sonlan/blibrary'
set :branch, 'master'

set :user, 'slanf'          # Username in the server to SSH to.
# set :port, '1234'
set :port, '222'           # SSH port number.
# Optional settings:
# set :user, 'deploy'          # Username in the server to SSH to.
# set :port, '22'           # SSH port number.
  # set :forward_agent, true     # SSH forward_agent.

# Shared dirs and files will be symlinked into the app-folder by the 'deploy:link_shared_paths' step.
# Some plugins already add folders to shared_dirs like `mina/rails` add `public/assets`, `vendor/bundle` and many more
# run `mina -d` to see all folders and files already included in `shared_dirs` and `shared_files`
# set :shared_dirs, fetch(:shared_dirs, []).push('public/assets')
set :shared_dirs, fetch(:shared_dirs, []).push('log', 'tmp/pids', 'tmp/sockets','upload_file')
set :shared_files, fetch(:shared_files, []).push('config/setting.yml','config/database.yml', 'config/secrets.yml','config/puma.rb')

# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :remote_environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :'rvm:use', 'ruby-1.9.3-p125@default'
  invoke :'rvm:use', 'ruby-2.5.1@default'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  command %(mkdir -p "#{:deploy_to}/#{:shared_path}/upload_file")
  command %(mkdir -p "#{:deploy_to}/#{:shared_path}/tmp/sockets")
  command %(chmod g+rx,u+rwx "#{:deploy_to}/#{:shared_path}/tmp/sockets")
  command %(mkdir -p "#{:deploy_to}/#{:shared_path}/tmp/pids")
  command %(chmod g+rx,u+rwx "#{:deploy_to}/#{:shared_path}/tmp/pids")
  command %[mkdir -p "#{fetch(:shared_path)}/config"]

  # command %[touch "#{fetch(:shared_path)}/config/database.yml"]
  # command %[touch "#{fetch(:shared_path)}/config/secrets.yml"]
  # command %[touch "#{fetch(:shared_path)}/config/puma.rb"]
end
desc "Deploys the current version to the server."
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_create'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        command %{mkdir -p tmp/}
        command %{touch tmp/restart.txt}
        # invoke :'whenever:update'
      end
    end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end

# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
