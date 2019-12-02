Rails.application.routes.draw do

  root 'static#index'

  devise_for :users


  resources :events
  resources :articles

  resources :user, only: %i[show index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
