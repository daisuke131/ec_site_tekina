Rails.application.routes.draw do
  root "products#index"
  resources :products
  post "products/:id/charge" => "products#charge", as: "charge"
  get "users/:id/favorites" => "users#favorites", as: "user_favorite"
  get "users/:id/buys" => "users#buys", as: "user_buy"
  get "users/:id/solds" => "users#solds", as: "user_sold"
  post "/favorite/:id" => "favorites#favorite", as: "favorite"
  delete "/favorite/:id" => "favorites#del_favorite", as: "del_favorite"
  get "search" => "products#search"
  devise_for :users
  resources :users, only: [:show]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
