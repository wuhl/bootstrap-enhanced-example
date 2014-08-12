json.array!(@resources) do |resource|
  json.extract! resource, :id, :first_name, :last_name, :start
  json.url resource_url(resource, format: :json)
end
