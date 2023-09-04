ROW_LIMIT = 10
COL_LIMIT = 10

class Grid < ApplicationRecord
  belongs_to :event
  has_many :spaces, dependent: :destroy

  validates :rows, comparison: { greater_than: 0 }
  validates :cols, comparison: { greater_than: 0 }
  
  before_save :default_save

  def find_space(i, k)
    return spaces.find_by(position: i * cols + k)
  end

  private
  def default_save
    self.rows = ROW_LIMIT if self.rows > ROW_LIMIT 
    self.cols = COL_LIMIT if self.cols > COL_LIMIT
    (self.rows * self.cols).times do |index|
      self.spaces.new(available: true, position: index)
    end
  end
end
