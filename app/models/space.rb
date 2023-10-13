class Space < ApplicationRecord
  belongs_to :event
  validates_presence_of :position
  validates :position, numericality: { greater_than: 0 }
end
