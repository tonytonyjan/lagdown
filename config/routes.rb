Lagdown::Application.routes.draw do
  root 'home#index'
  devise_for :users

  namespace :admin do
    root 'home#index'
    devise_for :administrators, class_name: Admin::Administrator, singular: :administrator
    resources :administrators
    resources :users
    resources :posts
  end
end
