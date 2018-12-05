class Apartment < ApplicationRecord
  belongs_to :building
  belongs_to :agent
  belongs_to :lease
  has_many :images

  def info
    "Building Name: #{self.building.name}, Unit: #{self.unit_no}, Occupied: #{!!self.lease_id}"
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def self.attributes
    [:unit_no, :size, :bedrooms, :rent, :electricity, :water, :gas, :lease_id, :building_id, :agent_id]
  end

end
