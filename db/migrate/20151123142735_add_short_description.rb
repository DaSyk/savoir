class AddShortDescription < ActiveRecord::Migration
  def change
    add_column :locations, :houses_count, :integer, default: 0
    add_column :regions, :houses_count, :integer, default: 0
    add_column :houses, :short_description, :text
  end
end
