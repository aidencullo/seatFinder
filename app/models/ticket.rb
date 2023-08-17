class Ticket < ApplicationRecord
  belongs_to :customer
  belongs_to :event
  validates :seat, uniqueness: { scope: :event,
                                 message: "one seat # per event" }
end
