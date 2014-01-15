class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :user_type_id, :null => false
      t.string :username, :null => false
      t.string :email, :null => false
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :city
      t.string :state
      t.date :birthday
      t.string :password_digest, :null => false
      t.string :session_token
      t.integer :points

      t.timestamps
    end
    add_index :users, :username, :unique => true
    add_index :users, :email, :unique => true
    add_index :users, :user_type_id
  end
end
