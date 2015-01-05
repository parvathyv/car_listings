Rails.application.routes.draw do
  root 'manufacturers#index'

  resources :manufacturers, only: [:new, :create, :index]

  resources :cars, only: [:new, :create, :index]

end
