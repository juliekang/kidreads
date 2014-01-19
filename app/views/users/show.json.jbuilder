json.id @user.id
json.username @user.username
json.first_name @user.first_name
json.city @user.city
json.state @user.state
json.birthday @user.birthday

json.clubs(@user.clubs) do |club|
  json.id club.id
  json.club_name club.club_name
  membership = ClubMembership.find_by_club_id_and_member_id(club.id, @user.id)
  json.role membership.membership_type
end

json.books(@user.books) do |book|
  json.id book.id
  json.title book.title
  json.image_url book.image_url
  bookStatus = BookStatus.find_by_user_id_and_book_id(@user.id, book.id).status
  json.status bookStatus
end

json.children(@user.children) do |child|
  json.id child.id
  json.first_name child.first_name
  json.birthday child.birthday

  json.childBooks(child.books) do |book|
    json.id book.id
    json.title book.title
    json.image_url book.image_url
  end
end