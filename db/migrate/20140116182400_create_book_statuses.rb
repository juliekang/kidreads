class CreateBookStatuses < ActiveRecord::Migration
  def change
    create_table :book_statuses do |t|
      t.integer :user_id, :null => false
      t.integer :book_id, :null => false
      t.string :status, :null => false

      t.timestamps
    end
    add_index :book_statuses, :user_id
    add_index :book_statuses, :book_id
    add_index :book_statuses, :status
    add_index :book_statuses, [:user_id, :book_id], :unique => true
  end
end
