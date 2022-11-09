class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :body, null: false
      t.integer :rating, null: false
      t.bigint :user_id, null: false, index: true
      t.bigint :restaurant_id, null: false, index: true

      t.timestamps
    end

    add_foreign_key :reviews, :users, column: :user_id
    add_foreign_key :reviews, :restaurants, column: :restaurant_id

  end
end
