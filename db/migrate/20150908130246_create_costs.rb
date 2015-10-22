class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.string :name
      t.string :ctype
      t.integer :amount
      t.boolean :optional
      t.integer :pricing_id

      t.timestamps
    end
  end
end
