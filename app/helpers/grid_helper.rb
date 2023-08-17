module GridHelper
  def local_ticket(grid, i, k)
    return Ticket.where(event_id: grid.event_id, seat: grid_index(grid,
                                                                  i, k)).exists?
  end

  def local_ticket_path(grid, i, k)
    ticket = Ticket.find_by(event_id: grid.event_id, seat:
                                                    grid_index(grid, i, k))
    return ticket
  end

  def grid_index(grid, i, k)
    return i * grid.cols + k
  end
end
