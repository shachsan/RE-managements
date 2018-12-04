class Building < ApplicationRecord
  has_many :apartments
  has_many :agents, through: :apartments
  has_many :images

  validates :address, presence:true
end
