class Ticket < ApplicationRecord
  belongs_to :space
  belongs_to :customer
end
