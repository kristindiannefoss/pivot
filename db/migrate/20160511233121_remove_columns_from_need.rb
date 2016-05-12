class RemoveColumnsFromNeed < ActiveRecord::Migration
  def change
    remove_column :needs, :avatar_file_name, :string
    remove_column :needs, :avatar_content_type, :string
    remove_column :needs, :avatar_file_size, :string
    remove_column :needs, :avatar_updated_at, :string
  end
end
