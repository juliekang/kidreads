# created with:
# rails g task kidreads fetch_goodreads_children_genre

# References
# See https://github.com/sosedoff/goodreads/blob/master/lib/goodreads/client/books.rb
# https://www.goodreads.com/search.xml?key=jMwSO69zYQ8ngMUfyt7Bow&q=Ender%27s+Game
# https://www.goodreads.com/api#book.show

# Book data collection needs to be a multi-pass process.

# Pass #1 -- collect all books available via the Goodreads Genre search for "children" (there are related genres but that's probably enough for now)
# In "books" table, upsert values for: title, image_url, small_image_url, goodreads_id, publication_year, publication_month, publication_day, publisher, description
# In 'goodreads_metadata' table, upsert values for: id, goodreads_id, ratings_count, text_reviews_count, average_rating
# Note: when the Kidreads user is searching for a book later, the ratings/reviews info from Goodreads can be used as one weighting factor
# Harry Potter has a million reviews, crappy hits like "Children Within Environments: Toward a Psychology of Accident Prevention", have zero.

# Pass #2 -- for each book, look up author and ISBN from Goodreads, if it's new
# In "authors" table: isbn, name, goodreads_author_id
# Note: skip those that say "box set" or where author name is "Unknown Author"

# Pass #3 -- collect grade level info from Amazon somehow, probably by scraping their web UI using Mechanize.
# This can be omitted for MVP.

require 'pp'

namespace :kidreads do
  # desc "Fetch the list of children's books registered with Goodreads."
  # task fetch_goodreads_children_genre: :environment do
  #   # TODO: move these keys out to a non-checked-in config file :)
  #   # These are throwaway creds, so shrug for now.
  #   client = Goodreads::Client.new(:api_key => ENV['GOODREADS_KEY'], :api_secret => ENV['GOODREADS_SECRET'])

  #   page_num = 1
  #   search = client.search_books("children", {:field => "genre", :page => page_num})

  #   # to dump a sample result...
  #   # pp search.results.work[0]

  #   total_hits = 0
  #   while search.results.is_a? Hashie::Mash
  #     hits = 0
  #     new_hits = 0
  #     search.results.work.each do |hit|
  #       # Complains about strong parameters / mass assignment
  #       # unless add deprecated gem 'protected_attributes'
  #       # TODO: figure out how to do an upsert (update or insert)
  #       # in a rake task in Rails 4 properly.
  #       book = Book.where(goodreads_id: hit.best_book.id.to_s).first_or_initialize
  #       book.title = hit.best_book.title
  #       book.author = hit.best_book.author.name
  #       book.pub_year = hit.original_publication_year

  #       total_hits += 1
  #       hits += 1
  #       new_hits += 1 if book.new_record?

  #       book.save!
  #     end

  #     puts "Hits: #{hits}, new hits: #{new_hits}, total hits: #{total_hits}"
  #     page_num += 1
  #     search = client.search_books("children", {:field => "genre", :page => page_num})

  #     # Goodreads API rules stipulate 1 req/sec average load against one API key.
  #     # Note that there are ~4200 pages in the Children genre so it will take ~1.5 hours to store it all.
  #     sleep 1
  #   end
  # end

  desc "For each book in the database that's missing an ISBN, look it up (along with some other metadata) via Goodreads."
  # Sample response:
