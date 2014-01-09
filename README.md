Coding Rules
============

Create a new model
------------------

    rails g model Post title:string content:text
    rake db:migrate
    rails g scaffold Admin::Post title:string content:text --migration=false --parent=Car

config/routes.rb

    Lagdown::Application.routes.draw do
      namespace :admin do
        resources :cars
      end
    end