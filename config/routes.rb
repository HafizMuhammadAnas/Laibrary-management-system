Rails.application.routes.draw do
  get 'borrowed_books/index'
  resources :borrow_histories
  get 'borrow_histories/ind'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
  }
  resources :users, only: [:index, :destroy, :show]

  root 'home#index'
  resources :books


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
