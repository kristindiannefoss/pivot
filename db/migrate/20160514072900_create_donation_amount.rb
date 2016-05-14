class CreateDonationAmount < ActiveRecord::Migration
  def change
    create_table :donation_amounts do |t|
      t.references :donation, index: true, foreign_key: true
      t.references :need, index: true, foreign_key: true
      t.integer :quantity
    end
  end
end
