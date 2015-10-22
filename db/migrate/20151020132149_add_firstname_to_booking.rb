class AddFirstnameToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :firstname, :string
  end
end
