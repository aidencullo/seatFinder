class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :company
  has_many :tickets
end
