Rails.application.routes.draw do

  resources :gossips do
  resources :comments 
  end

  resources :session, only: [:new, :create, :destroy]
  
  resources :team, only: [:index]
  resources :contact, only: [:index]
  resources :welcome, only: [:show]
  resources :user, only:[:show, :create, :new]
  resources :city, only:[:show]
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Defines the root path route ("/")
  root "gossips#index"
  
end
