class RemoveCategoryFromNeedType < ActiveRecord::Migration
  def change
    remove_column :need_types, :category
  end
end
