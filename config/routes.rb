Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users
      # post 'users/login' => 'users#login'
      # get 'users/login' => 'users#login'
      # resources :users, only: [:show]
      resources :games
      resources :holes
      resources :scores
      resources :rounds
      resources :sessions, only: [:create, :destroy]
      get "logged_in", to: "sessions#logged_in"
      delete "logout", to: "sessions#logout"
      # root to:'static#home'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
