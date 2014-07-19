json.array!(@admin_companies) do |admin_company|
  json.extract! admin_company, :id, :company_name, :company_address, :company_tel
  json.url admin_company_url(admin_company, format: :json)
end
