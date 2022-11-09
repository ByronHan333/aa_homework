class Alter < ActiveRecord::Migration[7.0]
  def change
    # change_column :users, :username, unique: true
    rename_column :users, :passkey, :password
    remove_column :users, :favorite_cuisine
  end
end
