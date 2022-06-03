lock '~> 3.17.0'

set :application, 'books'
set :repo_url, 'git@github.com:AronnaxSpace/books.git'

set :deploy_to, "/home/deploy/#{fetch :application}"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/uploads', 'storage'

set :keep_releases, 1

set :branch, 'main'
set :passenger_restart_with_touch, true
