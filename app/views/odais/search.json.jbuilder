json.array! @odais do |odai|
  json.odai_phot odai.image.url
  json.user odai.user.name
  json.odai_id odai.id
  json.boke_count odai.bokes.count
  json.title odai.title
end