class Donation < ActiveRecord::Base
  belongs_to :user
  has_many :donation_items
  has_many :items, through: :donation_items
  validates :user_id, presence: true

  def self.format_time(time)
    time.strftime("%A, %b %d, %Y")
  end

  def update_time
    updated_at.strftime("%A, %b %d, %Y")
  end

  def total_price
    donation_items.map{ |oi| oi.subtotal }.sum
  end

  def donation_confirmed(cart)
    cart.contents.each_pair do |id, qty|
      donation_items.create(item_id: id, quantity: qty)
    end
  end
end
