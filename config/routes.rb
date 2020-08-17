Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "my_books", to: "books#my_books", as: :my_books
  resources :books do
    resources :rentals, only: [:new, :create, :update, :edit]
  end
  get "rentals", to: "rentals#index"
  get "my_rentals", to: "rentals#my_rentals", as: :my_rentals
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
