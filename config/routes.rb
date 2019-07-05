Rails.application.routes.draw do
  # get 'posts/new'
  # get 'posts/create'
  # get 'posts/index'
  root 'static_pages#home'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :posts, only: [:new, :create, :index]
  resources :users
end
