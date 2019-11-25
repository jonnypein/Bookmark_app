Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :movies, only: [:index, :show] do
    resources :recommendations, only: [:create]
  end
  resources :recommendations, only: [:destroy]
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
