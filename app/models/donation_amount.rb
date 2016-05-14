class DonationAmount < ActiveRecord::Base
  belongs_to :donation
  belongs_to :need

  validates :donation_id, presence: true
  validates :need_id, presence: true
  validates :quantity, presence: true

  def subtotal
    quantity * need.cost
  end
end
