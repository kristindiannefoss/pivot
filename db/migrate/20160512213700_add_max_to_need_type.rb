class AddMaxToNeedType < ActiveRecord::Migration
  def change
    add_column :need_types, :max, :integer, default: 5
  end
end
