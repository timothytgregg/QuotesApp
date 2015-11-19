Rails.application.routes.draw do

  root to: 'welcome#index'

  devise_for :users

  get 'welcome/index'

  resources :quotes do
    resources :collection_quotes
  end

  resources :authors do
    resources :quotes, shallow: true
  end

  resources :texts

  resources :collections do
    resources :quotes
  end

end
