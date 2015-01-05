class AddIndexCars < ActiveRecord::Migration
  def change
    add_index :cars, [:model, :color, :mileage, :year]
  end
end
