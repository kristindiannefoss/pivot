class NeedType < ActiveRecord::Base
  before_validation :assign_slug
  belongs_to :category

  validates :name,        presence: true
  validates :description, presence: true
  validates :cost,        presence: true
  validates :image_url,   presence: true
  validates :slug,        presence: true
  validates :max,         presence: true

  def assign_slug
    self.slug ||= name.parameterize if name
  end
end
