class Grid < ApplicationRecord
  belongs_to :event

  before_save :check

  validates :rows, comparison: { greater_than: 0 }
  validates :cols, comparison: { greater_than: 0 }
  
  private

  def check
    self.rows = 20 if self.rows > 20 
    self.cols = 20 if self.cols > 20 
  end
  
end
