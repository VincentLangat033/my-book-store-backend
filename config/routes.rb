Rails.application.routes.draw do
  resources :ratings
  resources :bookshelves
  resources :comments
  resources :books # , only: [:create, ]

  resources :users, only: [:update, :destroy]

  get "/me", to: "users#show"
  post "/signup", to: "users#create"

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/myratings", to: "ratings#my_ratings"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

 
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
