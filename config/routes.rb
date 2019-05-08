Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root 'posts#index'
  resources :users, only: [:index, :show]
  # resources :folders do
  #   resources :posts
  # end

  resources :posts

  # resources :categories, only: [:index, :show]
end
