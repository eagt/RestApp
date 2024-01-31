Rails.application.routes.draw do



  resources :restaurantes do 
    member do
      get 'sell'  # This will create a route for the custom action in the posts controller
    end
    resources :members do
      collection do
        post :invite
      end 
    end
    resources :products
    resources :tables
  end
  
  devise_for :users, controllers: {
    confirmations: 'confirmations',
    registrations: 'users/registrations'
  }

 

  root 'pages#home'
  get 'pages/dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
