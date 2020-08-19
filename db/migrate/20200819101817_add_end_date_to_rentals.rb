class AddEndDateToRentals < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :end_date, :date
  end
end
