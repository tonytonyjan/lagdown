Lagdown::Application.routes.draw do
  constraints subdomain: false do
    root 'home#index'
    devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}
    get 'select2/tags', format: :json
    get 'select2/results', format: :json
    post 'preview' => 'posts#preview'
    namespace :settings do
      resources :blogs do
        resources :posts, only: %i[new create edit update destroy]
      end
      resource :user, only: %i[edit update]
      resources :categories
    end

    # 使用者個人頁(user)
    get 'users/about' => 'home#about', :as => :about
  end

  constraints(Subdomain) do
    root 'posts#index', as: :blog_root
    resources :posts, only: %i[index show]
    
    # RSS訂閱
    get 'rss' => 'posts#rss'
    # 使用者個人頁
    get 'about' => 'home#about', :as => :profile
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
