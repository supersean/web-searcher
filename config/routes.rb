Rails.application.routes.draw do
  get 'user/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  resources :users do
    resources :crawlers
  end
end
