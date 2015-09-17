json.array!(@visitors) do |visitor|
  json.extract! visitor, :id, :full_name, :email, :status
  json.url visitor_url(visitor, format: :json)
end
