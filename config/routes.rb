Rails.application.routes.draw do
  # get 'weapons/index'
  # get 'weapons/show'
  # get 'weapons/new'
  # get 'weapons/create'
  # get 'weapons/edit'
  # get 'weapons/update'
  # get 'weapons/destroy'
  devise_for :users
  root to: 'weapons#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :weapons

  resources :weapons do
    resources :bookings, only: [ :create ]
  end

  resources :bookings, only: [ :index, :show, :update, :edit, :destroy ] do
    resources :reviews, only: [ :new, :create ]
  end
end
