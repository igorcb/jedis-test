Rails.application.routes.draw do
  resources :municipes, except: [:destroy]
  get '/', to: 'municipes#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"  
end
