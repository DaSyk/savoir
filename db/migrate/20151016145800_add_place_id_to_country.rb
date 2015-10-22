class AddPlaceIdToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :place_id, :integer
  end
end
