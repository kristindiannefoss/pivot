class Category < ActiveRecord::Base
  validates :name,  presence: true, uniqueness: true
  has_many :needs
  has_many :need_types

  def self.filter_categories
    categories = ["All Categories"]
    categories += pluck(:name)
  end
end
