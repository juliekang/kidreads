class AddGoodreadsIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :goodreads_id, :string
  end
end
