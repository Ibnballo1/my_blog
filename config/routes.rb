Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'user/', to: 'users#index'
  get 'user/:id', to: 'users#show'
  get 'user/:id/posts', to: 'users#show'
  get 'user/:id/posts/:id', to: 'users#show'

  # Defines the root path route ("/")
  # root "articles#index"
end
