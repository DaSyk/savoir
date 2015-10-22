class AddHtypeToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :htype, :string
  end
end
