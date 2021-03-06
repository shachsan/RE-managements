class Agent < ApplicationRecord
  has_many :apartments
  has_many :leases, through: :apartments
  has_many :buildings, through: :apartments

  validates :name, presence: true,

            length: {minimum:3, maximum:50}

            VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 105 },

            uniqueness: { case_sensitive: false },

            format: { with: VALID_EMAIL_REGEX }

  has_secure_password

  def greeting
    hour = Time.now.hour
    if hour >= 0 && hour < 12
      return "Morning"
    elsif hour >= 12 && hour < 16
      return "Afternoon"
    elsif hour >=16 && hour < 25
      return "Evening"
    end
  end

  def empty_apartments
    apartments.where(lease_id: nil)
  end

  def leases
    Lease.all.select{|lease| lease.agent_id == self.id}
  end

end
