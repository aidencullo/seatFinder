class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :company

  has_many :tickets, dependent: :destroy 
  has_one :grid, dependent: :destroy

  accepts_nested_attributes_for :grid

  after_initialize :init

  def init
    self.grid ||= build_grid
  end
end
