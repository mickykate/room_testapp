Rails.application.routes.draw do
  device_for :users, controllers: {
    sessions: 'users/sessions',
    registraions: 'users/registraions',
  }
  
  get 'rooms/index'
  devise_for :users
  root 'toppages#index'

  resources :rooms, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
