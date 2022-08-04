Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts
  resources :tasks
  resources :pets
  get 'search' => 'posts#search'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
