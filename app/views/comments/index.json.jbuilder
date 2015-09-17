json.array!(@comments) do |comment|
  json.extract! comment, :id, :message, :full_name, :status, :post_id, :visitor_id
  json.url comment_url(comment, format: :json)
end
