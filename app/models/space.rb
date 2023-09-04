class Space < ApplicationRecord
  belongs_to :grid  
  has_one :ticket
end
