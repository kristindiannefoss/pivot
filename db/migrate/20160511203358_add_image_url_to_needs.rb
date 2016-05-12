class AddImageUrlToNeeds < ActiveRecord::Migration
  def change
    add_column :needs, :image_url, :string
  end
end
