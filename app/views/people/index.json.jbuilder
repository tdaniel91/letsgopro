json.array!(@people) do |person|
  json.extract! person, :id, :user_id, :name, :birthday_date, :city, :phone, :quote, :privacy
  json.url person_url(person, format: :json)
end
