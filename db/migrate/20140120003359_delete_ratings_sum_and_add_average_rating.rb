class DeleteRatingsSumAndAddAverageRating < ActiveRecord::Migration
  def change
    add_column :books, :average_rating, :float
    remove_column :books, :ratings_sum
  end
end
