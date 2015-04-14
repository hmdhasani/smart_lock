json.array!(@locks) do |lock|
  json.extract! lock, :id, :name, :state
  json.url lock_url(lock, format: :json)
end
