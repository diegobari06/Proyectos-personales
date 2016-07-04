json.extract! @omment, :id, :user_id, :article_id, :body, :created_at, :updated_at
json.user do
  json.email @omment.user.email
end
