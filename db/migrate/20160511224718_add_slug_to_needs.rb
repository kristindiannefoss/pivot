class AddSlugToNeeds < ActiveRecord::Migration
  def change
    add_column :needs, :slug, :string
  end
end
