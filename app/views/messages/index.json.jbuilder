json.array!(@messages) do |message|
  json.extract! message, :id, :message, :visitor_id
  json.url message_url(message, format: :json)
end
