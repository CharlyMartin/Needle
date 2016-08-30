Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: :registrations }


  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update] do
    post '/followings', to: 'dashboard/followings#create', as: :create_following
  end

  resources :campaigns, only: [:index, :show, :update]

  namespace :dashboard do
    resources :campaigns, only: [:index, :show, :new, :create, :edit, :update] do
      resources :orders, only: [:new, :create]
    end

    resources :orders, only: [:index, :show, :destroy] do
      resources :payments, only: [:new, :create]
    end

    resources :followings, only: [:destroy]
  end
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
