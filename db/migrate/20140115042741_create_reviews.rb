class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :book_id, :null => false
      t.integer :user_id, :null => false
      t.float :rating, :null => false
      t.text :review

      t.timestamps
    end
    add_index :reviews, :book_id
    add_index :reviews, :user_id
  end
end
