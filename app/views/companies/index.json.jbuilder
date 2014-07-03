json.array!(@companies) do |company|
  json.extract! company, :id, :admin_user_id, :company_name, :company_address, :company_tel
  json.url company_url(company, format: :json)
end
