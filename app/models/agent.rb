class Agent < ApplicationRecord
  has_many :apartments
  has_many :buildings, through: :apartments
end
