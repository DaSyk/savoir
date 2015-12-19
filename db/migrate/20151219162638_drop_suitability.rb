class DropSuitability < ActiveRecord::Migration
  def change
    drop_table :suitabilities
  end
end
