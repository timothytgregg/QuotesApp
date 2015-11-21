Rails.application.routes.draw do

  root to: 'welcome#index'

  devise_for :users

  get 'welcome/index'
#nice nested resources!
  resources :quotes do
    resources :favorites
  end
#shallow ... nifty!
  resources :authors do
    resources :quotes, shallow: true
  end

  resources :texts

  resources :collections do
    resources :favorites
  end

end
