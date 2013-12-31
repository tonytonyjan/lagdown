Coding Rules
============

Create a new model
------------------

    rails g model car name:string description:text
    rake db:migrate
    rails g scaffold admin/car name:string description:text --migration=false --assets=false --helper=false --jbuilder=false
    rm app/models/admin.rb

config/routes.rb

    Lagdown::Application.routes.draw do
      namespace :admin do
        resources :cars
      end
    end