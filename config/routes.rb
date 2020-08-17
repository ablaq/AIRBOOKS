Rails.application.routes.draw do
  get 'books/index'
  get 'books/show'
  get 'books/new'
  get 'books/edit'
  get 'books/my_books'
  devise_for :users
  root to: 'pages#home'

  get "books", to: "books#index"
  get "books/:id", to: "books#show", as: :book
  get "books/new", to: "books#new", as: :new_book
  post "books", to: "books#create"
  get "books/:id/edit", to: "books#edit", as: :edit_book
  patch "books/:id", to: "books#update", as: :update_book
  delete "books/:id", to: "books#destroy"

  get "my_books", to: "books#my_books", as: :my_books

  get "rentals", to: "rentals#index"
  get "my_rentals", to: "rentals#my_rentals", as: :my_rentals
  get "books/:book_id/rentals/new", to: "rentals#new", as: :new_rental
  get "books/:book_id/rentals/:id/edit", to: "rentals#edit", as: :edit_rental
  patch "books/:book_id/rentals/:id", to: "rentals#update", as: :update_rental

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
