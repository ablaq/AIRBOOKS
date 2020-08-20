class BooksController < ApplicationController
  def index
     if params[:global_search].present?
      @books = Book.global_search(params[:global_search])
    else
      @books = Book.all
    end

  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.user = current_user
      @book.save
      redirect_to books_path
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user = current_user
      @book.destroy
      redirect_to books_path
    end
  end

  def my_books
    @books = Book.all
    @rentals = Rental.all
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :language, :subject, :pages, :summary, :year)
  end

end
