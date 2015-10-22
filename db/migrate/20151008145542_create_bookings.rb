class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.string :lastname
      t.integer :house_id

      t.timestamps
    end
  end
end
