class AddCategoryReferenceToNeedTypes < ActiveRecord::Migration
  def change
    add_reference :need_types, :category, index: true, foreign_key: true
  end
end
