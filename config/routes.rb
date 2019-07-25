Rails.application.routes.draw do
  root 'passengers#index'
  resources :passengers
  resources :buses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
