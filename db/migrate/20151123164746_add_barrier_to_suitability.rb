class AddBarrierToSuitability < ActiveRecord::Migration
  def change
    add_column :suitabilities, :barrier, :string
  end
end
