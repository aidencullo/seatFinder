module GridHelper
  def find_ticket(grid, i, k)
    return Ticket.where(event_id: grid.event_id, seat: grid_index(grid,
  i, k)).exists?
  end

  def grid_index(grid, i, k)
    return i * grid.cols + k
  end
end
