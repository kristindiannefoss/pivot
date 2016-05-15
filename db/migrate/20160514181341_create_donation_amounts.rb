class CreateDonationAmounts < ActiveRecord::Migration
  def change
    create_table :donation_amounts do |t|
      t.references :need, index: true, foreign_key: true
      t.references :donation, index: true, foreign_key: true
      t.integer :quantity
    end
  end
end
