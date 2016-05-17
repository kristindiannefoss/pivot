class AddAmountToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :amount, :integer
    add_column :donations, :need_slug, :string
    change_column :donations, :status, :string, default: "pending"
  end
end
