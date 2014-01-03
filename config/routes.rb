Lagdown::Application.routes.draw do
  get "posts/index"
  root 'home#index'
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  get 'select2/tags', format: :json
  get 'select2/results', format: :json

  constraints(Subdomain) do
    resources :posts
  end 

  namespace :admin do
    root 'home#index'
    devise_for :administrators, class_name: Admin::Administrator, singular: :administrator
    resources :administrators
    resources :users
    resources :posts
    resources :blogs
  end
end
