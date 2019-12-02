Rails.application.routes.draw do

  root 'static#index'

  devise_for :users


  resources :events
  resources :articles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
