class AddMultipleToSuitability < ActiveRecord::Migration
  def change
    add_column :suitabilities, :multiple, :string
  end
end
