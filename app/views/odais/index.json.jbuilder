json.array! @more do |odai|
  json.odai_phot odai.image.url
  json.user odai.user.name
  json.odai_id odai.id
end
