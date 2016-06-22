class AddCostAddWeekToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :cost_add_week, :integer
  end
end
