class Build < ApplicationRecord
  has_many :rooms

  def adres
    "#{city} #{street} #{number}"
  end

end
