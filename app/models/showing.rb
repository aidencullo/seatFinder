class Showing < ApplicationRecord
  belongs_to :movie
  validates :date, presence: true
end
