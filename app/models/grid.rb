ROW_LIMIT = 10
COL_LIMIT = 10

class Grid < ApplicationRecord
  belongs_to :event
  has_many :spaces, dependent: :destroy

  validates :rows, comparison: { greater_than: 0 }
  validates :cols, comparison: { greater_than: 0 }
  
  before_save :default_save
  after_initialize :default_initialize

  private
  def default_initialize
  end

  def default_save
    self.rows = ROW_LIMIT if self.rows > ROW_LIMIT 
    self.cols = COL_LIMIT if self.cols > COL_LIMIT
    (self.rows * self.cols).times do |index|
      self.spaces.new(available: true, position: index)
    end
  end
end
