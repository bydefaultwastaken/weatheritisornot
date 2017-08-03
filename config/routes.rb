Rails.application.routes.draw do
  resources :locations do
    resources :weather
  end
  # get    '/weather/:id',          to: 'weather#show'
  # get    '/weather',          to: 'weather#edit'
  devise_for :users do
    patch '/users/score',        to: 'weather#update' 
  end  
    root to: "locations#index"
end
