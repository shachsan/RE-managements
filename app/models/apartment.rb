class Apartment < ApplicationRecord
  belongs_to :building
  belongs_to :agent
  belongs_to :lease, optional: true
  has_many :images

  def info
    "Building Name: #{self.building.name}, Unit: #{self.unit_no}, Occupied: #{!!self.lease_id}"
  end

end
