Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'user/', to: 'user#index'
  get 'user/:id', to: 'user#show'
  get 'user/:id/posts', to: 'user#show'
  get 'user/:id/posts/:id', to: 'user#show'

  # Defines the root path route ("/")
  # root "articles#index"
end
