Rails.application.routes.draw do
  resources :locations
  resources :scores
  # get    '/weather/:id',          to: 'weather#show'
  # get    '/weather',          to: 'weather#edit'
  devise_for :users  
  root to: "locations#index"
end
