class AddImageToNeeds < ActiveRecord::Migration
  def change
    add_column :needs, :image, :string
  end
end
