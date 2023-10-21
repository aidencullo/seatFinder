class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :company

  has_many :tickets, dependent: :destroy 
  has_many :spaces, dependent: :destroy 
  has_one :grid, dependent: :destroy

  accepts_nested_attributes_for :grid

  before_validation :default_event

  def default_event
    self.company_id ||= 1
    self.venue_id ||= 1
    self.grid ||= build_grid
    self.spaces.new(status: 'available', position: 1)
  end

end
