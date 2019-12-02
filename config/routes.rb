Rails.application.routes.draw do
  get 'events/indew'
  get 'events/show'
  get 'events/create'
  devise_for :users

    root 'static#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
