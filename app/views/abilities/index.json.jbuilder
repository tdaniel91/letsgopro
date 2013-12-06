json.array!(@abilities) do |ability|
  json.extract! ability, :id, :user_id, :name
  json.url ability_url(ability, format: :json)
end
