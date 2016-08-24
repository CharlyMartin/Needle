Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update]

  resources :campaigns, only: [:index, :show]

  namespace :dashboard do
    resources :campaigns, only: [:index, :show, :new, :create, :edit, :update] do
      resources :orders, only: [:create]
    end
    resources :orders, only: [:index, :show, :destroy]
    resources :followings, only: [:create, :destroy]
  end
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
