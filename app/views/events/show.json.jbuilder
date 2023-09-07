json.event do
  json.partial! "events/event", event: @event
end

json.tickets @event.tickets do |ticket|
  json.type "ticket"
  json.name ticket.name
  json.seat ticket.seat
end
