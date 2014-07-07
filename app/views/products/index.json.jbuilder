json.array!(@products) do |product|
  json.extract! product, :id, :product_name, :context, :created_at, :updated_at
  json.url product_url(product, format: :json)
end
