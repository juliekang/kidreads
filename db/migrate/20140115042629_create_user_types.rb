class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      t.string :label, :null => false
      t.string :description, :null => false

      t.timestamps
    end
    add_index :user_types, :label, :unique => true
  end
end
