json.array!(@book_statuses) do |book_status|
  book = book_status.book
  json.id book.id
  json.title book.title
  json.image_url book.image_url
  json.isbn book.isbn
  json.author book.author
  json.genre book.genre
  json.pub_year book.pub_year
  json.num_pages book.num_pages
  json.reading_level book.reading_level

  json.book_status book_status

  json.current_user_review @reviews.find { |r| r.book_id == book.id }

  json.ratings_count book.ratings_count
  json.rating book.average_rating
end
