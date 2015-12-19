class AddFacilitesHouses < ActiveRecord::Migration
  def change
    drop_table :facilities
    create_table :facilites do |t|
      t.string :name
      t.string :activated

      t.timestamps
    end


    create_table "facilites_houses", :id => false do |t|
      t.column "facility_id", :integer, :null => false
      t.column "house_id",  :integer, :null => false
    end


  end
end
