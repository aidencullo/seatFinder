json.extract! event, :id, :venue_id, :company_id, :created_at, :updated_at
json.url event_url(event, format: :json)
