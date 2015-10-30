class Fix2 < ActiveRecord::Migration
  def change
    remove_column :periods, :cost_add_nights
    add_column :periods, :season, :string
  end
end
