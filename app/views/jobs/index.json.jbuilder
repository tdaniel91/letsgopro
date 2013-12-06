json.array!(@jobs) do |job|
  json.extract! job, :id, :user_id, :enterprise_id, :role, :begin, :end
  json.url job_url(job, format: :json)
end
