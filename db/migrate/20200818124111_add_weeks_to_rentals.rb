class AddWeeksToRentals < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :weeks, :integer
  end
end
