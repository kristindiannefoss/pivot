class User < ActiveRecord::Base
  has_secure_password
  has_many :orders

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name,     presence: true
  validates :last_name,      presence: true
  validates :username,       presence: true, uniqueness: true
  validates :email,          presence: true, uniqueness: true
  validates :email,          format: { with: VALID_EMAIL_REGEX }
  validates :image_url,      presence: true
  validates :country,        presence: true

  enum role: ["default", "recipient", "admin"]

  def total
    needs.pluck(:cost).sum
  end

  def raised
    needs.pluck(:donated).sum
  end
end
