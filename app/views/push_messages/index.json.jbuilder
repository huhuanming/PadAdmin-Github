json.array!(@push_messages) do |push_message|
  json.extract! push_message, :id, :message
  json.url push_message_url(push_message, format: :json)
end
