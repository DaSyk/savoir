class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.date :from
      t.date :to
      t.integer :min
      t.string :min_type
      t.integer :cost_per_night
      t.integer :cost_per_week
      t.integer :cost_add_nights
      t.integer :pricing_id

      t.timestamps
    end
  end
end
