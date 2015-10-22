class AddHouseIdToSuitability < ActiveRecord::Migration
  def change
    add_column :suitabilities, :house_id, :integer
  end
end
