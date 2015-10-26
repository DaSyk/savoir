class SetDefaultForActivated < ActiveRecord::Migration
  def change
    change_column :houses, :activated, :boolean, :default => false
  end
end
