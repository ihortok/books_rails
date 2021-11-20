Rails.application.routes.draw do
  devise_for :users

  root to: 'books#index'

  resources :users, only: %i[index show]
  resources :authors
  resources :books
  resources :book_reactions, only: %i[create update]
  resources :lists do
    member do
      post :add_book
      post :delete_book
    end
  end

  namespace :admin do
    resources :users, only: %i[edit update destroy]
  end
end
