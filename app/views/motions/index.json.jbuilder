json.array!(@motions) do |motion|
  json.extract! motion, :id, :lock_id
  json.url motion_url(motion, format: :json)
end
