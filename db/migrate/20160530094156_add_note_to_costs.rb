class AddNoteToCosts < ActiveRecord::Migration
  def change
    add_column :periods, :note, :text
  end
end
