json.array!(@book_statuses) do |book_status|
  json.id book_status.book_id
  book = @books.find(book_status.book_id)
  json.title book.title
  json.image_url book.image_url
  json.status book_status.status
end
