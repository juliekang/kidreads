json.array!(@book_statuses) do |book_status|
  json.id book_status.book_id
  book = @books.find(book_status.book_id)
  json.title book.title
  json.image_url book.image_url
  json.isbn book.isbn
  json.author book.author
  json.genre book.genre
  json.pub_year book.pub_year
  json.num_pages book.num_pages
  json.reading_level book.reading_level
  json.status book_status.status
end
  