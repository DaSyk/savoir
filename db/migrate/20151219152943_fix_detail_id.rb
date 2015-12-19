class FixDetailId < ActiveRecord::Migration
  def change
    add_column :facilities, :detail_id, :integer
  end
end
