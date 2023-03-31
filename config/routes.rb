Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :users do
    resources :crawlers do
      resources :crawl_results, only: %i[create index show]
    end
  end
end
