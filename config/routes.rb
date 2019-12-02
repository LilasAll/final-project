Rails.application.routes.draw do
  devise_for :users

  root 'static#index'

  get '/', to: 'static#index'
  get '/contact', to: 'static#contact'

  resources :user
  resources :event
  resources :article

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
