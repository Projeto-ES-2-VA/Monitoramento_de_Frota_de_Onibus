Rails.application.routes.draw do
  root "home#index"
  resources :motorista do
    collection do
      get 'buscar_motorista'
    end
  end
  get 'rotas/buscar_por_placa', to: 'rota#buscar_por_onibus', as: 'buscar_por_onibus'
  get 'rotas/resultados_por_placa', to: 'rota#buscar_por_onibus_resultados', as: 'buscar_por_onibus_resultados'
  get 'onibuses/busca', to: 'onibuses#search', as: 'buscar_onibus'
  resources :onibuses
  resources :rota

end
