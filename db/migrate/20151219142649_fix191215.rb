class Fix191215 < ActiveRecord::Migration
  def change
    add_column :suits, :detail_id, :integer
  end
end
