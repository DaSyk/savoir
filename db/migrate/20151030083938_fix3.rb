class Fix3 < ActiveRecord::Migration
  def change
	add_column :houses, :movie_url, :string
	add_column :houses, :address, :string
	add_column :houses, :latitude, :float
	add_column :houses, :longitude, :float
	
	add_column :periods, :ptype, :string
	
	add_column :pictures, :description, :text
		
  end
end
