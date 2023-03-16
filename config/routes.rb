Rails.application.routes.draw do
  devise_for :users
  get 'likes/new'
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new create show] do
      resources :comments, only: %i[new create]
      resources :likes, only: %i[create]
    end
  end
end
