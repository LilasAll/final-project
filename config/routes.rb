# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static#index'


  devise_for :users

  resources :events do
    resources :avatars, only: [:create]
    resources :attendances
    

    # Important pour l'admin !
    collection do
      get :toggle_check
    end
  end

  resources :articles do
    resources :avatars, only: [:create]
  #Important pour l'admin !
    collection do
      get :toggle_check
    end
  end

  resources :users

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  resources :admins
  resources :comments, except: [:new, :index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
