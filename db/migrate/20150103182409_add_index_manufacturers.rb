class AddIndexManufacturers < ActiveRecord::Migration
  def change
    add_index :manufacturers, [:name]
  end
end