# "id"=>"3",
#  "title"=>"Harry Potter and the Sorcerer's Stone (Harry Potter, #1)",
#  "isbn"=>"0439554934",
#  "isbn13"=>"9780439554930",
#  "asin"=>"",
#  "image_url"=>"http://d202m5krfqbpi5.cloudfront.net/books/1361572757m/3.jpg",
#  "small_image_url"=>
#   "http://d202m5krfqbpi5.cloudfront.net/books/1361572757s/3.jpg",
#  "publication_year"=>"2003",
#  "publication_month"=>"11",
#  "publication_day"=>"1",
#  "publisher"=>"Scholastic Press",
#  "language_code"=>"en-US",
#  "is_ebook"=>"false",
#  "description"=>
#   "Harry Potter has never played a sport while flying on a broomstick. He's never worn a Cloak of Invisibility, befriended a giant, or helped hatch a dragon. All Harry knows is a miserable life with the Dursleys, his horrible aunt and uncle, and their abominable son, Dudley. Harry's room is a tiny cupboard under the stairs, and he hasn't had a birthday party in ten years.<br><br>But all that is about to change when a mysterious letter arrives by owl messenger: a letter with an invitation to a wonderful place he never dreamed existed. There he finds not only friends, aerial sports, and magic around every corner, but a great destiny that's been waiting for him... if Harry can survive the encounter.",
#  "work"=>
#   {"best_book_id"=>3,
#    "books_count"=>93,
#    "default_chaptering_book_id"=>121121,
#    "default_description_language_code"=>nil,
#    "desc_user_id"=>15822735,
#    "id"=>4640799,
#    "media_type"=>"book",
#    "original_language_id"=>nil,
#    "original_publication_day"=>1,
#    "original_publication_month"=>1,
#    "original_publication_year"=>1997,
#    "original_title"=>"Harry Potter and the Philosopher's Stone",
#    "rating_dist"=>"5:919574|4:438818|3:201022|1:24406|2:44287|total:1628107",
#    "ratings_count"=>2237214,
#    "ratings_sum"=>9772898,
#    "reviews_count"=>2520686,
#    "text_reviews_count"=>37792},
#  "average_rating"=>"4.37",
#  "num_pages"=>"310",
#  "format"=>"Hardcover",
#  "edition_information"=>"",
#  "ratings_count"=>"2165596",
#  "text_reviews_count"=>"32278",
#  "url"=>
#   "http://www.goodreads.com/book/show/3.Harry_Potter_and_the_Sorcerer_s_Stone",
#  "link"=>
#   "http://www.goodreads.com/book/show/3.Harry_Potter_and_the_Sorcerer_s_Stone",
#  "authors"=>
#   {"author"=>
#     [{"id"=>"1077326",
#       "name"=>"J.K. Rowling",
#       "image_url"=>
#        "http://d202m5krfqbpi5.cloudfront.net/authors/1360953982p5/1077326.jpg",
#       "small_image_url"=>
#        "http://d202m5krfqbpi5.cloudfront.net/authors/1360953982p2/1077326.jpg",
#       "link"=>"http://www.goodreads.com/author/show/1077326.J_K_Rowling",
#       "average_rating"=>"4.38",
#       "ratings_count"=>"9276157",
#       "text_reviews_count"=>"199365"},
#      {"id"=>"2927",
#       "name"=>"Mary GrandPré",
#       "image_url"=>
#        "http://d202m5krfqbpi5.cloudfront.net/authors/1273594527p5/2927.jpg",
#       "small_image_url"=>
#        "http://d202m5krfqbpi5.cloudfront.net/authors/1273594527p2/2927.jpg",
#       "link"=>"http://www.goodreads.com/author/show/2927.Mary_GrandPr_",
#       "average_rating"=>"4.42",
#       "ratings_count"=>"8305205",
#       "text_reviews_count"=>"137439"}]},  

  task fetch_full_book_data: :environment do
    client = Goodreads::Client.new(:api_key => 'jMwSO69zYQ8ngMUfyt7Bow', :api_secret => 'ro6KLACP4Fg8fkbuwJKWjZL4rBgbSojniRr1CsMn8')

    # Note that there are currently ~87k books in the Childrens genre, so it will take ~1 day to fetch all the ISBN's
    # if they have all been fetched down to the local db.
    Book.where(isbn: nil).find_each do |book|
      result = client.book(book.goodreads_id)
      next if Book.find_by_isbn(result["isbn"])

      book.isbn = result["isbn"]
      book.image_url = result["image_url"]
      book.ratings_count = result["ratings_count"]
      book.ratings_sum = result["ratings_sum"]
      book.num_pages = result["num_pages"]
      pp %Q<#{result["title"]} -- #{result["isbn"]}>

      book.save!
      $stdout.flush
      sleep(1) # don't ddos their API or will ge throttled
    end
  end
end