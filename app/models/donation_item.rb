class DonationItem < ActiveRecord::Base
  belongs_to :donation
  belongs_to :item
  validates :donation_id, presence: true
  validates :item_id, presence: true
  validates :quantity, presence: true

  def subtotal
    quantity * item.price
  end
end
