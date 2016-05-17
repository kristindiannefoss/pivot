class Need < ActiveRecord::Base
  before_validation :assign_slug

  belongs_to :user
  belongs_to :category

  validates :name,        presence: true
  validates :description, presence: true
  validates :cost,        presence: true
  validates :raised,      presence: true
  validates :description, presence: true
  validates :image_url,   presence: true

  def assign_slug
    self.slug ||= name.parameterize if name
  end

  def max_donate_amount
    cost - raised
  end
end
