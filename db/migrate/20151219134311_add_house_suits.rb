class AddHouseSuits < ActiveRecord::Migration
  def change
    create_table "houses_suits", :id => false do |t|
      t.column "house_id", :integer, :null => false
      t.column "suit_id",  :integer, :null => false
    end
  end
end
