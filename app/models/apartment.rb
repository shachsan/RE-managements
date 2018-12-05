class Apartment < ApplicationRecord
  belongs_to :building
  belongs_to :agent
  has_one :lease, dependent: :destroy  
  has_many :images

  def info
    "Name: #{self.name}, Building: #{self.building.name}, Unit: #{self.unit_no}, Occupied: #{!!self.lease_id}"
  end

end
