class Movie < ApplicationRecord
  has_many :showings, dependent: :destroy
  validates_presence_of :title
end
