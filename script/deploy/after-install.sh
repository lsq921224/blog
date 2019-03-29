#!/bin/bash

DEPLOYMENT_DIR="/home/services/blog"

cd ${DEPLOYMENT_DIR}

cp /home/services/application.yml config/
mkdir -p shared/pids shared/sockets shared/log

bundle install --deployment --without development test
RAILS_ENV=production bundle exec rake assets:clean assets:precompile
RAILS_ENV=production bundle exec rails db:migrate
