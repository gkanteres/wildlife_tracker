Rails.application.routes.draw do
  resources :species do
    resources :sightings
  end
end
