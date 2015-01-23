json.array!(@generic_masters) do |generic_master|
  json.extract! generic_master, :id, :name, :full_name, :precedence, :table_name, :table_type
  json.url generic_master_url(generic_master, format: :json)
end
