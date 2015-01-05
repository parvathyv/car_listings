class AddNonNullCars < ActiveRecord::Migration
  def self.up
    change_column_null :cars, :model, false
  end

  def self.down
    change_column_null :cars, :model, true
  end
end
