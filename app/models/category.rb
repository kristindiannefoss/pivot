class Category < ActiveRecord::Base
  validates :name,  presence: true, uniqueness: true
  has_many :needs
  has_many :need_types
end
