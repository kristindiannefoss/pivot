class AddCategoryRefToNeed < ActiveRecord::Migration
  def change
    add_reference :needs, :category, index: true, foreign_key: true
  end
end
