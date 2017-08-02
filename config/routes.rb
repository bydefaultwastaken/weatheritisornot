Rails.application.routes.draw do
  resources :locations do
    resources :weather
  end
  # get    '/weather/:id',          to: 'weather#show'
  # get    '/weather',          to: 'weather#edit'
  devise_for :users

  root to: "locations#index"
end
