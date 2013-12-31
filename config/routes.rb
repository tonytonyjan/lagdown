Lagdown::Application.routes.draw do
  root 'home#index'
  devise_for :users
  get 'select2/tags', format: :json
  get 'select2/results', format: :json

  namespace :admin do
    root 'home#index'
    devise_for :administrators, class_name: Admin::Administrator, singular: :administrator
    resources :administrators
    resources :users
    resources :posts
  end
end
