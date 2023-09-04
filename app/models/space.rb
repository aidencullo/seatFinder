class Space < ApplicationRecord
  belongs_to :grid
  has_one :ticket, dependent: :destroy

  default_scope { order(position: :desc) }
end
