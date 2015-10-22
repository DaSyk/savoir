class ChangeDescriptionInPicture < ActiveRecord::Migration
  def change
    rename_column :pictures, :description, :name
  end
end
