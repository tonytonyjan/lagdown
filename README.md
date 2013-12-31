Coding Rules
============

Create a new model
------------------

### Shortcut

    rails g model car name:string description:text
    rake db:migrate
    rails g model admin/car name:string description:text --migration=false
    rm app/models/admin.rb
    rails g scaffold_controller admin/cars name:string description:text --assets=false --helper=false --jbuilder=false

config/routes.rb

    Lagdown::Application.routes.draw do
      namespace :admin do
        resources :cars
      end
    end

### Detail

1.  Generate model.

        rails g model car name:string description:text

2.  Migrate database after the file generated in `db/migrate/TIMESTAMP_create_cars.rb` was tuned.

        rake db:migrate

3.  Generate admin model.

        rails g model admin/car name:string description:text --migration=false
    

4.  Remove useless namespace file.

        rm app/models/admin.rb
    

5.  Generate scaffold controller for admin pages.

        rails g scaffold_controller admin/cars name:string description:text --assets=false --helper=false --jbuilder=false
    

6.  Edit `config/routes.rb`.

        Lagdown::Application.routes.draw do
          namespace :admin do
            resources :cars
          end
        end
    