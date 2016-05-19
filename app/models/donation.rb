class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :need
  has_many :donation_amounts
  has_many :needs, through: :donation_amounts
# validates :user_id, presence: true

  def self.format_time(time)
    time.strftime("%A, %b %d, %Y")
  end

  def update_time
    updated_at.strftime("%A, %b %d, %Y")
  end

  def total_cost
    donation_amounts.map{ |da| da.subtotal }.sum
  end

  def donation_confirmed(cart)
    cart.contents.each_pair do |id, qty|
      donation_amounts.create(need_id: id, quantity: qty)
    end
  end
end
