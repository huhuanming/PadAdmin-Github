json.array!(@plugins) do |plugin|
  json.extract! plugin, :id
  json.url plugin_url(plugin, format: :json)
end
