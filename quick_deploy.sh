#!/bin/bash


# remember to run chmod +x quick_deploy.sh before using this each time

printf "\n********************\n"
printf "pulling from github"
printf "\n********************\n"
git stash
git pull

chmod +x quick_deploy.sh

printf "\n********************\n"
printf "bundling"
printf "\n********************\n"
bundle install --without development test

printf "\n********************\n"
printf "precompiling assets"
printf "\n********************\n"

RAILS_ENV=production rake assets:precompile

printf "\n********************\n"
printf "killing rails server on port 3001"
printf "\n********************\n"
kill -9 $(lsof -w -n -i tcp:3001 |awk '{print $2}' |grep -v PID)

printf "\n********************\n"
printf "running new migrations"
printf "\n********************\n"

RAILS_ENV=production rake db:migrate

printf "\n********************\n"
printf "starting new rails server on port 3001"
printf "\n********************\n"
nohup rails s -e production -p 3001 ADMIN_KEY=admin ADMIN_PASS=railsclass2workbar &

printf "\n********************\n"
printf "Done!"
printf "\n********************\n"
