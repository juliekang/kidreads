class AddColumnsToBook < ActiveRecord::Migration
  def change
    add_column :books, :image_url, :string
    add_column :books, :ratings_count, :integer
    add_column :books, :ratings_sum, :integer
  end
end
