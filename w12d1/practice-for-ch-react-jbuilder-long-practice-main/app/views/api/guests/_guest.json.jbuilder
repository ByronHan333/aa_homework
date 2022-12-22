json.extract! guest, :name, :age, :favorite_color
## Can't merge
##  didn't know how to merge the other top-level information into that array
# json.array! guest.gifts, :title, :description, :party

# json.gifts guest.gifts do |gift|
#   json.extract! gift, :title, :description, json.set! :party, party.name
# end

json.gifts guest.gifts do |gift|
  json.title gift.title
  json.description gift.description
  json.party gift.party.name
end
