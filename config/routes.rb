Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  ActiveAdmin.routes(self)
  resources :categories, only: [:index, :show]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: :registrations }


  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update] do
    resources :followings, only: [:create, :destroy], shallow: true
  end

  resources :campaigns, only: [:index, :show, :update]

  namespace :dashboard do
    resources :campaigns, only: [:index, :show, :new, :create, :edit, :update] do
      resources :orders, only: [:new, :create]
    end

    resources :orders, only: [:index, :show, :destroy] do
      resources :payments, only: [:new, :create]
    end


  end
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
