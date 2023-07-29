# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  resources :test2s
  resources :tests
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users,
             controllers: {
               registrations: 'registrations'
             },
             path: 'auth',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               password: 'forgotten-password',
               confirmation: 'verification',
               unlock: 'unblock',
               registration: 'register',
               sign_up: 'sign-up'
             }

  resources :users, except: %i[show new create], controller: 'users/users'

  # Defines the root path route ("/")
  root to: 'home#index'
end
