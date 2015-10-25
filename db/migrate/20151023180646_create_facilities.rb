class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :internet
      t.string :tv
      t.string :pool
      t.string :garden
      t.string :terrace
      t.string :grill
      t.string :balcony
      t.string :washingmachine
      t.string :dishwasher
      t.string :babybed

      t.timestamps
    end
  end
end
