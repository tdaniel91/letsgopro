json.array!(@enterprises) do |enterprise|
  json.extract! enterprise, :id, :name, :history, :foundation, :email, :phone, :address, :areas, :projectos, :admin_id
  json.url enterprise_url(enterprise, format: :json)
end
