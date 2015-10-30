class Fix1 < ActiveRecord::Migration
  def change
    remove_column :houses, :region_id
    add_column :houses, :location_id, :integer
  end
end
