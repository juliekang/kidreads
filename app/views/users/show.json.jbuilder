json.id @user.id
json.username @user.username
json.first_name @user.first_name
json.city @user.city
json.state @user.state
json.birthday @user.birthday

json.clubs(@user.clubs) do |json, club|
  json.id club.id
  json.club_name club.club_name
  membership = ClubMembership.find_by_club_id_and_member_id(club.id, @user.id)
  json.role membership.membership_type
end

json.books(@user.books) do |json, book|
  json.id book.id
  json.title book.title
  json.image_url book.image_url
end
