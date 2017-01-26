json.extract! event, :id, :message, :hostname, :timestamp, :organization_id, :created_at, :updated_at
json.url organization_event_url(event.organization_id, event, format: :json)
