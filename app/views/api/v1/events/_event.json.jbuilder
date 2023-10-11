json.extract! event, :id
json.tickets @event.tickets do |ticket|
  json.id ticket.id
end
