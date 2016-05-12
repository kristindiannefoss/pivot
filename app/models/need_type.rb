class NeedType < ActiveRecord::Base
  before_validation :assign_slug

  def assign_slug
    self.slug ||= name.parameterize if name
  end
end
