# frozen_string_literal: true

Rails.application.routes.draw do
  get 'map/index'

  root 'static#index'

  devise_for :users

  get 'search', to: 'events#search'
  get 'search_user', to: 'users#search_user'
      get 'calendar', to: 'calendar#index'


  resources :events do
    resources :avatars, only: [:create]
    resources :attendances

    # Important pour l'admin !
    collection do
      get :toggle_check
    end
  end

  resources :bugs

  resources :articles do
    resources :avatars, only: [:create]
    resources :likes, only: %i[create destroy]
    # Important pour l'admin !
    collection do
      get :toggle_check
    end
  end

  resources :users

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
    # Important pour l'admin !
    collection do
      get :toggle_check
    end
  end

  resources :admins
  resources :comments, except: %i[new index show]
  
  resources :maps

  resources :conversations do
    resources :messages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
