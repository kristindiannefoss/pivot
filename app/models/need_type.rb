class NeedType < ActiveRecord::Base
  before_validation :assign_slug

  validates :name,        presence: true
  validates :description, presence: true
  validates :name,        presence: true
  validates :cost,        presence: true
  validates :image_url,   presence: true

  def assign_slug
    self.slug ||= name.parameterize if name
  end
end
