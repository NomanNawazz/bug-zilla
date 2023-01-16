# README

This README would normally document whatever steps are necessary to get the
application up and running.
Things you may want to cover:
# Ruby version
  - Ruby Version-2.7.2
  - Rails Version-5.2.8.0
  - Postgres Version-12.11
# System dependencies
  - Postgresql - For Database
  - Stripe - For implementing Payement functionality
  - Devise - For implementing authentication
  - Cloudinary - For Uploading Media on Cloud
  - Bootstrap - For Making UI User Friendly
  - Pundit - To make policies
# Configuration
  - cloudinary - Test, Development, Production
# Getting started
  To get the Rails server running locally:
  - Clone this repo
  - `bundle install` to install all req'd dependencies
  - `rails db:migrate` to make all database migrations
  - `rails s` to start the local server

# Herokuapp Deployment Link
Name: Usman Nasir
Link: https://bugzillabb.herokuapp.com/

# HEROKU Deployment Process

Once installed, the heroku command is available from your terminal. Log in using your Heroku account’s email address and password:

 heroku login

 <!-- Now run these commands in your Rails app directory to initialize and commit your code to Git: -->

$ git init
$ git add .
$ git commit -m "init"

%  You can verify everything was committed correctly by running:

$ git status

 On branch main
 nothing to commit, working tree clean
 Deploy your application to Heroku

$ heroku create
$ git config --list --local | grep heroku
$ git push heroku main
$ heroku run rake db:migrate

 <!-- Visit your application -->

$ heroku ps:scale web=1
$ heroku ps
$ heroku open

%  View logs

$ heroku logs
$ heroku logs --tail

% Run Rake commands

$ heroku run rake db:migrate

gem 'puma'
Then run
$ bundle install

% To use the Procfile locally, you can use heroku local.

$ echo "RACK_ENV=development" >>.env
$ echo "PORT=3000" >> .env
$ echo ".env" >> .gitignore
$ git add .gitignore
$ git commit -m "add .env to .gitignore"

$ mkdir -p tmp/pids
$ touch tmp/pids/.gitkeep

<!-- heroku local -->

$ git add .
$ git commit -m "use puma via procfile"
$ git push heroku main || git push heroku master

$ heroku ps

