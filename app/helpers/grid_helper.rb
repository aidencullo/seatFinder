module GridHelper
  def has_ticket(grid, i, k)
    return Ticket.where(event_id: grid.event_id, seat: grid_index(grid,
                                                                  i, k)).exists?
  end

  def local_ticket(grid, i, k)
    ticket = Ticket.find_by(event_id: grid.event_id, seat:
                                                       grid_index(grid, i, k)) 
    return ticket
  end

  def grid_index(grid, i, k)
    return i * grid.cols + k
  end

  def space_available(grid, i, k)
    grid.spaces.where(position: grid_index(grid, i, k)).first.available
  end

  def local_space(grid, i, k)
    space = grid.spaces.where(position: grid_index(grid, i, k)).first
    return space
  end
end
