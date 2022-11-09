class AlterRestaurants < ActiveRecord::Migration[7.0]
  def change
    rename_column :restaurants, :location, :address
    add_index :restaurants, :owner_id
    add_foreign_key :restaurants, :users, column: :owner_id
  end
end
