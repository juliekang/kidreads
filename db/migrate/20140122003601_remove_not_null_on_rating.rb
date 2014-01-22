class RemoveNotNullOnRating < ActiveRecord::Migration
  def change
    change_column :reviews, :rating, :float, :null => true
  end
end
