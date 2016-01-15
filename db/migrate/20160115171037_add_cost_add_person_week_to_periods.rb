class AddCostAddPersonWeekToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :cost_add_person_week, :integer
  end
end
