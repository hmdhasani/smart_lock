json.array!(@locks) do |lock|
  json.extract! lock, :id, :name, :state, :serial
  json.url lock_url(lock, format: :json)
end
