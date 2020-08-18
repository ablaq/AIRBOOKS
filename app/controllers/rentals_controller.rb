class RentalsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @rental = Rental.new

  end

  def create
    @rental = Rental.new(rental_params)
    @book = Book.find(params[:book_id])
    @rental.book = @book
    @rental.user = current_user
    @rental.status = "Pending"
    @rental.save!
    redirect_to my_rentals_path

  end

  def edit
  end

  def my_rentals
    @rentals = Rental.all
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :weeks)
  end

end
