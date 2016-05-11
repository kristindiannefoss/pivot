class DropItemsTable < ActiveRecord::Migration
  def change
    drop_table :order_items
    drop_table :items
  end
end
