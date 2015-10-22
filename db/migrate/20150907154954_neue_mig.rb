class NeueMig < ActiveRecord::Migration
  def change
	add_column :houses, :size, :integer
	add_column :houses, :n_people, :integer
	add_column :houses, :add_n_people, :integer
  end
end
