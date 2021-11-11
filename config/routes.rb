Rails.application.routes.draw do
  root to: 'books#index'
  devise_for :users
  resources :authors
  resources :books
  resources :book_reactions, only: %i[create update]
  resources :lists do
    member do
      post :add_book
      post :delete_book
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
