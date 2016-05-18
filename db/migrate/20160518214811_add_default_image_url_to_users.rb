class AddDefaultImageUrlToUsers < ActiveRecord::Migration
  def change
    change_column :users, :image_url, :string, :default => "goat-girl.jpg"
  end
end
