json.array!(@pads) do |pad|
  json.extract! pad, :id, :MAC_address
  json.url pad_url(pad, format: :json)
end
