Rails.application.routes.draw do
  root 'events#index'
  # resources :passengers do
  #   collection do
  #     get :search
  #   end
  # end

  resources :events do
    resources :buses, module: :events do
      resources :passengers, module: :buses
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
