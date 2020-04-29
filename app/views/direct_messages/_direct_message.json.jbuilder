json.extract! direct_message, :id, :name, :mail, :subject, :dm, :created_at, :updated_at
json.url direct_message_url(direct_message, format: :json)
