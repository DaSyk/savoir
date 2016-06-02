class AddNoteToPricing < ActiveRecord::Migration
  def change
	remove_column :periods, :note
    add_column :pricings, :note, :text
  end
end
