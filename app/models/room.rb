class Room < ApplicationRecord
  belongs_to :type
  belongs_to :build
  has_many :reservations
end
