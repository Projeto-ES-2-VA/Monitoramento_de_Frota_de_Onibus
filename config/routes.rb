Rails.application.routes.draw do


  root "home#index"

  resources :onibuses
  resources :rota
  get 'rotas/buscar_por_placa', to: 'rota#buscar_por_onibus', as: 'buscar_por_onibus'
  get 'rotas/resultados_por_placa', to: 'rota#buscar_por_onibus_resultados', as: 'buscar_por_onibus_resultados'

end
