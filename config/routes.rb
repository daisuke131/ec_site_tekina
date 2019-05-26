Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "products#index"
  resources :products, except: [:index]
  post "products/:id/charge", to: "products#charge", as: "charge"
  get "users/:id/favorites", to: "users#favorites", as: "user_favorite"
  get "users/:id/buys", to: "users#buys", as: "user_buy"
  get "users/:id/solds", to: "users#solds", as: "user_sold"
  post "/favorite/:id", to: "favorites#favorite", as: "favorite"
  delete "/favorite/:id", to: "favorites#del_favorite", as: "del_favorite"
  get "search", to: "products#search"
  devise_for :users, skip: :session
  devise_scope :user do
    get "login", to: "devise/sessions#new", as: :new_user_session
    post "login", to: "devise/sessions#create", as: :user_session
    delete "logout", to: "devise/sessions#destroy", as: :destroy_user_session
  end
  resources :users, only: [:show]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
