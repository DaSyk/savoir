class ChangeToTxt < ActiveRecord::Migration
  def change
	change_column :houses, :description, :text
  end
end
