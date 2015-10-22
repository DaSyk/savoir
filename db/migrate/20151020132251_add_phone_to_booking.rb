class AddPhoneToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :phone, :string
  end
end
