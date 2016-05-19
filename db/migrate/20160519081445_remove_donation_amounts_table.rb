class RemoveDonationAmountsTable < ActiveRecord::Migration
  def change
    drop_table :donation_amounts
  end
end
