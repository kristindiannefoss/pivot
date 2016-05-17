class AddQuantityToNeeds < ActiveRecord::Migration
  def change
    add_column :needs, :quantity, :integer
    add_column :needs, :max, :integer, default: 5
  end
end
