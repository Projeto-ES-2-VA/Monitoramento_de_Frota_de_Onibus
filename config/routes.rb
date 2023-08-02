Rails.application.routes.draw do
  resources :rota

  root "home#index"

  resources :onibuses


end
