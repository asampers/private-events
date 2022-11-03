Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root to: "events#index"

   devise_for :users
   get '/users', to: "events#index"
end
