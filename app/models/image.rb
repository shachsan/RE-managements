class Image < ApplicationRecord
  belongs_to :apartment
  belongs_to :building
end
