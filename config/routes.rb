# frozen_string_literal: true

Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users

    devise_scope :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end

    root to: 'home#index'

    get '/terms' => 'pages#terms'
    get '/about' => 'pages#about'

    resources :users

    resources :articles do
      resources :comments
    end

    namespace :admin do
      resources :users, only: %i[index create edit update destroy]
    end

    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
  end
end