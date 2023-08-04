json.extract! ticket, :id, :customer_id, :event_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
