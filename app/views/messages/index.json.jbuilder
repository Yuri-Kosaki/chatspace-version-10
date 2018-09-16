json.array! @new_messages.each do |message|
  json.id message.id
  json.body message.body
  json.name message.user.name
  json.date message.created_at
  json.image message.image
end
