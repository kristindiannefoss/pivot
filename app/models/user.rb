class User < ActiveRecord::Base
  has_secure_password
  has_many :donations
  has_many :needs

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name,     presence: true
  validates :last_name,      presence: true
  validates :username,       presence: true, uniqueness: true
  validates :email,          presence: true, uniqueness: true
  validates :email,          format: { with: VALID_EMAIL_REGEX }
  validates :country,        presence: true

  enum role: %w(donor recipient admin)

  def total
    needs.pluck(:cost).sum
  end

  def raised
    needs.pluck(:raised).sum
  end
end
