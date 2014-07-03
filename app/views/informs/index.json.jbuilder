json.array!(@informs) do |inform|
  json.extract! inform, :id, :company_id, :title, :author, :context
  json.url inform_url(inform, format: :json)
end
