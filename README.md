Coding Guides
=============

Create a new model
------------------

    rails g model Post title:string
    rake db:migrate
    rails g scaffold Admin::Post title:string --migration=false --parent=Post
    rm app/models/admin.rb