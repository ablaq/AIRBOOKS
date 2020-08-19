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
    @rental.save
    redirect_to my_rentals_path
  end

  def edit
    @rental = Rental.find(params[:id])
    @book = Book.find(params[:book_id])
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.update(rental_params)
    redirect_to my_rentals_path
  end

  def my_rentals
    @rentals = Rental.all
  end

  def destroy
    @rental = Rental.find(params[:id])
    if @rental.user = current_user
      @rental.destroy
      redirect_to my_rentals_path
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end

end
