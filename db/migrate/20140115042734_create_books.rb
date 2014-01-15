class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title, :null => false
      t.string :author, :null => false
      t.integer :pub_year
      t.string :genre
      t.integer :num_pages
      t.float :reading_level

      t.timestamps
    end
    add_index :books, :isbn, :unique => true
    add_index :books, :author
    add_index :books, :genre
  end
end
