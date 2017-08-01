Rails.application.routes.draw do
  resources :locations
  get    '/weather',          to: 'weather#show'
  devise_for :users

  root to: "locations#index"
end
