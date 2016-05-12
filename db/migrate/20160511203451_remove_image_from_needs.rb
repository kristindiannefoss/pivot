class RemoveImageFromNeeds < ActiveRecord::Migration
  def change
    remove_column :needs, :image, :string
  end
end
