class Room < ApplicationRecord
  belongs_to :type
  belongs_to :build
  has_many :reservations

  def room_adres
    "#{number} #{build.city} #{build.street} #{build.number}"
  end

end
