class AddDefaultPicToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :default_pic, :boolean
  end
end
