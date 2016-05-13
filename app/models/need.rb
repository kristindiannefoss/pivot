class Need < ActiveRecord::Base
  before_validation :assign_slug

  validates :name, presence: true
  validates :description, presence: true
  validates :cost, presence: true
  validates :raised, presence: true
  validates :image_url, presence: true

  belongs_to :user

  def assign_slug
    self.slug ||= name.parameterize if name
  end

  def add_donation(num)
    update_attributes(raised: num.to_i + raised)
  end
end
