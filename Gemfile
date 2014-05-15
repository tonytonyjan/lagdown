source 'https://rubygems.org'
source 'https://rails-assets.org'
gem 'dynamic_form'
gem 'carrierwave'
gem 'mini_magick'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'devise'
gem 'cancan'
gem 'settingslogic'

# omniauth
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-github'

# paginate
gem 'kaminari'

# assets
gem 'rails-assets-bootstrap'
gem 'rails-assets-select2'
gem 'rails-assets-font-awesome'
gem 'rails-assets-jquery-ui'
gem 'rails-assets-highlightjs'

# form
gem 'simple_form'
gem 'nested_form'

gem 'flowdock'

# markdown
gem 'rdiscount'

group :development, :test do
  gem 'capistrano'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'

  gem 'awesome_print'
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'pry-stack_explorer'
  gem 'pry-debugger'

  gem 'factory_girl_rails', :require => false
  gem "rspec-rails"
end

group :development do
  # can be removed after Rails 4.1
  # https://github.com/rails/rails/commit/6f72a6b53afda51a73af69194ed0060ea5048fa9
  gem "spring"
  gem "spring-commands-rspec"
end

group :test do
  gem 'capybara'
  gem 'simplecov', :require => false
  gem 'ruby-progressbar', github: 'jdelStrother/ruby-progressbar', branch: 'stopstart'
  gem 'fuubar'
  gem "rspec-given"
  gem 'database_cleaner'
  gem 'rspec-fire'
  gem 'timecop'
  gem 'simplecov-rcov'
  gem 'shoulda-matchers'
end