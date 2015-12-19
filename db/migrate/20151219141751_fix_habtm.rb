class FixHabtm < ActiveRecord::Migration
  def change
    add_column :suits, :activated, :string, :default => "Ja"
  end
end
