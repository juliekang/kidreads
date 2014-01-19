json.array!(@memberships) do |membership|
  json.id membership.club_id
  club = @clubs.find(membership.club_id)

  json.club_name club.club_name
  json.club_type club.club_type
  json.membership_type membership.membership_type
  leader_id = ClubMembership.find_by_club_id_and_membership_type(membership.club_id, 'leader').member_id
  json.leader_id leader_id
  leader_user = User.find(leader_id)
  json.leader "#{leader_user.first_name} #{leader_user.last_name}"

  members = club.members
  json.members(members) do |member|
    json.id member.id
    json.username member.username
    json.first_name member.first_name
    json.last_name member.last_name
    json.membership_type ClubMembership.find_by_member_id_and_club_id(member.id, club.id).membership_type

  end
end