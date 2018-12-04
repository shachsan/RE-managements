class Building < ApplicationRecord
  has_many :apartments
  has_many :agents, through: :apartments
end
