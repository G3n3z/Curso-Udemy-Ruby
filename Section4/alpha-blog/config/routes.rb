Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home'
  get 'pages/about', to: "pages#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy ]
  get 'signup', to:"users#new"
  resources :users, except: [:new]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete "logout", to:"sessions#destroy"
  resources :categories, except: [:destroy]

end
