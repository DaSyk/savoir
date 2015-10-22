class AddGenderToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :gender, :string
  end
end
