class RemoveColumnsCars < ActiveRecord::Migration
  def change
  	remove_column :cars, :make, :string
  end
end
