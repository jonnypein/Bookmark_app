Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :movies, only: [:index, :show] do
    resources :recommendations, only: [:create]
  end

  resources :recommendations, only: [:destroy, :index] do
    resources :tags
  end

  resources :users, only: [:show, :index, :edit] do
    member do
      get "follow", to: "users#follow"
      patch "unfollow", to: "users#unfollow"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


