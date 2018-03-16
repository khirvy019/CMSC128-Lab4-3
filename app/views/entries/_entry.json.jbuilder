json.extract! entry, :id, :sender, :message, :created_at, :updated_at
json.url entry_url(entry, format: :json)
