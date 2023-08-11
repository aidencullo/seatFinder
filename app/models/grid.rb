class Grid < ApplicationRecord
  belongs_to :event

  after_initialize :set_defaults

  private
  def set_defaults
    self.rows = 5 if self.rows.blank?
    self.cols = 5 if self.cols.blank?
  end
  
end
