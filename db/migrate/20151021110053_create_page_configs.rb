class CreatePageConfigs < ActiveRecord::Migration
  def change
    create_table :page_configs do |t|

      t.timestamps
    end
  end
end
