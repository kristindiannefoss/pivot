class Need < ActiveRecord::Base
  before_validation :assign_slug
  belongs_to :user

  def assign_slug
    self.slug ||= name.parameterize if name
  end

  def add_donation(num)
    update_attributes(raised: num.to_i + raised)
  end


end
