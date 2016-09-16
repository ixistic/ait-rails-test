Rails.application.routes.draw do
  resources :books
  resources :categories
  devise_for :sessions
  get 'home/index'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
