Rails.application.routes.draw do
  resources :motorista
  root "home#index"
  get 'rotas/buscar_por_placa', to: 'rota#buscar_por_onibus', as: 'buscar_por_onibus'
  get 'rotas/resultados_por_placa', to: 'rota#buscar_por_onibus_resultados', as: 'buscar_por_onibus_resultados'

  resources :onibuses
  resources :rota


end
