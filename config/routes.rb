Rails.application.routes.draw do
  root "products#index"
  devise_for :users
  resources :users, only: [:show]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
