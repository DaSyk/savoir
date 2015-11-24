class FixForeignIdOnLocation < ActiveRecord::Migration
  def change
    remove_column :locations, :region_id
    add_column :locations, :region_id, :integer
  end
end
