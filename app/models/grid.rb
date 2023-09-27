class Grid < ApplicationRecord
  ROW_LIMIT = 10
  COL_LIMIT = 10

  belongs_to :event

  validates :rows, comparison: { greater_than: 0 }
  validates :cols, comparison: { greater_than: 0 }

  def get_space(i, k)
    space = self.spaces.where(position: self.get_index(i, k)).first
  end

  def get_ticket(i, k)
    ticket = self.event.tickets.where(seat: get_index(i, k)).first
  end

  def get_index(i, k)
    return i * cols + k
  end

  before_validation :default_grid
  
  private

  def default_grid
    self.rows ||= ROW_LIMIT
    self.cols ||= COL_LIMIT
    self.cols = COL_LIMIT if self.cols > COL_LIMIT
    self.rows = ROW_LIMIT if self.rows > ROW_LIMIT
  end

end
