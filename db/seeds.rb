# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ut1 = UserType.create(label: "Kid", 
        description: "Kids can rate books, post reviews, track their own progress, and participate in book clubs.")
ut2 = UserType.create(label: "Parent", 
        description: "Parents can create Reading Families as well as monitor their kids' progress.")
ut3 = UserType.create(label: "Teacher", 
        description: "Teachers can create classrooms and monitor all their students' progress.")

b1 = Book.create(isbn: '1596433590', title: "Boxers", author: 'Gene Luen Yang',
                 pub_year: 2013, genre: 'Graphic Novels', num_pages: 325, 
                 reading_level: 8)


b2 = Book.create(isbn: '0375839143', title: "Alvin Ho: Allergic to Girls, School, and Other Scary Things", 
                 author: 'Lenore Look',
                 pub_year: 2008, genre: 'Humor', num_pages: 176, 
                 reading_level: 3.3)

b3 = Book.create(isbn: '0060775858', title: "Goodnight Moon", 
                 author: 'Margaret Wise Brown',
                 pub_year: 1947, genre: 'Bedtime Stories', num_pages: 32, 
                 reading_level: 1.5)