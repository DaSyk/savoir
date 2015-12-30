class AddOrderNoToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :order_no, :integer
  end
end
