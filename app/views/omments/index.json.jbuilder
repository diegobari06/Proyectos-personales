json.array!(@omments) do |omment|
  json.extract! omment, :id, :user_id, :article_id, :body
  json.url omment_url(omment, format: :json)
end
