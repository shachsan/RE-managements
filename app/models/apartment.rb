class Apartment < ApplicationRecord
  belongs_to :building
  belongs_to :agent
  belongs_to :lease
  has_many :images
end
