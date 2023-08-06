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

  resources :books, except: %i[show], controller: 'books/books'

  resources :content_tags, except: %i[show], controller: 'content_tags/content_tags'

  namespace :media do
    resources :pictures, except: %i[show], controller: 'pictures'
    resources :scans, except: %i[show], controller: 'scans'
    resources :documents, except: %i[show], controller: 'documents'
  end

  mount ActionCable.server => '/cable'

  # Defines the root path route ("/")
  root to: 'home#index'
end
