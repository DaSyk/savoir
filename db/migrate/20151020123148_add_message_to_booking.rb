class AddMessageToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :message, :text
    change_column :houses, :description, :text
  end
end
