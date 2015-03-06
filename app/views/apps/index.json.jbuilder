json.array!(@apps) do |app|
  json.extract! app, :id, :email, :name, :date, :employment, :currently, :looking_for, :experience, :ideas, :linkedin, :heard_from
  json.url app_url(app, format: :json)
end
