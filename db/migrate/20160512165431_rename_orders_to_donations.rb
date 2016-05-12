class RenameOrdersToDonations < ActiveRecord::Migration
  def change
    rename_table :orders, :donations
  end
end
