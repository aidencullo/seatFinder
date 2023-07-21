class Movie < ApplicationRecord
  has_many :showings, dependent: :destroy
  validates :title, presence: true
end
