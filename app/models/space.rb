class Space < ApplicationRecord
  belongs_to :grid  
  has_one :ticket

  default_scope { order(position: :desc) }
end
