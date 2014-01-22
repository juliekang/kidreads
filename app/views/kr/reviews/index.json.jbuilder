json.reviews(@reviews) do |review|
  json.id review.id
  json.user_id review.user_id
  json.username review.user.username
  json.rating review.rating
  json.content review.content
  json.date review.updated_at
end