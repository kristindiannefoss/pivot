class RemoveCategoryFromNeed < ActiveRecord::Migration
  def change
    remove_column :needs, :category, :string
  end
end
