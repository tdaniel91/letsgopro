json.array!(@contacts) do |contact|
  json.extract! contact, :id, :user_id, :user2_id, :state
  json.url contact_url(contact, format: :json)
end
