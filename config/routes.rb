Rails.application.routes.draw do
  devise_for :users
  resources :items

  resources :users


  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
