Rails.application.routes.draw do

  root 'static#index'

  devise_for :users

  resources :events do
  	resources :avatars, only: [:create]
  	resources :attendances 
  end

  resources :articles do
  	resources :avatars, only: [:create]
  	resources :attendances 
  end


  resources :users, only: [:show, :index]


resources :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
