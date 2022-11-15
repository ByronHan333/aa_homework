class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      # username:string password_digest:string session_token:string
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false, index: {unique: true}

      t.timestamps
    end

  end
end
