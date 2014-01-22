json.id @club.id
json.club_name @club.club_name
json.club_type @club.club_type

json.members(@club.members) do |member|
  json.id member.id
  json.username member.username
  json.first_name member.first_name
  json.last_name member.last_name
  mship = member.club_memberships.find { |m| m.club_id == @club.id }
  leader = member if mship.membership_type == 'leader'
  json.membership_type mship.membership_type
end

json.club_streams(@club_streams)