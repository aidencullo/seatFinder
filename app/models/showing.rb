class Showing < ApplicationRecord
  belongs_to :movie
  validates :date, :time, presence: true
end
