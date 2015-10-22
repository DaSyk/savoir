class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.string :description
      t.integer :region_id

      t.timestamps
    end
  end
end
