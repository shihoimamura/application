Rails.application.routes.draw do
  root 'users#new'
  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :posts do
    collection do
      post :confirm
    end
  end
end
