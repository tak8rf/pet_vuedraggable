require 'sidekiq/web'

Rails.application.routes.draw do

  resources :cards
  get 'users/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    invitations: 'users/invitations'
  }
  root 'posts#index'
  resources :posts
  resources :pets
  resources :families
  resources :users, only: :show
  get 'search' => 'posts#search'
  post '/tasks/:id/done' => 'tasks#done',   as: 'done'

  resources :lists do
    member do
      patch :move
    end
  end
  resources :cards do
    member do
      patch :move
    end
  end
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

