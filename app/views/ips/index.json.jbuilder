json.array!(@ips) do |ip|
  json.extract! ip, :id, :user_name, :IP_address
  json.url ip_url(ip, format: :json)
end
