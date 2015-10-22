class CreateSuitabilities < ActiveRecord::Migration
  def change
    create_table :suitabilities do |t|
      t.string :pets
      t.string :allergic
      t.string :family
      t.string :horse
      t.string :dog
      t.string :senior
      t.string :baby
      t.string :monteur
      t.string :nsmoker
      t.string :longtime
      t.string :disability

      t.timestamps
    end
  end
end
