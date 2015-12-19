class Renames < ActiveRecord::Migration
  def change
    rename_table :facilites, :facilities
    rename_table :facilites_houses, :facilities_houses
  end
end
