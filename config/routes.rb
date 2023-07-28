Rails.application.routes.draw do

  root "home#index"

  resources :onibuses
  resources :rota
  resources :paradas


end
