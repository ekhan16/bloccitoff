Rails.application.routes.draw do
  devise_for :users
  resources :items

  resources :users


  get 'about' => 'welcome#about'

  get 'index' => 'welcome#index'

  root to: 'welcome#index'
end
