Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :movies, only: [:index, :show] do
    resources :recommendations, only: [:create]
    resources :bookmarks, only: [:create]

  end

  resources :tags, only: [:destroy]

  resources :bookmarks, only: [:destroy, :index]

  resources :recommendations, only: [:destroy, :index] do
    resources :tags, except: :destroy
  end


  resources :users, only: [:show, :index, :edit] do
    member do
      get "follow", to: "users#follow"
      patch "unfollow", to: "users#unfollow"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


