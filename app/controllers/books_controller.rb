class BooksController < ApplicationController
  def index
    @books = Book.all
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

  def destroy
    @book = Book.find(params[:id])
    if @book.user = current_user
      @book.destroy
      redirect_to books_path
    end
  end

  def my_books
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :language, :subject, :pages, :summary, :year)
  end

end
