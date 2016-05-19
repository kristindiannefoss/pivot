class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :need
  has_many :donation_amounts
  has_many :needs, through: :donation_amounts

  validates_presence_of :status,
                        :amount,
                        :need_name,
                        :need_slug,
                        :recipient_id,
                        :need_id

  def self.send_to_recipients
    donation_needs.each do |need|
      amount = find_by(need_name: need.name, recipient_id: need.user_id).amount
      need.update_raised(amount + need.raised)
    end
  end

  def self.donation_needs
    Need.where(
      name: pluck(:need_name),
      user_id: pluck(:recipient_id)
    )
  end

  def self.set_status_complete(ids)
    where(id: ids).update_all(status: "completed")
  end
end
