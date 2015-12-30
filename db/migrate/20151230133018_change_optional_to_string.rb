class ChangeOptionalToString < ActiveRecord::Migration
  def change
    remove_column :costs, :optional
    add_column :costs, :optional, :string
  end
end
