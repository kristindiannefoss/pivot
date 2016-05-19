class AddNeedToDonation < ActiveRecord::Migration
  def change
    add_reference :donations, :need, index: true, foreign_key: true
  end
end
