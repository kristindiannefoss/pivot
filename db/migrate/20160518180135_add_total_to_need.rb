class AddTotalToNeed < ActiveRecord::Migration
  def change
    add_column :needs, :total, :integer
  end
end
