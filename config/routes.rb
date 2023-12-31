Rails.application.routes.draw do
  root "players#index"

  devise_for :players, controllers: { sessions: 'players/sessions', registrations: 'players/registrations' }



  resources :players, only: [:index, :show, :update, :edit]
  resources :matches, only: [:index, :update, :edit, :new, :create]

  get 'player_list', to: 'players#player_list'
  get 'matches_list', to: 'matches#matches_list'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
