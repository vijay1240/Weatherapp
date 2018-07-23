Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :site, only: :index do
    get :fetch_weather_info, on: :collection
  end
  root :to => 'site#index'
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1 do
      resources :weather, only: [] do
        get :fetch_weather_status, on: :collection
      end
      resources :countries, only: [:index]
      resources :cities, only: [:index]
    end
  end
  
end
