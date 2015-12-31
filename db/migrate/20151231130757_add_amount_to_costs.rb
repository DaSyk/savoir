class AddAmountToCosts < ActiveRecord::Migration
  def change
    remove_column :costs, :amount
    add_column :costs, :amount, :float
  end
end
