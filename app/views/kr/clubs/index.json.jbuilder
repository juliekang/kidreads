json.array!(@memberships) do |membership|
  json.id membership.club_id
  club = membership.club

  json.club_name club.club_name
  json.club_type club.club_type
  json.membership_type membership.membership_type

  leader = nil
  json.members(club.members) do |member|
    json.id member.id
    json.username member.username
    json.first_name member.first_name
    json.last_name member.last_name
    mship = member.club_memberships.find { |m| m.club_id == club.id }
    leader = member if mship.membership_type == 'leader'
    json.membership_type mship.membership_type
  end

  json.leader_id leader.id
  json.leader leader.full_name
end