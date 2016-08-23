Rails.application.routes.draw do
  # devise_for :users
  root to: 'pages#home'
  resources :profile, only: [:show]

  resources :campaigns, only: [:index, :show]

  namespace :dashboard do
    resources :campaigns, only: [:index, :show, :new, :create, :edit, :update] do
      resources :orders, only: [:create]
    end
    resources :orders, only: [:index, :show, :destroy]
    resources :followings, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
