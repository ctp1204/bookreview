Rails.application.routes.draw do
  root "books#index"

  get "books/show", to: "books#show"
  get "books/find", to: "books#find"
  get "books/searchlike", to: "books#searchlike"
  get "books/search", to: "books#search"
  get "sessions/new"
  get "users/new"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "password_resets/new"
  get "password_resets/edit"
  delete "/logout", to: "sessions#destroy"
  resources :books do
    resources :reviews do
      resources :comments
    end
  end
  resources :users do
    member do
      patch :updaterole
      get :following, :followers
    end
  end
  resources :activities
  post "/like", to: "likes#create"
  delete "/unlike", to: "likes#destroy"
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :relationships, only: [:create, :destroy]
  resources :suggests

  namespace :admin do
    root "static_pages#index"
    resources :books, except: :show
    resources :categories
    resources :users
    resources :suggests
  end
end
