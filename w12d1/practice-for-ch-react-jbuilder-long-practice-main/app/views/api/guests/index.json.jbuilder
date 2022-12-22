# json.array! @guests.each do |guest|
#   json.name guest.name
#   json.age guest.age
#   json.favorite_color guest.favorite_color
# end

## need to add json.array!
## otherwise returns a single object straight away
# json.array! @guests.each do |guest|
#   json.extract! guest, :name, :age, :favorite_color
# end

# json.partial! 'api/guests/guest', collection: @guests, as: :guest

# json.array! @guests, partial: 'api/guests/guest', as: :guest

# json.array! @guests, partial: 'api/guests/guest', as: :guest

json.array! @guests.each do |guest|
  json.partial! guest
end
