class AddRecipientIdAndNeedNameToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :recipient_id, :integer
    add_column :donations, :need_name, :string
  end
end
