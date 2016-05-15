class Category < ActiveRecord::Base
  validates :name,  presence: true, uniqueness: true
  has_many :needs
  has_many :need_types

  def self.find_from(needs)
    categories = ["All Categories"]
    categories += find(needs.pluck(:category_id).uniq).map(&:name)
  end
end
