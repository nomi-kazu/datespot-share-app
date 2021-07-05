Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:index, :create, :destroy]
    resource :like, only: [:show, :create, :destroy]
  end

  resources :questions, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :answers, only: [:index, :create, :destroy]
  end

  resources :accounts, only: [:index, :show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
    resources :followings, only: [:index]
    resources :followers, only: [:index]
  end

  resources :favorites,     only: [:index]
  resources :populars,      only: [:index]
  resources :search,        only: [:index]
  resources :tags,          only: [:index]
  resources :taglists,      only: [:index]
  resources :prefectures,   only: [:index]
  resources :timelines,     only: [:index]
  resources :messages,      only: [:create]
  resources :rooms,         only: [:create, :show, :index]
  resource  :profile,       only: [:show, :update]
  resources :notifications, only: [:index]
end
