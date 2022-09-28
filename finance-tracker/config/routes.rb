Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get "my_portofolio", to: "users#my_portfolio"
  get "search_stock", to: "stocks#search"
  post "users_stock", to: "users_stock#create"
  delete "users_stock", to: "users_stock#destroy"
  get "my_friends", to: "users#my_friends"
  get "search_friend", to: "users#search"
end
