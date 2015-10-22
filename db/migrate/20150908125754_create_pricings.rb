class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.integer :n_people
      t.integer :surcharge_night
      t.integer :surcharge_week
      t.integer :house_id

      t.timestamps
    end
  end
end
