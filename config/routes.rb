Rails.application.routes.draw do
  resources :species do
    resources :sightings, except: [:show]
  end

  resources :regions

  resources :sightings, only: [:index]

  resources :report
end
