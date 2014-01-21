json.array!(@streams) do |stream|
  json.id stream.id
  json.user_id stream.user_id
  json.username stream.username
  json.first_name stream.first_name
  json.last_name stream.last_name

  json.club_id stream.club_id
  json.club_name stream.club_name

  json.activity_verb stream.activity_verb
  json.activity_object stream.activity_object
  json.image_url stream.image_url
  json.url stream.url
  json.created_at stream.created_at

end