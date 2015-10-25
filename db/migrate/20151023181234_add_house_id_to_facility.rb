class AddHouseIdToFacility < ActiveRecord::Migration
  def change
    add_column :facilities, :house_id, :integer
  end
end
