json.id @book.id
json.title @book.title
json.image_url @book.image_url
json.isbn @book.isbn
json.author @book.author
json.genre @book.genre
json.pub_year @book.pub_year
json.num_pages @book.num_pages
json.reading_level @book.reading_level

json.book_status BookStatus.find_by_book_id_and_user_id(@book.id, current_user.id)

# json.current_user_review Review.find_by_book_id_and_user_id(@book.id, current_user.id)

json.ratings_count @book.ratings_count
json.rating @book.average_rating

json.reviews(@reviews) do |review|
  json.id review.id
  json.user_id review.user_id
  json.username review.user.username
  json.rating review.rating
  json.content review.content
  json.date review.updated_at
end