Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "products#index"
  resources :products
  post "products/:id/charge" => "products#charge", as: "charge"
  get "users/:id/favorites" => "users#favorites", as: "user_favorite"
  get "users/:id/buys" => "users#buys", as: "user_buy"
  get "users/:id/solds" => "users#solds", as: "user_sold"
  post "/favorite/:id" => "favorites#favorite", as: "favorite"
  delete "/favorite/:id" => "favorites#del_favorite", as: "del_favorite"
  get "search" => "products#search"
  devise_for :users, skip: :session
  devise_scope :user do
      get 'login' => 'devise/sessions#new', as: :new_user_session
      post 'login' => 'devise/sessions#create', as: :user_session
      delete 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  end
  resources :users, only: [:show]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
