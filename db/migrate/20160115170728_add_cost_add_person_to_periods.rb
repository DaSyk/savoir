class AddCostAddPersonToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :cost_add_person, :integer
  end
end
