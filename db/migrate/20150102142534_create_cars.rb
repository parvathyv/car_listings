class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
    	t.integer :manufacturer_id, null: false
      t.date :year, null: false
      t.string :color, null: false
      t.float :mileage, null: false
      t.text :description
      t.timestamps
    end
  end
end
