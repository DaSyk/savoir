class AddActivatedToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :activated, :boolean
  end
end
