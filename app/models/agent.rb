class Agent < ApplicationRecord
  has_many :apartments
  has_many :buildings, through: :apartments

  validates :name, presence: true,

            length: {minimum:3, maximum:50}

            VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 105 },

            uniqueness: { case_sensitive: false },

            format: { with: VALID_EMAIL_REGEX }

  has_secure_password

end
