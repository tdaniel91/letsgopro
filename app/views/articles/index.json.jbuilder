json.array!(@articles) do |article|
  json.extract! article, :id, :user_id, :image, :article_title, :article_text
  json.url article_url(article, format: :json)
end
