json.array!(@products) do |product|
  json.extract! product, :id, :company_id, :product_name, :context
  json.url product_url(product, format: :json)
end
