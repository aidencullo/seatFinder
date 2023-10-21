json.extract! event, :id
json.rows event.grid.rows
json.cols event.grid.cols
json.spaces @event.spaces do |space|
  json.id space.id
  json.status space.status
end
