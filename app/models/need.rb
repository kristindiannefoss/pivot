class Need < ActiveRecord::Base
  before_validation :assign_slug
  after_validation :assign_total

  belongs_to :user
  belongs_to :category

  validates :name,        presence: true
  validates :description, presence: true
  validates :cost,        presence: true
  validates :raised,      presence: true
  validates :image_url,   presence: true
  validates :quantity,    presence: true

  def assign_slug
    self.slug ||= name.parameterize if name
  end

  def assign_total
    self.total ||= cost * quantity if cost && quantity
  end

  def max_donate_amount
    total - raised
  end

  def amount_needed
    max_donate_amount < 0 ? 0 : max_donate_amount
  end

  def update_raised(amount)
    update(raised: amount)
  end
end
