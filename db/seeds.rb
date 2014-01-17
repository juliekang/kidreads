# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do 

ut1 = UserType.create!(label: "Kid", 
        description: "Kids can rate books, post reviews, track their own progress, and participate in book clubs.")
ut2 = UserType.create!(label: "Parent", 
        description: "Parents can create Reading Families as well as monitor their kids' progress.")
ut3 = UserType.create!(label: "Teacher", 
        description: "Teachers can create classrooms and monitor all their students' progress.")
ut4 = UserType.create!(label: "Admin", description: "Superuser ability.")


# # Table name: users
# #
# #  id              :integer          not null, primary key
# #  user_type_id    :integer          not null
# #  username        :string(255)      not null
# #  email           :string(255)      not null
# #  first_name      :string(255)      not null
# #  last_name       :string(255)      not null
# #  city            :string(255)
# #  state           :string(255)
# #  birthday        :date
# #  password_digest :string(255)      not null
# #  points          :integer
# #  created_at      :datetime         not null
# #  updated_at      :datetime         not null


p1 = User.create!(user_type_id: 2, username: 'mommy1', password: 'mommom',
                email: 'mom1@mom.me', first_name: 'Mom1', last_name: 'My',
                state: 'CA', city: 'Long Beach')
p2 = User.create!(user_type_id: 2, username: 'mommy2', password: 'mommom',
                email: 'mom2@mom.me', first_name: 'Mom2', last_name: 'My',
                state: 'CA', city: 'San Francisco')
kid1 = User.create!(user_type_id: 1, username: 'kid1', password: 'mommom',
                email: 'kid1@mom.me', first_name: 'Kid1', last_name: 'My',
                state: 'CA', city: 'Long Beach')
kid2 = User.create!(user_type_id: 1, username: 'kid2', password: 'mommom',
                email: 'kid2@mom.me', first_name: 'Kid2', last_name: 'My',
                state: 'CA', city: 'San Francisco')
kid3 = User.create!(user_type_id: 1, username: 'kid3', password: 'mommom',
                email: 'kid3@mom.me', first_name: 'Kid3', last_name: 'My',
                state: 'CA', city: 'San Francisco')
# # Table name: books
# #
# #  id            :integer          not null, primary key
# #  isbn          :string(255)
# #  title         :string(255)      not null
# #  author        :string(255)      not null
# #  pub_year      :integer
# #  genre         :string(255)
# #  num_pages     :integer
# #  reading_level :float
# #  created_at    :datetime         not null
# #  updated_at    :datetime         not null


b1 = Book.create!(isbn: '1596433590', title: "Boxers", author: 'Gene Luen Yang',
                 pub_year: 2013, genre: 'Graphic Novels', num_pages: 325, 
                 reading_level: 8)


b2 = Book.create!(isbn: '0375839143', title: "Alvin Ho: Allergic to Girls, School, and Other Scary Things", 
                 author: 'Lenore Look',
                 pub_year: 2008, genre: 'Humor', num_pages: 176, 
                 reading_level: 3.3)

b3 = Book.create!(isbn: '0060775858', title: "Goodnight Moon", 
                 author: 'Margaret Wise Brown',
                 pub_year: 1947, genre: 'Bedtime Stories', num_pages: 32, 
                 reading_level: 1.5)

b4 = Book.create!(isbn: '0545165822', title: "Stir It Up", 
                 author: 'Ramin Ganeshram',
                 pub_year: 2011, genre: 'Young Adult', num_pages: 176, 
                 reading_level: 7)

# # Table name: book_statuses
# #
# #  id         :integer          not null, primary key
# #  user_id    :integer          not null
# #  book_id    :integer          not null
# #  status     :string(255)      not null
# #  created_at :datetime         not null
# #  updated_at :datetime         not null

bs1 = BookStatus.create!(user_id: 3, book_id: 56, status: 'wish')
bs2 = BookStatus.create!(user_id: 3, book_id: 17, status: 'read')
bs3 = BookStatus.create!(user_id: 4, book_id: 10, status: 'current')
bs4 = BookStatus.create!(user_id: 4, book_id: 20, status: 'read')
bs5 = BookStatus.create!(user_id: 5, book_id: 100, status: 'wish')
bs6 = BookStatus.create!(user_id: 5, book_id: 256, status: 'current')

# == Schema Information
#
# Table name: clubs
#
#  id         :integer          not null, primary key
#  leader_id  :integer
#  club_name  :string(255)
#  club_type  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

c1 = Club.create!(club_name: "Mang Family", club_type: "family")
c2 = Club.create!(club_name: "Foo Family", club_type: "family")
c3 = Club.create!(club_name: "Mrs. Smith's First Grade Class 2013-2014", club_type: "classroom")

# == Schema Information
#
# Table name: club_memberships
#
#  id              :integer          not null, primary key
#  member_id       :integer
#  club_id         :integer
#  membership_type :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

cm1 = ClubMembership.create!(member_id: 1, club_id: 1, membership_type: 'leader')
cm2 = ClubMembership.create!(member_id: 2, club_id: 1, membership_type: 'adult')
cm3 = ClubMembership.create!(member_id: 3, club_id: 1, membership_type: 'kid')
cm4 = ClubMembership.create!(member_id: 2, club_id: 2, membership_type: 'leader')
cm5 = ClubMembership.create!(member_id: 4, club_id: 1, membership_type: 'kid')

end

