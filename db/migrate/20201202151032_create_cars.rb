class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :year
      t.string :make
      t.string :model
      t.string :color
      t.string :transmission
      t.string :body_style
      t.timestamps null: false
    end
  end
end
